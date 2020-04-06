//
//  MoviesTableViewController.swift
//  MoviesList
//
//  Created by Esraa Hassan on 3/25/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, SendMovieProtocol {
    var moviesArray :[Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesArray.append(Movie(title: "HelloWorldMovie", image: "image1.jpg", rate: 9.9, genre: "Drama", releaseDate: "2010"))
        moviesArray.append(Movie(title: "Kimetsu No yaiba", image: "image2.jpg", rate: 10, genre: "Drama", releaseDate: "2019"))
        moviesArray.append(Movie(title: "Demon Slayer", image: "image3.png", rate: 10, genre: "Action", releaseDate: "2018"))
        moviesArray.append(Movie(title: "No Name", image: "image4.jpg", rate: 4.9, genre: "Drama", releaseDate: "2010"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.imageView?.image = moviesArray[indexPath.row].image.toImage()
        cell.textLabel?.text = moviesArray[indexPath.row].title
        cell.detailTextLabel?.text = moviesArray[indexPath.row].genre
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! ViewController
        controller.movie = moviesArray[indexPath.row]
        self.present(controller, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addController = segue.destination as! AddMovieViewController
        addController.sendMovieProtocol = self
    }
    
    func sendMovie(movie: Movie) {
        moviesArray.append(movie)
        self.tableView.reloadData()
    }
}
