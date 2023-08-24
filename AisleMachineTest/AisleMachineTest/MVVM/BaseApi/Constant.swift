//
//  Constant.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import Foundation

import UIKit

struct Constants {

    static let baseUrl = "https://app.aisle.co/V1" 

    
}


enum EndPoint {
    case PhoneNo
    case VerifyOTP
    case Notes
  
}

var baseURL: URL {
    return URL(string: Constants.baseUrl)!
}
extension EndPoint {
    var path: String {
        switch self {
            
            //MARK: Registration
        case .PhoneNo:
            return "/users/phone_number_login"
        case .VerifyOTP:
            return "/users/verify_otp"
        case .Notes:
            return "/users/test_profile_list"
        }
    }
}
