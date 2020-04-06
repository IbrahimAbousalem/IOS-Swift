//
//  ViewController.swift
//  MovieWithStaticTableView
//
//  Created by Esraa Hassan on 4/2/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseYear: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text = movie?.name
        movieRate.text = String(movie!.rate)
        movieReleaseYear.text = String(movie!.releaseYear)
        movieGenre.text = movie?.genre
        
        let decodedData:NSData = NSData(base64Encoded: movie!.image, options: .ignoreUnknownCharacters)!
        movieImage.image = UIImage(data: decodedData as Data)!
        
    }

    
    
}

