using Toybox.WatchUi;

class sosnowView extends WatchUi.View {
	var inverse = true;
	
    function initialize() {
        View.initialize();
    }
    
    function toggleView() {
    	inverse = !inverse;
    	
    	System.println("Toggled: " + inverse);
    	
    	WatchUi.requestUpdate();
    }

    // Load your resources here
    function onLayout(dc) {
    
    	System.println("onLayout");
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
    
    	System.println("onUpdate");
    	
    	if (inverse) {
	        setLayout(Rez.Layouts.MainLayout(dc));
    	} else {
	        setLayout(Rez.Layouts.InverseLayout(dc));
    	}
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

}
