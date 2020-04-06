//
//  ViewController.swift
//  MoviesWithSqlite
//
//  Created by Esraa Hassan on 3/30/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var releaseDateTF: UITextField!
    @IBOutlet weak var rateTF: UITextField!
    var movie: Movie?
    var imageLocation: String?
    var sqlManager: SqliteManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        sqlManager = SqliteManager.sqliteManager
        imageView.image = UIImage(named: "placeholder.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func openGallery(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else{
            print("cannot open photos")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
        if let imgUrl = info[UIImagePickerControllerImageURL] as? URL{
            let imgName = imgUrl.lastPathComponent
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            let localPath = documentDirectory?.appending(imgName)
            
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            imageView.image = image
            let data = UIImagePNGRepresentation(image)! as NSData
            data.write(toFile: localPath!, atomically: true)
            let photoURL = URL.init(fileURLWithPath: localPath!)
            print(photoURL)
            imageLocation = photoURL.absoluteString
            print(imageLocation!)
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addAction(_ sender: UIButton) {
        let name = nameTF.text
        let releaseDate = releaseDateTF.text
        let rate = rateTF.text
        let movie = Movie(name: name!, releaseDate: releaseDate!, image: imageLocation!, rate: Float(rate!) ?? 0.0)
        sqlManager?.insert(movie: movie)
    }
}

