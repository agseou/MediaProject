//
//  TrendAPIManager.swift
//  MediaProject
//
//  Created by 은서우 on 2024/01/18.
//

import UIKit
import Alamofire

struct TrendAPIManager {
    
    func callRequest(completionHandler: @escaping (Trend) -> Void) {
        let url = "https://api.themoviedb.org/3/trending/movie/day?language=en-US"
        let headers: HTTPHeaders = [
            "Authorization": APIKey.trend,
            "accept": "application/json"]
        
        
        AF.request(url,
                   method: .get,
                   headers: headers).responseDecodable(of: Trend.self) { response in
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

