MRuby::Build.new do |conf|
  toolchain :gcc

  conf.gem __dir__

  conf.gem git: 'https://github.com/IceDragon200/mruby-catch-throw', checksum_hash: 'b2900a21e71efb4702c2750e6e9312f46d6d2560'
  conf.gem git: 'https://github.com/iij/mruby-dir.git', checksum_hash: '14bc5c3e51eac16ebc9075b7b62132a0cf5ae724'
  conf.gem git: 'https://github.com/gromnitsky/mruby-dir-glob.git', checksum_hash: '334c040a2e2c4c2689f8c3440168011f64d57ada'
  conf.gem git: 'https://github.com/iij/mruby-env.git', checksum_hash: '57f0d737a4ece49dc5b6f1c7ee09b0bc8f8adf87'
  conf.gem git: 'https://github.com/k0kubun/mruby-erb.git', checksum_hash: '978257e478633542c440c9248e8cdf33c5ad2074'
  conf.gem git: 'https://github.com/iij/mruby-errno.git', checksum_hash: 'b4415207ff6ea62360619c89a1cff83259dc4db0'
  conf.gem git: 'https://github.com/eagletmt/mruby-etc.git', checksum_hash: 'e36e8dd99c8c62bb8390c9142c46e0294ee90dbd'
  conf.gem git: 'https://github.com/ksss/mruby-file-stat.git', checksum_hash: '2d3ea9b5d59d2b41133228a71c110b75cb30a31e'
  conf.gem git: 'https://github.com/k0kubun/mruby-hashie.git', checksum_hash: 'bfdbb8aebc8786bc9e88469dae87a8dfe8ec4300'
  conf.gem git: 'https://github.com/mattn/mruby-http.git', checksum_hash: '22d4fccd820705f6bef8e8f4989bdb4cf435f576'
  conf.gem git: 'https://github.com/matsumotory/mruby-httprequest.git', checksum_hash: 'ab6bacc8a7e92fe541d01d9d9b1515a888b0bce3'
  conf.gem git: 'https://github.com/iij/mruby-iijson.git', checksum_hash: '589c2328f29a9334d47e3c1accc1677277d323dd'
  conf.gem git: 'https://github.com/iij/mruby-io.git', checksum_hash: '6836f424c5ff95d0114a426010b22254804bc9a3'
  conf.gem git: 'https://github.com/iij/mruby-mtest.git', checksum_hash: '7dd05a6aab055bf32dcc468aa3aaeb57a1aa880e'
  conf.gem git: 'https://github.com/mattn/mruby-onig-regexp.git', checksum_hash: 'cae968857757d95f592cee6a5fac46c6ecf74948'
  conf.gem git: 'https://github.com/k0kubun/mruby-open3.git', checksum_hash: 'b7480b6300a81d0e5fac469a36a383518e3dfc78'
  conf.gem git: 'https://github.com/fastly/mruby-optparse.git', checksum_hash: 'e6397a090d1efe04d5dab57c63897f0d79bbad89'
  conf.gem git: 'https://github.com/iij/mruby-pack.git', checksum_hash: '383a9c79e191d524a9a2b4107cc5043ecbf6190b'
  conf.gem git: 'https://github.com/luisbebop/mruby-polarssl.git', checksum_hash: '8b0865024255bf1cf325db3b8c93b46984a7e4f5'
  conf.gem git: 'https://github.com/iij/mruby-process.git', checksum_hash: '074a1e0bd93af38f33183351f171e2e4c1ec2e83'
  conf.gem git: 'https://github.com/k0kubun/mruby-shellwords.git', checksum_hash: '2a284d99b2121615e43d6accdb0e4cde1868a0d8'
  conf.gem git: 'https://github.com/matsumotory/mruby-simplehttp.git', checksum_hash: 'd018269b39934f74385e13a34957d6013eb0a4a1'
  conf.gem git: 'https://github.com/take-cheeze/mruby-socket.git', checksum_hash: '7b4978b639e9b73296f5ced39dbcb722bf42cd0d'
  conf.gem git: 'https://github.com/k0kubun/mruby-specinfra.git', checksum_hash: '22a54436fe53afd310ad4473d28edd03dd960a24'
  conf.gem git: 'https://github.com/iij/mruby-tempfile.git', checksum_hash: 'e2f56882fab5249f5203dc8259ac2504a3221ee4'
  conf.gem git: 'https://github.com/hone/mruby-yaml.git', checksum_hash: 'dd34566926a6f90667983052efc40143427fea49'

  conf.gem github: 'eagletmt/mitamae-secrets', checksum_hash: 'v0.1.1'
  conf.gem github: 'iij/mruby-ipaddr', checksum_hash: '95497ff1a67318a8e01f5d0cb56df9d359d0fe62'
end
