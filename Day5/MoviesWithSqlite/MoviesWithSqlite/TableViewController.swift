//
//  TableViewController.swift
//  MoviesWithSqlite
//
//  Created by Esraa Hassan on 3/30/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var moviesList: [Movie]?
    var sqlManager: SqliteManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        sqlManager = SqliteManager.sqliteManager
       
    }
    override func viewWillAppear(_ animated: Bool) {
        moviesList = (sqlManager?.getAllMovieQuery()) ?? [Movie]()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList!.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        // Configure the cell...
        /*
       //  file:///Users/esraahassan/Library/Developer/CoreSimulator/Devices/AE4303BC-EC8B-40F2-95B0-C3D42CD8DA63/data/Containers/Data/Application/CF7E01B4-7657-47CF-B529-8EDF0AE91818/Documents3E00F48B-9E4F-42E7-B8DE-35B111748807.jpeg
         
         file:///Users/esraahassan/Library/Developer/CoreSimulator/Devices/AE4303BC-EC8B-40F2-95B0-C3D42CD8DA63/data/Containers/Data/Application/CF7E01B4-7657-47CF-B529-8EDF0AE91818/Documents19680C62-C70B-4783-B940-04F47D76EDF3.jpeg
         */
        let uiImage = NSURL(string: moviesList![indexPath.row].image)
        let data = NSData(contentsOf: uiImage! as URL)
        cell.imageLabel.image = UIImage.init(data: data! as Data)
        cell.nameLabel.text = moviesList![indexPath.row].name
        return cell
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
extension UIImage {
    
    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
        
        self.init(data: imageData)
    }
    
}
