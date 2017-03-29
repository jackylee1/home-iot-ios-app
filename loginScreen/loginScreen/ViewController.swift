//
//  ViewController.swift
//  loginScreen
//
//  Created by jt on 3/20/17.
//  Copyright © 2017 jt. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
	@IBOutlet weak var forgotPassword: UIButton!
	@IBOutlet weak var usernameTextField: LoginTextField!
	@IBOutlet weak var passwordTextField: LoginTextField!
	@IBOutlet weak var errorResponse: UILabel!
	
	let loginEndPointBase: String = "http://71.89.76.3/login/"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let attributedString = NSAttributedString(string: "Forgot your Password?", attributes: [NSForegroundColorAttributeName:UIColor.white,NSUnderlineStyleAttributeName:1])
		
		forgotPassword.setAttributedTitle(attributedString, for: .normal)
		usernameTextField.delegate = self
		passwordTextField.delegate = self
		errorResponse.text = ""
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
	}
	
	@IBAction func tapLogIn(_ sender: Any) {
		let username = usernameTextField.text!
		let password = passwordTextField.text!
		let loginEndPoint = loginEndPointBase + "?username=\(username)&password=\(password)"
		let url = URL(string: loginEndPoint)
		let task = URLSession.shared.dataTask(with: url!) { (data,response,error) in
			if error != nil
			{
				print("ERROR")
			} else {
				if let content = data
				{
					do
					{
						let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
						if let didSucceed = myJson["success"] as? String
						{
							print(didSucceed)
							if (didSucceed == "true")
							{
								DispatchQueue.main.async {
									let nextViewController = (self.storyboard?.instantiateViewController(withIdentifier: "homeNavController"))! as! UINavigationController
									self.present(nextViewController,animated:true,completion:nil)
								}
							} else {
								self.errorResponse.text = "Incorrect username or password"
								self.passwordTextField.text = nil
							}
						}
					} catch {
						
					}
				}
			}
		}
		task.resume()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

