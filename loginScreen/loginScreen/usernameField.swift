//
//  usernameField.swift
//  loginScreen
//
//  Created by jt on 3/21/17.
//  Copyright © 2017 jt. All rights reserved.
//

import UIKit

class usernameField: UITextField, UITextFieldDelegate {

	override func layoutSubviews()
	{
		super.layoutSubviews()
		
		self.layer.borderColor = UIColor(white: 200 / 255, alpha: 1).cgColor
		
		self.layer.borderWidth = 2
	}
	
	override func textRect(forBounds bounds: CGRect) -> CGRect {
		return bounds.insetBy(dx: 8, dy: 7)
	}
	
	override func editingRect(forBounds bounds: CGRect) -> CGRect {
		return textRect(forBounds: bounds)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		return false
	}

}
