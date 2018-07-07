MRuby::Build.new do |conf|
  toolchain :gcc

  conf.gem __dir__

  conf.gem github: 'ksss/mruby-at_exit', checksum_hash: '09af1ecdce7b39582023c7614f8305386ee4d789'
  conf.gem github: 'IceDragon200/mruby-catch-throw', checksum_hash: 'b2900a21e71efb4702c2750e6e9312f46d6d2560'
  conf.gem github: 'iij/mruby-dir', checksum_hash: '14bc5c3e51eac16ebc9075b7b62132a0cf5ae724'
  conf.gem github: 'gromnitsky/mruby-dir-glob', checksum_hash: '334c040a2e2c4c2689f8c3440168011f64d57ada'
  conf.gem github: 'iij/mruby-env', checksum_hash: '57f0d737a4ece49dc5b6f1c7ee09b0bc8f8adf87'
  conf.gem github: 'k0kubun/mruby-erb', checksum_hash: '978257e478633542c440c9248e8cdf33c5ad2074'
  conf.gem github: 'iij/mruby-errno', checksum_hash: 'b4415207ff6ea62360619c89a1cff83259dc4db0'
  conf.gem github: 'eagletmt/mruby-etc', checksum_hash: 'e36e8dd99c8c62bb8390c9142c46e0294ee90dbd'
  conf.gem github: 'ksss/mruby-file-stat', checksum_hash: '2d3ea9b5d59d2b41133228a71c110b75cb30a31e'
  conf.gem github: 'k0kubun/mruby-hashie', checksum_hash: 'bfdbb8aebc8786bc9e88469dae87a8dfe8ec4300'
  conf.gem github: 'iij/mruby-iijson', checksum_hash: '589c2328f29a9334d47e3c1accc1677277d323dd'
  conf.gem github: 'iij/mruby-io', checksum_hash: '6836f424c5ff95d0114a426010b22254804bc9a3'
  conf.gem github: 'iij/mruby-ipaddr', checksum_hash: '95497ff1a67318a8e01f5d0cb56df9d359d0fe62'
  conf.gem github: 'mattn/mruby-onig-regexp', checksum_hash: '973b2ac4be1532155612627050a86c1237d9a29a'
  conf.gem github: 'k0kubun/mruby-open3', checksum_hash: 'b7480b6300a81d0e5fac469a36a383518e3dfc78'
  conf.gem github: 'fastly/mruby-optparse', checksum_hash: 'e6397a090d1efe04d5dab57c63897f0d79bbad89'
  conf.gem github: 'iij/mruby-pack', checksum_hash: '383a9c79e191d524a9a2b4107cc5043ecbf6190b'
  conf.gem github: 'iij/mruby-process', checksum_hash: 'bd288a930d4f61fbda1865deb8997245dc5fd38c'
  conf.gem github: 'k0kubun/mruby-shellwords', checksum_hash: '2a284d99b2121615e43d6accdb0e4cde1868a0d8'
  conf.gem github: 'iij/mruby-socket', checksum_hash: 'a8b6d6ee4c6ccea81a805cc9204b36c3792123c9'
  conf.gem github: 'k0kubun/mruby-specinfra', checksum_hash: 'd802a755cfa94675c6df80547ca553abb323ec7f'
  conf.gem github: 'iij/mruby-tempfile', checksum_hash: 'e2f56882fab5249f5203dc8259ac2504a3221ee4'
  conf.gem github: 'zzak/mruby-uri', checksum_hash: 'e465bf687ba832cea6c9dd30db78ff6690148105'

  conf.gem github: 'k0kubun/mruby-yaml', checksum_hash: 'b0b57f077f7d910516183f14750a3eeee5a7ecbc' # https://github.com/hone/mruby-yaml/pull/3

  conf.gem github: 'eagletmt/mitamae-secrets', checksum_hash: 'v0.1.1'
  conf.gem github: 'iij/mruby-ipaddr', checksum_hash: '95497ff1a67318a8e01f5d0cb56df9d359d0fe62'
end
