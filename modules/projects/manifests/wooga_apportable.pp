class projects::wooga_apportable {

  boxen::project { 'wooga_apportable':
    dir           => "/Users/${::luser}/Development/wooga/apportable",
    ruby          => '2.1.2',
    source        => 'wooga/apportable'
  }
}
