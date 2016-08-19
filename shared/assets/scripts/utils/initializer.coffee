class Initializer

  initialize: ->
    @initialize_table_click()
    @initialize_semantic_ui()

  before_cache: () ->
    $('.flash-messages').remove()

  initialize_table_click: () ->
    $('table tbody tr').on('click', (e) ->
      Turbolinks.visit($(this).find('a').attr('href')) if not $(e.target).is('a')
    )

  initialize_semantic_ui: () ->
    $('.ui.dropdown').dropdown()

@initializer = new Initializer()
$(document).on('turbolinks:load', () -> initializer.initialize())
$(document).on('turbolinks:before-cache', () -> initializer.before_cache())
