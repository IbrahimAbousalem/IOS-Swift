//
//  ViewController.swift
//  MovieNetworking
//
//  Created by Esraa Hassan on 3/31/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var genre: UILabel!
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.kf.setImage(with: URL(string: (movie?.image)!)!, placeholder: UIImage(named: "placeholder.png"))
        rate.text = String((movie?.rate)!)
        releaseDate.text = movie?.name
        for data in (movie?.genre)!{
            genre.text = genre.text! + data
        }
        name.text = movie?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

