//
//  PhoneNoViewModel.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//



import Foundation
import Alamofire
import UIKit

final class PhoneNoViewModel{

    
    
    //function for api call and with view
    func SignupPostApi(parameter:[String:Any], completion: @escaping (Result<PhoneNoDataModel, Error>) -> Void) {
       
        
        let url="\(baseURL)"+"\(EndPoint.PhoneNo.path)"
            
       print(parameter,url)
            AF.request(url, method: .post, parameters: parameter)
                .validate()
                .responseDecodable(of: PhoneNoDataModel.self) { response in
                    switch response.result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
   
    

}
