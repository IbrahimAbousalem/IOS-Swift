//
//  TableViewController.swift
//  MovieNetworkingAndCoreDate
//
//  Created by Esraa Hassan on 4/1/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit
import CoreData
import Kingfisher

class TableViewController: UITableViewController, SendMovieDelegate{
    
    var remoteMovies = [RemoteMovie]()
    var localMovies = [LocalMovie]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Reachability.Connection(){
            getMoviesFromInternet()
        }else{
            getRemoteMovies()
        }
        getSavedLocalMovies()
        self.tableView.reloadData()
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Local Movies"
        }else{
            return "Remote Movies"
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return localMovies.count
        }else{
            return remoteMovies.count
        }
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        switch (indexPath.section){
        case 0:
            cell.movieName.text = localMovies[indexPath.row].name
            cell.movieReleaseYear.text = "\(localMovies[indexPath.row].releaseYear ?? 2000)"
            cell.movieRate.text = String(localMovies[indexPath.row].rate)
            
            let decodedData:NSData = NSData(base64Encoded: localMovies[indexPath.row].image!, options: .ignoreUnknownCharacters)!
            cell.movieImage.image = UIImage(data: decodedData as Data)!
        case 1:
            cell.movieName.text = remoteMovies[indexPath.row].name
            cell.movieReleaseYear.text = "\(remoteMovies[indexPath.row].releaseYear ?? 2000)"
            cell.movieRate.text = String(remoteMovies[indexPath.row].rate)
            cell.movieImage.kf.setImage(with: URL(string: remoteMovies[indexPath.row].image!)!, placeholder: UIImage(named: "placeholder.png"))
        default:
            break
        }
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addController = segue.destination as! AddMovieViewController
        addController.controller = self
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsView = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! ViewController
        switch indexPath.section{
        case 0:
            detailsView.isLocal = true
            detailsView.movie = Movie(name: localMovies[indexPath.row].name!, releaseYear: localMovies[indexPath.row].releaseYear as? Int ?? 0, image: localMovies[indexPath.row].image!, rate: localMovies[indexPath.row].rate, genre: [localMovies[indexPath.row].genre!])
        case 1:
            detailsView.isLocal = false
            detailsView.movie = Movie(name: remoteMovies[indexPath.row].name!, releaseYear: remoteMovies[indexPath.row].releaseYear as? Int ?? 0, image: remoteMovies[indexPath.row].image!, rate: remoteMovies[indexPath.row].rate, genre: [remoteMovies[indexPath.row].genre!])
        default:
            break
        }
        self.navigationController?.pushViewController(detailsView, animated: true)
    }
    
    func getSavedLocalMovies(){
        localMovies = appDelegate.getLocalMovies()
        self.tableView.reloadData()
    }
    
    func getRemoteMovies(){
        remoteMovies = appDelegate.getRemoteMovies()
        self.tableView.reloadData()
    }
    
    func getMoviesFromInternet(){
        var tempList = [Movie]()
        let url = URL(string: "https://api.androidhive.info/json/movies.json")
        let urlRequest = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        _ = session.dataTask(with: urlRequest) { (data, response, error) in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [Dictionary<String, Any>]
                self.appDelegate.clearRemoteMovies(movies: self.remoteMovies)
                for movie in json {
                    tempList.append(Movie(name: movie["title"] as! String, releaseYear: movie["releaseYear"] as! Int, image: movie["image"] as! String, rate: movie["rating"] as! Double, genre: movie["genre"] as! [String]))
                }
                //add New Movies
                self.remoteMovies = self.appDelegate.saveRemoteMovies(movies: tempList)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error)
            }
            }.resume()
    }
    
    func sendMovie(movie: LocalMovie) {
        localMovies.append(movie)
        self.tableView.reloadData()
    }
    
}
