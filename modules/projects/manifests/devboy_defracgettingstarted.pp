class projects::devboy_defracgettingstarted {

  boxen::project { 'devboy_defracgettingstarted':
    dir           => "/Users/${::luser}/Development/devboy/defrac-getting-started",
    source        => 'devboy/defrac-getting-started'
  }

}
