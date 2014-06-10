{spawn} = require 'child_process'

{View} = require 'atom'

TestStatusView = require './test-status-view'
CommandRunner = require './command-runner'

module.exports =
# Internal: A status bar view for the test status icon.
class TestStatusStatusBarView extends View

  # Internal: Initialize test-status status bar view DOM contents.
  @content: ->
    @div class: 'inline-block', =>
      @span outlet:  'testStatus', class: 'test-status icon icon-hubot', tabindex: -1, ''

  # Internal: Initialize the status bar view and event handlers.
  initialize: ->
    @testStatusView = new TestStatusView
    @commandRunner = new CommandRunner(@testStatus, @testStatusView)
    @attach()

    atom.workspace.eachEditor (editor) =>
      @subscribeBufferEvents(editor)

    @subscribe this, 'click', =>
      @testStatusView.toggle()

    atom.workspaceView.command "test-status:run-tests", =>
      @commandRunner.run()

  # Internal: Attach the status bar view to the status bar.
  #
  # Returns nothing.
  attach: ->
    atom.workspaceView.statusBar.appendLeft(this)

  # Internal: Detach and destroy the test-status status barview.
  #
  # Returns nothing.
  destroy: ->
    atom.workspace.eachEditor (editor) =>
      @unsubscribeBufferEvents(editor)

    @testStatusView.destroy()
    @testStatusView = null
    @detach()

  # Internal: Subscribe to events on the editor buffer.
  #
  # editor - An editor instance to handle buffer events for.
  #
  # Returns nothing.
  subscribeBufferEvents: (editor) ->
    buffer = editor.getBuffer()

    @subscribe buffer.on 'saved', =>
      @commandRunner.run()

    @subscribe buffer.on 'destroyed', =>
      @testStatus.removeClass('pending success fail')
      @unsubscribe(buffer)

  # Internal: Unsubscribe from all events on the editor buffer.
  #
  # Returns nothing.
  unsubscribeBufferEvents: (editor) ->
    buffer = editor.getBuffer()
    @unsubscribe(buffer)
