//
//  NotesViewModel.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import Foundation
import Alamofire
import UIKit

final class NotesViewModel{

   
     var notes: NotesDataModel?

 
    

    func NotesGetApi(Header: String, completion: @escaping (Result<NotesDataModel, Error>) -> Void) {
        let hearder: HTTPHeaders = ["Authorization": Header]
        let url="\(baseURL)"+"\(EndPoint.Notes.path)"
        print("Header -----------------",hearder)
        print("URL -----------------",url)
       
        
        AF.request(url, method: .get, headers: hearder)
            .validate()
            .responseDecodable(of: NotesDataModel.self) { response in // Note the change here
                switch response.result {
                case .success(let data):
                    self.notes = data // Assign the array of NotesDataModel
                    completion(.success(data))
                    print(data)
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
//
  
}

