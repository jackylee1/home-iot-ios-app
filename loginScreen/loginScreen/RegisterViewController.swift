//
//  RegisterViewController.swift
//  loginScreen
//
//  Created by jt on 3/28/17.
//  Copyright © 2017 jt. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate {
	@IBOutlet weak var usernameTextField: usernameField!
	@IBOutlet weak var emailAddressTextField: usernameField!
	@IBOutlet weak var passwordTextField: passwordField!
	@IBOutlet weak var reenterTextField: passwordField!
	@IBOutlet weak var errorLabel: UILabel!
	
	let createAccountEndPoint = "http://71.89.76.3/login/createaccount/"

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.delegate = self
		emailAddressTextField.delegate = self
		passwordTextField.delegate = self
		reenterTextField.delegate = self
		
		errorLabel.text = ""
    }

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
	}
	
	@IBAction func didPress(_ sender: UIButton) {
		let username = usernameTextField.text!
		let emailAddress = emailAddressTextField.text!
		let password = passwordTextField.text!
		let checkPassword = reenterTextField.text!
		
		if(password != checkPassword) {
			errorLabel.text = "Error: passwords must match"
			passwordTextField.text = nil
			reenterTextField.text = nil
			return
		}
		
		let createAccountURL = createAccountEndPoint + "?username=\(username)&email=\(emailAddress)&password=\(password)"
		
		let url = URL(string: createAccountURL)
		let task = URLSession.shared.dataTask(with: url!) { (data,response,error) in
			if error != nil
			{
				self.errorLabel.text = "didn't get response"
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
									self.performSegue(withIdentifier: "registerToLoginView", sender: self)
								}
							} else {
								self.errorLabel.text = "something went wrong"
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
