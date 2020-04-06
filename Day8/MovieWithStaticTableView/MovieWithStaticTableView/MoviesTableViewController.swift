//
//  MoviesTableViewController.swift
//  MovieWithStaticTableView
//
//  Created by Esraa Hassan on 4/2/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, SendMovieDelegate{
    
    var movies = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
     //   movies.append(Movie(name: "Movie One", releaseYear: 2010, image: <#T##String#>, rate: <#T##Double#>, genre: <#T##[String]#>))
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell

        // Configure the cell...
        let decodedData:NSData = NSData(base64Encoded: movies[indexPath.row].image, options: .ignoreUnknownCharacters)!
        cell.movieImage.image = UIImage(data: decodedData as Data)!
        cell.movieTitle.text = movies[indexPath.row].name
        cell.movieReleaseYear.text = String(movies[indexPath.row].releaseYear)
        cell.movieRate.text = String(movies[indexPath.row].rate)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsView = self.storyboard?.instantiateViewController(withIdentifier: "viewController") as! ViewController
        detailsView.movie = Movie(name: movies[indexPath.row].name, releaseYear: movies[indexPath.row].releaseYear, image: movies[indexPath.row].image, rate: movies[indexPath.row].rate, genre: movies[indexPath.row].genre)
       
        self.navigationController?.pushViewController(detailsView, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addController = segue.destination as! AddMovieTableViewController
        addController.passMovie = self
    }
    
    func sendMovie(movie: Movie) {
        movies.append(movie)
        self.tableView.reloadData()
    }
    
    

   
}
