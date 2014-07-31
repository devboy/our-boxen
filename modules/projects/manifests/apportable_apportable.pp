class projects::apportable_apportable {

  boxen::project { 'apportable_apportable':
    dir           => "/Users/${::luser}/Development/apportable/apportable",
    ruby          => '2.1.2',
    source        => 'apportable/apportable'
  }

}
