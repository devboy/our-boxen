class projects::apportable_apportable {

  boxen::project { 'apportable_apportable':
    dir           => "/Users/${::luser}/Development/apportable/apportable",
    ruby          => '1.9.3-p448',
    source        => 'apportable/apportable'
  }
  
}
