# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    if @notifications.length > 0
      @setup()

    setInterval (=>
      @getNewNotifications()
    ), 5000

  getNewNotifications: ->
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess 
    )
    
  setup: ->
    $("[data-behavior='notifications-link']").on "click", @handleClick

    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
        
    )

  handleClick: () ->
    $.ajax(
      url: "/notifications/mark_as_read.json"
      dataType: "JSON"
      method: "POST"
      success: ->
        $("[data-behavior='unread-count']").text(0)
    )

  handleSuccess: (data) =>
    items = $.map data, (notification) ->
      notification.template
    
    unread_count = 0
    $.each data, (i, notification) ->
      if notification.unread
        unread_count += 1

    if items.length > 0
      $("[data-behavior='notification-items']").html(items)
    else
      $("[data-behavior='notification-items']").html("<p>You have no new notifications</p>")
    
    $("[data-behavior='unread-count']").text(unread_count)

jQuery ->
  new Notifications