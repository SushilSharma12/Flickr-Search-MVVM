//
//  FlickrPhotosViewModel.swift
//  1mg Assignment
//
//  Created by SUSHIL SHARMA on 06/07/20.
//  Copyright © 2020 com. All rights reserved.

// This view model handles the request generation and data parsing for photos api.


import Foundation


class FlickrPhotosViewModel {
    
    
    /// This function generates url request and handles query params
    /// - Parameters:
    ///   - search: search query typed in search bar
    ///   - forPage: page number
    ///   - completion: callback which returns data after parsing json
    class func getPhotosList(with search: String?, forPage: Int, completion: @escaping (_ response: FlickrResponse?) -> Void){
        var compURL = URLComponents(string: EndPoints.searchPhotos)!
        
        compURL.queryItems = [
        URLQueryItem(name: "method", value: Constants.searchMethod),
        URLQueryItem(name: "api_key", value: Constants.apiKey),
        URLQueryItem(name: "format", value: Constants.responseFormat),
        URLQueryItem(name: "nojsoncallback", value: Constants.noJSONCallback),
        URLQueryItem(name: "safe_search", value: Constants.safeSearch),
        URLQueryItem(name: "text", value: search),
        URLQueryItem(name: "page", value: String(forPage))
        ]
        let req = URLRequest.init(url: compURL.url!)

        HTTPHandler.shared.getRequest(with: req) { (response, error) in
            guard let res = response else {
                return
            }
            
            let flickrData = try? JSONDecoder().decode(FlickrResponse.self, from: JSONSerialization.data(withJSONObject: res, options: .fragmentsAllowed))
            completion(flickrData)
        }
    }
}

