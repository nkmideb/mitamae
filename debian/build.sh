#!/bin/bash
NAME=mitamae

dist=$1
version="$2"
gpg_agent_socket="$3"
gpg_user="$4"
if [ x"$gpg_user" = x"" ]; then
  echo "Usage: $0 <dist> <version> </path/to/S.gpg-agent> <gpg_user>"
  exit 1
fi

image_tag=mitamae-${dist}

set -ex
cd "$(dirname $0)/.."
here="$(pwd)"
docker build -f debian/Dockerfile.${dist} -t "$image_tag" "$here"
source_archive="${NAME}_${version}.orig.tar.gz"
git archive --format=tar --prefix "${NAME}-${version}/" "v${version}" | gzip > "$source_archive"
gpg --export "$gpg_user" > pub.asc
trap "rm pub.asc" EXIT

# Unlock GPG secret key when necessary
export GPG_TTY=$(tty)
echo | gpg -u "${gpg_user}" --clearsign --output /dev/null

mkdir -p debian/out

cmds=$(mktemp)
cat >${cmds} <<-EOF
tar xf /src/${source_archive}
ln -s /src/${source_archive} /build/
cd "${NAME}-${version}"
cp -a /debian .
gpg2 --import < /src/pub.asc
export DEBSIGN_KEYID=0x\$(gpg2 --with-colons --list-keys|grep '^sub:'|head|cut -d: -f 5)
sed -i -e 's/_dist_/${dist}/g' debian/changelog
debuild -pgpg2
cp -pv /build/*.{deb,debian.tar.xz,dsc,changes} /output/
chown $(id -u):$(id -g) /output/*
EOF

docker run --rm \
  --tty \
  --interactive \
  --volume "${here}/debian:/debian:ro" \
  --volume "${PWD}:/src:ro" \
  --volume "${here}/debian/out:/output" \
  --volume "${gpg_agent_socket}:/root/.gnupg/S.gpg-agent" \
  --volume "${cmds}:/run.sh:ro" \
  --workdir /build \
  "$image_tag" \
  bash -xe /run.sh

