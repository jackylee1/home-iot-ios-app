//
//  LightingViewController.swift
//  loginScreen
//
//  Created by jt on 3/26/17.
//  Copyright © 2017 jt. All rights reserved.
//

import UIKit

class LightingViewController: UIViewController {
	let onEndPoint: String = "http://71.89.76.3/blink/on"
	let offEndPoint: String = "http://71.89.76.3/blink/off"
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func turnOn(_ sender: UIButton) {
		var request = URLRequest.init(url: URL.init(string: self.onEndPoint)!)
		request.httpMethod = "GET"
		URLSession.shared.dataTask(with: request, completionHandler: {
			(data, response, error) in
			if(error != nil) {
				print("ERROR: \(error)")
			} else {
				
			}
		}).resume()
	}

	@IBAction func turnOff(_ sender: UIButton) {
		var request = URLRequest.init(url: URL.init(string: self.offEndPoint)!)
		request.httpMethod = "GET"
		URLSession.shared.dataTask(with: request, completionHandler: {
			(data, response, error) in
			if(error != nil) {
				print("ERROR: \(error)")
			} else {
				
			}
		}).resume()
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
