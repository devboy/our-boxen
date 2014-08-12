class projects::apportable_corefoundation {

  boxen::project { 'apportable_corefoundation':
    dir           => "/Users/${::luser}/Development/apportable/CoreFoundation",
    ruby          => '2.1.2',
    source        => 'apportable/CoreFoundation'
  }

}
