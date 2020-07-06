//
//  FlickImageCollectionCell.swift
//  1mg Assignment
//
//  Created by SUSHIL SHARMA on 06/07/20.
//  Copyright © 2020 com. All rights reserved.
//

import UIKit

// Collection view cell to display images 
class FlickImageCollectionCell: UICollectionViewCell {
    
    @IBOutlet var flickrPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImage(photo: FlickrPhoto){
        let url = "https://farm\(photo.farm).static.flickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
        print(url)
        HTTPHandler.shared.downloadTask(url: URL(string: url)!) { [weak self] (imgData, error) in
            guard let data = imgData else {
                return
            }
            DispatchQueue.main.async {
                self?.flickrPhoto.image = UIImage.init(data: data)
            }
        }
    }
}
