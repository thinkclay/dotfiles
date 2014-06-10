fs   = require 'fs'
path = require 'path'

TestStatusStatusBarView = require './test-status-status-bar-view'

module.exports =
  # Public: Active the package and initialize the test-status views.
  #
  # Returns nothing.
  activate: ->
    atom.config.setDefaults('test-status', {
      'Rakefile': 'rake test',
      'Gruntfile': 'grunt test'
      'script/test': 'script/test'
      'script/cibuild': 'script/cibuild'
      'deft-package.json': 'deft test'
    })

    createStatusEntry = =>
      @testStatusStatusBar = new TestStatusStatusBarView

    if atom.workspaceView.statusBar
      createStatusEntry()
    else
      atom.packages.once 'activated', ->
        createStatusEntry()

  # Public: Deactivate the package and destroy the test-status views.
  #
  # Returns nothing.
  deactivate: ->
    @testStatusStatusBar?.destroy()
    @testStatusStatusBar = null
