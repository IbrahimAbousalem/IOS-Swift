//
//  MovieTableViewController.swift
//  MovieNetworking
//
//  Created by Esraa Hassan on 3/31/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit
import Kingfisher

class MovieTableViewController: UITableViewController {
    var moviesList = [Movie]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        let url = URL(string: "https://api.androidhive.info/json/movies.json")
        let urlRequest = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        _ = session.dataTask(with: urlRequest) { (data, response, error) in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [Dictionary<String, Any>]
                for movie in json {
                    self.moviesList.append(Movie(name: movie["title"] as! String, releaseYear: movie["releaseYear"] as! Int, image: movie["image"] as! String, rate: movie["rating"] as! Double, genre: movie["genre"] as! [String]))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error)
            }
        }.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell

        // Configure the cell...
        print(moviesList[indexPath.row].image)
        cell.movieImage.kf.setImage(with: URL(string: moviesList[indexPath.row].image)!, placeholder: UIImage(named: "placeholder.png"))
        cell.movieRate.text = String(moviesList[indexPath.row].rate)
        cell.movieTitle.text = moviesList[indexPath.row].name
        cell.movieReleaseYear.text = String(moviesList[indexPath.row].releaseYear)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "mainVC") as! ViewController
        controller.movie = moviesList[indexPath.row]
        self.present(controller, animated: true, completion: nil)
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
