class projects::apportable_apportable {
  # include icu4c
  # include phantomjs

  boxen::project { 'apportable_apportable':
    dir           => "/Users/${::luser}/Development/droid/apportable/apportable",
    # dotenv        => true,
    ruby          => '1.9.3-p448',
    source        => 'apportable/apportable'
  }
}