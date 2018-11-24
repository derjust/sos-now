using Toybox.WatchUi;

class sosnowDelegate extends WatchUi.BehaviorDelegate {
	var inverse = false;
	var relatedView;
	
    function initialize(view) {
        BehaviorDelegate.initialize();
        relatedView = view;
    }
	
	function onNextPage() {
		System.println("delegate nextpage");
	
		return relatedView.toggleView();
	}

	function onPreviousPage() {
		System.println("delegate previouspage");
	
    	return relatedView.toggleView();
	}
 

    function onMenu() {
        //WatchUi.pushView(new Rez.Menus.MainMenu(), new sosnowMenuDelegate(), WatchUi.SLIDE_UP);
        
        return true;
    }

}