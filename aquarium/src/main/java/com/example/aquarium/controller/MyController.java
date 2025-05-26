package com.example.aquarium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {

	@GetMapping("/")
	public String root() {
		return "index";
	}
	
	@GetMapping("/userGuide/main")
	public String userGuideMain() {
		return "userGuide/userGuideMain";
	}
	
	@GetMapping("userGuide/playing")
	public String userPlaying() {
		return "userGuide/playingPg";
	}
	
	@GetMapping("userGuide/seaFriends")
	public String seaFriends() {
		return "userGuide/seaFriendsPg";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
}
