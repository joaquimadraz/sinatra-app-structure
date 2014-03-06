$.home = {
 
  init: function(){
    this.callRandomUser();
  },

  callRandomUser: function(){
    $.get('/random_user.json', function(data){
      $('body').append('User: '+ data.message);

      var color = window.location.pathname.split('/')[1];
      $('body').css('background', color);
    });
  }

}