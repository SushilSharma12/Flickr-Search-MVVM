//
//  LoaderCell.swift
//  1mg Assignment
//
//  Created by SUSHIL SHARMA on 06/07/20.
//  Copyright © 2020 com. All rights reserved.
//

import UIKit

// Load more activity indicator

class LoaderCell: UICollectionReusableView {
   
    @IBOutlet weak var loader: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func startAnimate() {
        self.loader?.startAnimating()
    }
    
    func stopAnimate() {
        self.loader?.stopAnimating()
    }
}
