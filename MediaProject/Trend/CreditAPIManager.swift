//
//  CreditAPIManager.swift
//  MediaProject
//
//  Created by 은서우 on 2024/01/25.
//

import UIKit
import Alamofire

class CreditAPIManager {
    
    func callRequest(id: Int, completionHandler: @escaping (Credit) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/\(id)/credits?language=en-US"
        
        let headers: HTTPHeaders = [
            "Authorization": APIKey.trend,
            "accept": "application/json"]
        
        
        AF.request(url,
                   method: .get,
                   headers: headers).responseDecodable(of: Credit.self) { response in
            switch response.result {
            case .success(let success):
                dump(success)
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
