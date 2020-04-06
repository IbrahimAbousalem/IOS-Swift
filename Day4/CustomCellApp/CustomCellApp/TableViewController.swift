//
//  TableViewController.swift
//  CustomCellApp
//
//  Created by Esraa Hassan on 3/29/20.
//  Copyright © 2020 Jets. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var friendList: [Person] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        friendList.append(Person(name: "Ahmed", age: 10, image: "placeholder.png"))
        friendList.append(Person(name: "Ibrahim", age: 20, image: "placeholder.png"))
        friendList.append(Person(name: "Yahya", age: 20, image: "placeholder.png"))
        friendList.append(Person(name: "Abdlmalek", age: 20, image: "placeholder.png"))
        friendList.append(Person(name: "Ashraf", age: 20, image: "placeholder.png"))
        friendList.append(Person(name: "Ksab", age: 20, image: "placeholder.png"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell

        // Configure the cell...
        cell.myImage.image = UIImage(named: friendList[indexPath.row].image)
        cell.firstLabel.text = friendList[indexPath.row].name
        cell.secondLabel.text = String(friendList[indexPath.row].age)

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
