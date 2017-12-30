App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('.container').prepend data['message']
    # $('.container').prepend(' <div class="login-modal-wrapper2" id="login-modal">
    #   <div class="modal">
    #     <!-- モーダルの閉じるボタンのHTMLを貼り付けてください -->
    #     <div class = "close-modal">
    #       <i class="fa fa-2x fa-times"></i>
    #     </div>
    #
    #
    #     <div id="login-form">
    #
    #         <h2>ログイン</h2>
    #           <%=form_tag("/login") do%>
    #             <input name = "email" class="form-control" type="text" placeholder="メールアドレス">
    #             <input name = "password" class="form-control" type="password" placeholder="パスワード">
    #             <input class="submit-btn" type="submit" value="ログイン">
    #           <%end%>
    #     </div>
    #   </div>
    # </div>')

    
    # # 該当投稿の削除
    # $('#180').remove()

  speak: (message, group)->
    @perform 'speak',message: message, group: group


  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return = send
      App.room.speak event.target.value, $('#group').val()
      event.target.value = ''
      event.preventDefault()

  # $(document).on 'click', '[data-behavior~=room_speaker-btn]' ->
  #     App.room.speak
