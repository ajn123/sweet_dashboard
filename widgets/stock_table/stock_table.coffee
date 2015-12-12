class Dashing.Stock_table extends Dashing.Widget
  ready: ->
    if @get('unordered')
      $(@node).find('ol').remove()
