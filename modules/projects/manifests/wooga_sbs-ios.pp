class projects::wooga_sbs-ios {

  boxen::project { 'wooga_wooga_sbs-ios':
    dir           => "/Users/${::luser}/Development/wooga/sbs-ios",
    ruby          => '2.1.2',
    source        => 'wooga/sbs-ios'
  }
}
