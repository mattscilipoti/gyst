// Table of Contents helper
// see: http://www.jankoatwarpspeed.com/post/2009/08/20/Table-of-contents-using-jQuery.aspx
// I chose the Scaled TOC
//
function toc() {
  $("h1, h2, h3").each(function(i) {
    var current = $(this);
    current.attr("id", "title" + i);

    var link_top = current.position().top / $("#container").height() * ($(window).height()-120);
    link_top = link_top + 120; 
    $("#toc").append("<a id='link" + i + "' href='" + location.pathname + "#title" + i + "' title='" + current.attr("tagName") + "'>" +
    current.html() + "</a>");
    
    $("#link" + i).css("top", link_top).css("z-index", 2).ellipsis();
  });
};

