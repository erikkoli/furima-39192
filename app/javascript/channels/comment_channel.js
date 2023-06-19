import consumer from "./consumer"

if(location.pathname.match(/\/exhibits\/\d/)){

  consumer.subscriptions.create("CommentChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
    }
  })
}