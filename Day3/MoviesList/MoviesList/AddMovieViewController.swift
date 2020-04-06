//
//  AddMovieViewController.swift
//  MoviesList
//
//  Created by Esraa Hassan on 3/26/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieReleaseDate: UITextField!
    @IBOutlet weak var movieRating: UITextField!
    @IBOutlet weak var movieGenre: UITextField!
    var sendMovieProtocol: SendMovieProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImage.image = "image3.png".toImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addMovie(_ sender: UIButton) {
        let title = movieTitle.text ?? "Default Title"
        let date = movieReleaseDate.text ?? "Default Date"
        let rating = movieRating.text?.toFloat() ?? 1.0
        let genre = movieGenre.text ?? "Default Genre"
        let image = "image3.png"
        
        let movie = Movie(title: title, image: image, rate: rating, genre: genre, releaseDate: date)
        sendMovieProtocol?.sendMovie(movie: movie)
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
