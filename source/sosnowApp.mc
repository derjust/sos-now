using Toybox.Application;
using Toybox.Attention;
using Toybox.Test;
using Toybox.Timer;
using Toybox.WatchUi;

class sosnowApp extends Application.AppBase {
	const SHORT_PAUSE = 1000;
	const LONG_PAUSE = 3000;
	const RESTART_PAUSE = SHORT_PAUSE + LONG_PAUSE;
	
	var view = new sosnowView();
	var letter = 0;
	var myTimer;
	
    function initialize() {
        AppBase.initialize();
    }
    
    // Return the initial view of your application here
    function getInitialView() {
    	
        return [ view , new sosnowDelegate(view) ];
    }

    // onStart() is called on application start up
    function onStart(state) {
    	myTimer = new Timer.Timer();
    	notificationLoop();
    }
    
    // onStop() is called when your application is exiting
    function onStop(state) {
    	myTimer.stop();
    }
    
    // The main loop that is actually a state machine 
    // iterating through all states while calling itself
    // again via a timer
	function notificationLoop() {
		var pause = -1;
		switch (letter) {
			case 0: // S
			soundShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 1: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 2: // S
			soundShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 3: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 4: // S
			soundShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 5: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 6: // O
			soundLong();
			backlightOn();
			pause = LONG_PAUSE;
			break;
			
			case 7: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 8: // O
			soundLong();
			backlightOn();
			pause = LONG_PAUSE;
			break;
			
			case 9: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 10: // O
			soundLong();
			backlightOn();
			pause = LONG_PAUSE;
			break;
			
			case 11: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 12: // S
			soundShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 13: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 14: // S
			soundShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 15: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 16: // S
			soundShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 17: // blank
			backlightOff();
			// Mark the new iteration with a longer pause
			pause = RESTART_PAUSE; 
			letter = -1;
			break;
		}
	
		Test.assertMessage(pause >= 0, "Paue must be greater than zero!");
		letter = letter + 1;
		view.toggleView();
	    myTimer.start(method(:notificationLoop), pause, false);
		
	}
	
	
    function soundShort() {
    	if (Attention has :playTone) {
	    	System.println("playTone: HI");
	    	
   			Attention.playTone(Attention.TONE_LOUD_BEEP);
    	}
    }
    
    function soundLong() {
    	if (Attention has :playTone) {
	    	System.println("playTone: LO");
    	
   			Attention.playTone(Attention.TONE_ALARM);
    	}
    }
    
    function backlightOn() {
		if (Attention has :backlight) {
	    	System.println("backlight: on");
		
			Attention.backlight(true);
		}
    }
    
    function backlightOff() {
		if (Attention has :backlight) {
	    	System.println("backlight: off");
		
			Attention.backlight(false);
		}
    }
	
}
