var Build = {
  
  initialize: function() {
    console.log("initializing build...")
    this.refresh();
  },
  refresh: function() {    
    var building = $(".building");
    var output = $(".output");
    if (building.length > 0 && output.length > 0) {
      $('#content').load(window.location.pathname + " #build_container", function() {
		    // scroll bottom
        $(".output").scrollTop($(".output")[0].scrollHeight);

        setTimeout('Build.refresh()', 200);
      });
    }
  }  
}

$(function() {
  Build.initialize();
});
