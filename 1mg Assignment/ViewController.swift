//
//  ViewController.swift
//  1mg Assignment
//
//  Created by SUSHIL SHARMA on 06/07/20.
//  Copyright © 2020 com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var activityIndictor: UIActivityIndicatorView!
    var loaderCell: LoaderCell?
    var loaderCellIdentifier = "loaderCell"
    var totalPages: Int?
    var currentPage: Int = 0
    var isFetching: Bool = false
    
    var photos: [FlickrPhoto] = [] {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiSetup()
    }
    
    // This function handles UI updates
    private func uiSetup(){
        self.activityIndictor.isHidden = true
        collectionView.register(UINib(nibName: "LoaderCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: loaderCellIdentifier)

    }
}


