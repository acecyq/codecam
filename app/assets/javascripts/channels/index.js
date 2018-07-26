//= require cable
//= require_self
//= require_tree

this.App = {};

App.cable = ActionCable.createConsumer();


App.messages = App.cable.subscriptions.create('MessagesChannel', {  
    received: function(data) {
        console.log(data)
    },
  });