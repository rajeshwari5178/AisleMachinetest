//
//  PhoneNoDataModel.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import Foundation




struct PhoneNoDataModel : Codable {
    
    let status : Bool?

    enum CodingKeys: String, CodingKey {

        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
    }

}
