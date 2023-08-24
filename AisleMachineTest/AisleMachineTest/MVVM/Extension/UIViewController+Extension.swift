//
//  UIViewController+Extension.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import Foundation
import SwiftMessages
import UIKit

extension UIViewController {
    func ShowBottomToast(title: String, body: String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        
        view.configureTheme(.success)
        view.configureDropShadow()
        view.backgroundColor = .white
        view.configureTheme(backgroundColor: UIColor.white, foregroundColor: UIColor.black)
        view.button?.isHidden = true // Hide the button
        view.configureContent(title: title, body:body,iconImage: UIImage(named: "AisleImage")!)
        
        SwiftMessages.show(config: buildConfig(), view: view)
       
    }
    func buildConfig() -> SwiftMessages.Config {
        var config = SwiftMessages.Config()
        config.presentationStyle = .center
        config.duration = .seconds(seconds: 3)
      
        return config
    }
}


extension String{
    func isValidPhone() -> Bool {
        
        let regex = try! NSRegularExpression(pattern: "^[0-9]\\d{9}$", options: .caseInsensitive)
        let valid = regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        print("Mobile validation \(valid)")
        return valid
    }
}
    
