//
//  Constants.swift
//  1mg Assignment
//
//  Created by SUSHIL SHARMA on 06/07/20.
//  Copyright © 2020 com. All rights reserved.
//

import Foundation

// api endpoints
struct EndPoints {
    static let searchPhotos = "https://api.flickr.com/services/rest/"
}

// query params and constants for API
struct Constants {
    static let apiKey = "4d972a8eaeac4db640a75e7b8297940e"
    static let searchMethod = "flickr.photos.search"
    static let responseFormat = "json"
    static let safeSearch = "1"
    static let noJSONCallback = "1"
    static let text = ""
}
