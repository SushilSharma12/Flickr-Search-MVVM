//
//  FlickrPhoto.swift
//  1mg Assignment
//
//  Created by SUSHIL SHARMA on 06/07/20.
//  Copyright © 2020 com. All rights reserved.
//

import Foundation

struct FlickrPhoto: Decodable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
}

struct FlickrPhotos: Decodable {
    let page, pages, perpage: Int
    let total: String
    let photo: [FlickrPhoto]
}

struct FlickrResponse: Decodable {
    let photos: FlickrPhotos?
    let stat: String
    let code: Int?
    let message: String?
}
