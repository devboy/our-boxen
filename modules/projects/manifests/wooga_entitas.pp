class projects::wooga_entitas {
  # include icu4c
  # include phantomjs

  boxen::project { 'wooga_entitas':
    dir           => "/Users/${::luser}/Development/droid/wooga/entitas",
    # dotenv        => true,
    # ruby          => '1.9.3-p448',
    source        => 'wooga/oc-entitas'
  }
}