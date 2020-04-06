//
//  ViewController.swift
//  MoviesList
//
//  Created by Esraa Hassan on 3/25/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    public var movie: Movie?
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieReleaseYearLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImageView.image = UIImage.init(named: movie!.image)
        movieNameLabel.text = movie?.title
        movieRatingLabel.text = String(movie!.rate)
        movieReleaseYearLabel.text = movie?.releaseDate
        movieGenreLabel.text = movie?.genre
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backToList(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

