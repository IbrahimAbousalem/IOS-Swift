//
//  CollectionViewController.swift
//  CustomCellApp
//
//  Created by Esraa Hassan on 3/29/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "collectionCell"

class CollectionViewController: UICollectionViewController {
    var pictures: [URL] = []
    var image: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        image = UIImage(named: "placeholder.png")
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            let cellWidth = UIScreen.main.bounds.width / 2 - 5
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        pictures.append(URL(string: "https://pngimage.net/wp-content/uploads/2018/05/courses-png-6.png")!)
        pictures.append(URL(string: "https://leisure.union.ufl.edu/Content/Images/leisure-courses.png")!)
        pictures.append(URL(string: "https://cdn2.iconfinder.com/data/icons/new-year-resolutions/64/resolutions-06-512.png")!)
        pictures.append(URL(string: "https://pngimage.net/wp-content/uploads/2018/05/courses-png.png")!)
        pictures.append(URL(string: "https://www.pngitem.com/pimgs/m/49-491826_of-course-developing-your-employeeengagement-offering-business.png")!)
        pictures.append(URL(string: "https://feedbacksystems.com/wp-content/uploads/2019/12/Business.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
	        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
    
        // Configure the cell
        cell.myImage.kf.setImage(with: pictures[indexPath.row], placeholder: image)
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
