class projects::devboy_emscripten {

  boxen::project { 'devboy_emscripten':
    dir           => "/Users/${::luser}/Development/devboy/emscripten",
    ruby          => '2.1.2',
    source        => 'kripken/emscripten'
  }

}
