class projects::wooga_sbs-js {

  boxen::project { 'wooga_wooga_sbs-js':
    dir           => "/Users/${::luser}/Development/wooga/sbs-js",
    ruby          => '2.1.2',
    source        => 'wooga/sbs-js-sdk'
  }
}
