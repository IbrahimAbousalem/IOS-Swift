//
//  ViewController.swift
//  MovieNetworkingAndCoreDate
//
//  Created by Esraa Hassan on 4/1/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieReleaseYear: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    var movie:Movie?
    var isLocal: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        movieName.text = movie?.name
        movieRate.text = String(movie!.rate)
        movieReleaseYear.text = String(movie!.releaseYear)
        var data = ""
        for text in movie!.genre{
            data += text
        }
        movieGenre.text = data
        
        if isLocal{
            let decodedData:NSData = NSData(base64Encoded: (movie?.image)! ,options: .ignoreUnknownCharacters)!
            movieImage.image = UIImage(data: decodedData as Data)!
        }else{
            movieImage.kf.setImage(with: URL(string: movie!.image)!, placeholder: UIImage(named: "placeholder.png"))

        }
        
    }
	

}

