//
//  AddMovieTableViewController.swift
//  MovieWithStaticTableView
//
//  Created by Esraa Hassan on 4/2/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class AddMovieTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieReleaseYear: UITextField!
    @IBOutlet weak var movieRate: UITextField!
    @IBOutlet weak var movieGenre: UITextField!
    var passMovie: SendMovieDelegate?
    var imageString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        movieImage.image = UIImage(named: "placeholder.png")
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
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
          let movie = Movie(name: movieTitle.text!, releaseYear: Int(movieReleaseYear.text!)!, image: imageString!, rate: Double(movieRate.text!)!, genre: movieGenre.text!)
        passMovie?.sendMovie(movie: movie)
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
