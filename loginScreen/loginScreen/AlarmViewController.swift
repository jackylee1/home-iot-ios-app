//
//  AlarmViewController.swift
//  loginScreen
//
//  Created by jt on 3/21/17.
//  Copyright © 2017 jt. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController {
	@IBOutlet weak var displayTimeSelected: UILabel!
	@IBOutlet weak var sendDataConsole: UILabel!
	@IBOutlet weak var currentAlarmTime: UILabel!
	@IBOutlet weak var alarmPicker: UIDatePicker!
	
	var alarmEndPoint = "http://71.89.76.3/setalarm/"
	
	let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		// clear labels
		displayTimeSelected.text = ""
		sendDataConsole.text = ""
		currentAlarmTime.text = ""
		
		// set up alarm picker with correct time
		// mode and minute interval
		alarmPicker.datePickerMode = .time
		alarmPicker.minuteInterval = 5
		
		// specify formatting of date content
		// from alarmPicker
		formatter.dateFormat = "HH:mm"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// when user changes alarmPicker update debugging label
	@IBAction func alarmTimeChanged(_ sender: UIDatePicker) {
		displayTimeSelected.text = formatter.string(from: alarmPicker.date)
	}

	// on button press, send data to web server
	// recognizes button press, needs somewhere to send data
	@IBAction func sendData(_ sender: UIButton) {
		sendDataConsole.text = "success"
		currentAlarmTime.text = formatter.string(from:alarmPicker.date)
		
		//get substrings
		let dateString = formatter.string(from:alarmPicker.date)
		var index = dateString.index(dateString.startIndex, offsetBy: 2)
		let alarmHour = dateString.substring(to: index)
		
		index = dateString.index(dateString.startIndex, offsetBy: 3)
		let alarmMinute = dateString.substring(from: index)
		
		//set url request
		alarmEndPoint = alarmEndPoint + alarmHour + alarmMinute
		
		var request = URLRequest.init(url: URL.init(string: alarmEndPoint)!)
		request.httpMethod = "GET"
		URLSession.shared.dataTask(with: request, completionHandler: {
			(data, response, error) in
			if(error != nil) {
				print("ERROR: \(error)")
			} else {
				
			}
		}).resume()
	}
	
}
