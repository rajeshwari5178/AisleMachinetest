//
//  OTPDataModel.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import Foundation




struct OTPDataModel : Codable {
    let token : String?

    enum CodingKeys: String, CodingKey {

        case token = "token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}
