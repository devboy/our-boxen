class projects::wooga_apportable {
  # include icu4c
  # include phantomjs

  boxen::project { 'wooga_apportable':
    dir           => "/Users/${::luser}/Development/droid/wooga/apportable",
    # dotenv        => true,
    ruby          => '1.9.3-p448',
    source        => 'wooga/apportable'
  }
}