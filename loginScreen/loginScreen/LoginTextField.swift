//
//  LoginTextField.swift
//  loginScreen
//
//  Created by jt on 3/20/17.
//  Copyright © 2017 jt. All rights reserved.
//

import UIKit

@IBDesignable
class LoginTextField: UITextField {
	
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
}
