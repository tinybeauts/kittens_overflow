// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function () {
    // Custom selects
    $("select").dropkick();
});

$(document).ready(function(){
  $('a.vote-button').on('ajax:success', function(xhr, data, status){
    $this = $(this);
    // debugger

    var voteCount = $(this).siblings('.vote-count').text();
    newVoteCount = parseInt(voteCount)+1
    $this.next('.vote-count').text(newVoteCount);

    $this.attr('data-remote', 'false');
    $this.attr('href', '#').addClass('loved');
    $this.on('click', function(e){ 
      e.preventDefault(); 
    });
  });

  var authButton = $('.auth-button');
    $('.lightbox').hide();

  authButton.on('click', function(e){
    e.preventDefault();
    var form = $($(this).attr('href'));
    var forms = $('.lightbox');
    
    $.each(forms, function(index, value){
      var value = $(value)
      if (value.attr('id') !== form.attr('id')){
        $(value).hide();
      }
    });
    form.toggle();
  });

  // $(document).on('click')


// Some general UI pack related JS

    // Todo list
    $(".todo li").click(function() {
        $(this).toggleClass("todo-done");
    });

    // Init tooltips
    $("[data-toggle=tooltip]").tooltip("show");

    // Init tags input
    $("#tagsinput").tagsInput();

    // Init jQuery UI slider
    $("#slider").slider({
        min: 1,
        max: 5,
        value: 2,
        orientation: "horizontal",
        range: "min",
    });

    // JS input/textarea placeholder
    $("input, textarea").placeholder();

    // Make pagination demo work
    $(".pagination a").click(function() {
        if (!$(this).parent().hasClass("previous") && !$(this).parent().hasClass("next")) {
            $(this).parent().siblings("li").removeClass("active");
            $(this).parent().addClass("active");
        }
    });

    $(".btn-group a").click(function() {
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
    });

    // Disable link click not scroll top
    $("a[href='#']").click(function() {
        return false
    });

});

