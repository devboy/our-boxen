class projects::wooga_apportable {

  boxen::project { 'wooga_apportable':
    dir           => "/Users/${::luser}/Development/wooga/apportable",
    ruby          => '1.9.3-p448',
    source        => 'wooga/apportable'
  }
}
