$.home = {

  init: function(){
    this.getUser();
  },

  getUser: function(){
    $.get('/user.json', function(data){
      var user = JSON.parse(data.message);
      $('body').append('User: '+ user.first_name + ' ' + user.last_name);

      var color = window.location.pathname.split('/')[1];
      $('body').css('background', color);
    });
  }

}
