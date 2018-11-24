using Toybox.Application;
using Toybox.WatchUi;
using Toybox.Timer;
using Toybox.Attention;

class sosnowApp extends Application.AppBase {
	var view = new sosnowView();
	var letter = 0;
	var offset = 1;
	var myTimer;
	
	var SHORT_PAUSE = 1000;
	var LONG_PAUSE = 3000;
	
    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    	myTimer = new Timer.Timer();
    	timerCallback();
    }
    
    function triggerShort() {
    	if (Attention has :playTone) {
	    	System.println("playTone: HI");
	    	
   			Attention.playTone(Attention.TONE_LOUD_BEEP);
    	}
    }
    
    function triggerLong() {
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
	
	function timerCallback() {
		var pause = -1;
		switch (letter) {
			case 0: // S
			triggerShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 1: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 2: // S
			triggerShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 3: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 4: // S
			triggerShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 5: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 6: // O
			triggerLong();
			backlightOn();
			pause = LONG_PAUSE;
			break;
			
			case 7: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 8: // O
			triggerLong();
			backlightOn();
			pause = LONG_PAUSE;
			break;
			
			case 9: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 10: // O
			triggerLong();
			backlightOn();
			pause = LONG_PAUSE;
			break;
			
			case 11: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 12: // S
			triggerShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 13: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 14: // S
			triggerShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 15: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			break;
			
			case 16: // S
			triggerShort();
			backlightOn();
			pause = SHORT_PAUSE;
			break;
			
			case 17: // blank
			backlightOff();
			pause = SHORT_PAUSE;
			letter = -1;
			break;
		}
	
		Test.assertMessage(pause >= 0, "Paue must be greater than zero!");
		letter = letter + 1;
		view.toggleView();
	    myTimer.start(method(:timerCallback), pause, false);
		
	}
	
    // onStop() is called when your application is exiting
    function onStop(state) {
    	myTimer.stop();
    }

    // Return the initial view of your application here
    function getInitialView() {
    	
        return [ view , new sosnowDelegate(view) ];
    }
}
