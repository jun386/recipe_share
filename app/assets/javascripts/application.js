// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//   $(document).on('turbolinks:load', function() { 
//      const obj = document.getElementById("line-bc");
//  　　 obj.scrollTop = obj.scrollHeight;
//   });


    $(function(){
        var click = 0;
        $("#toggle_bar").click(function(){
            click++;
            if ((click % 2) != 0){
                $('#header_nav').css('height', '465px');
                $('#header_nav_signoff').css('height', '130px');
            } else {
                $('#header_nav').css('height', '65px');
                $('#header_nav_signoff').css('height', '65px');
            }
            $(".header-menus").stop().slideToggle(200);
        });
    });

    var $win = $(window);
    $win.on('load resize', function() {
      var windowWidth = window.innerWidth;
    
      if (windowWidth > 1000) {
        $(".header-menus").css('display', 'block');
        $('#header_nav').css('height', '65px');
        $('#header_nav_signoff').css('height', '65px');
      } else {
        $(".header-menus").css('display', 'none');
      }
    });
    
    