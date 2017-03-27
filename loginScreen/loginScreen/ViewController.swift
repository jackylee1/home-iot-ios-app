//
//  ViewController.swift
//  loginScreen
//
//  Created by jt on 3/20/17.
//  Copyright © 2017 jt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var forgotPassword: UIButton!
	@IBOutlet weak var usernameTextField: LoginTextField!
	@IBOutlet weak var passwordTextField: LoginTextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let attributedString = NSAttributedString(string: "Forgot your Password?", attributes: [NSForegroundColorAttributeName:UIColor.white,NSUnderlineStyleAttributeName:1])
		
		forgotPassword.setAttributedTitle(attributedString, for: .normal)
	}
	
	
	@IBAction func tapLogIn(_ sender: Any) {
		// let username = usernameTextField.text!
		// let password = passwordTextField.text!
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

