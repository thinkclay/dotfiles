{View} = require 'atom'

Convert = require 'ansi-to-html'

module.exports =
# Internal: A tool-panel view for the test result output.
class TestStatusView extends View

  # Internal: Initialize test-status output view DOM contents.
  @content: ->
    @div tabIndex: -1, class: 'test-status-output tool-panel panel-bottom padded', =>
      @div class: 'block', =>
        @div class: 'message', outlet: 'testStatusOutput'

  # Internal: Initialize the test-status output view and event handlers.
  initialize: ->
    @output = "<strong>No output</strong>"
    @testStatusOutput.html(@output).css('font-size', "#{atom.config.getInt('editor.fontSize')}px")

    atom.workspaceView.command "test-status:toggle-output", =>
      @toggle()

  # Internal: Update the test-status output view contents.
  #
  # output - A string of the test runner results.
  #
  # Returns nothing.
  update: (output) ->
    convert = new Convert
    @output = convert.toHtml(output)
    @testStatusOutput.html("<pre>#{@output.trim()}</pre>")

  # Internal: Detach and destroy the test-status output view.
  #
  # Returns nothing.
  destroy: ->
    @detach()

  # Internal: Toggle the visibilty of the test-status output view.
  #
  # Returns nothing.
  toggle: ->
    if @hasParent()
      @detach()
    else
      atom.workspaceView.prependToBottom(this) unless @hasParent()
