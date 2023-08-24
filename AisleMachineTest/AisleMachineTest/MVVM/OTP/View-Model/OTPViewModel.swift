//
//  OTPViewModel.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import Foundation
import Alamofire
import UIKit

final class OTPViewModel{

   
  
    func OTPVerify(parameters: [String:Any], completion: @escaping (Result<OTPDataModel, Error>) -> Void) {
        let url="\(baseURL)"+"\(EndPoint.VerifyOTP.path)"
       print("Paramters---------\(parameters)")
       print("URL---------\(url)")
        
            AF.request(url, method: .post, parameters: parameters)
                .validate()
                .responseDecodable(of: OTPDataModel.self) { response in
                    switch response.result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
   
    

}
