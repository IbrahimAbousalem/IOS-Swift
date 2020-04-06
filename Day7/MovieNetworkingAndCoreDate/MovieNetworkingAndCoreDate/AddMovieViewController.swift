//
//  AddMovieViewController.swift
//  MovieNetworkingAndCoreDate
//
//  Created by Esraa Hassan on 4/1/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UITextField!
    @IBOutlet weak var movieReleaseDate: UITextField!
    @IBOutlet weak var movieRate: UITextField!
    @IBOutlet weak var movieGenre: UITextField!
    var movie: Movie?
    var imageString: String?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var controller: SendMovieDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImage.image = UIImage(named: "placeholder.png")

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
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        movieImage.image = image
        let imageData = UIImagePNGRepresentation(image)! as NSData
        imageString = imageData.base64EncodedString(options: .lineLength64Characters)
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let movie = Movie(name: movieName.text!, releaseYear: Int(movieReleaseDate.text!)!, image: imageString!, rate: Double(movieRate.text!)!, genre: [movieGenre.text!])
        let localMovie = appDelegate.saveLocalMovies(movieObject: movie)
        controller?.sendMovie(movie: localMovie)
        self.dismiss(animated: true, completion: nil)
    }
}
