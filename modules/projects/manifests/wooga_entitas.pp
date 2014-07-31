class projects::wooga_entitas {

  boxen::project { 'wooga_entitas':
    dir           => "/Users/${::luser}/Development/wooga/entitas",
    ruby          => '2.1.2',
    source        => 'wooga/entitas'
  }
}
