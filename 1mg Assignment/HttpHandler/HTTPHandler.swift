//
//  HTTPHandler.swift
//  1mg Assignment
//
//  Created by SUSHIL SHARMA on 06/07/20.
//  Copyright © 2020 com. All rights reserved.
//

import Foundation

class HTTPHandler {
    static let shared = HTTPHandler()
    
    
    /// GET request to fetch data from server
    /// - Parameters:
    ///   - urlReq: urlRequest
    ///   - completion: callback to return data
    func getRequest(with urlReq: URLRequest, completion: @escaping (_ response: [String: Any]?, _ error: Error?) -> Void) {
       URLSession.shared.dataTask(with: urlReq) { (data, response, error) in
               guard let data = data,
                   let response = response as? HTTPURLResponse,
                   (200 ..< 300) ~= response.statusCode,
                   error == nil else {
                       completion(nil, error)
                       return
               }
               let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
               completion(responseObject, nil)
            
        }.resume()
    }
    
    
    /// To download images from server
    /// - Parameters:
    ///   - url: image url
    ///   - completion: callback to return downloaded data 
    func downloadTask(url: URL, completion: @escaping (_ imgData: Data?, _ error: Error?) -> Void){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
             guard let res = response as? HTTPURLResponse,
                           (200 ..< 300) ~= res.statusCode,
                            let mimeType = res.mimeType,
                            mimeType.hasPrefix("image"),
                           error == nil else {
                           completion(nil, error)
                           return
                       }
                       completion(data, nil)
        }.resume()
    }
}
