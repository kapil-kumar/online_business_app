# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 $(document).ready ->
   $('#slides').slidesjs
     width: 940,
     height: 528,
     play: 
       active: true,
       auto: false,
       interval: 4000,
       swap: true         