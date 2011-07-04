<?php

class FriendFeed {
		
	function __construct() {
		
	}
	
	
    // Returns the entries shared by the user with the given nickname.
    //
    // Authentication is required if the user's feed is not public.
    function fetch_user_feed($nickname,$num) {
			
		$stream = fopen("http://friendfeed.com/api/feed/user/".$nickname."?num=".$num,"r");
		$user_feed = stream_get_contents($stream);
		
		return utf8_decode($user_feed);
		fclose($stream);
    }
	
	
    // Returns list of all of the user's subscriptions (people) and services connected to their account
    //
    // Authentication is required for private users.
    function get_user_profile($nickname) {
		
		$stream = fopen("http://friendfeed.com/api/user/".$nickname."/profile","r");
		$user_profile = stream_get_contents($stream);
		
		return utf8_decode($user_profile);
		fclose($stream);
    }
}
?>