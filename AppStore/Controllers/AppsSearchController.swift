//
//  AppsSearchController.swift
//  AppStore
//
//  Created by Vladimir Gusev on 23.06.2022.
//

import UIKit
 
class AppsSearchController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        // Not sure that it's good to do like this.
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
