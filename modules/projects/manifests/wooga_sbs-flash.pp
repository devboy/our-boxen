class projects::wooga_sbs-flash {

  boxen::project { 'wooga_wooga_sbs-flash':
    dir           => "/Users/${::luser}/Development/wooga/sbs-flash",
    ruby          => '2.1.2',
    source        => 'wooga/sbs-flash'
  }
}
