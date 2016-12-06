//
//  MasterTableVC.swift
//  English4Kids
//
//  Created by Pham Ngoc Hai on 12/5/16.
//  Copyright © 2016 pnh. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {
    var dictList = ["Fruits" : "fruits.png", "Animals" : "animals.jpeg" , "Color": "Color.png", "Flower": "flower.jpeg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var arrKey = [String](dictList.keys)
        var arrValue = [String](dictList.values)
        
        cell.textLabel!.text = arrKey[(indexPath as NSIndexPath).row];
        cell.imageView?.image = UIImage(named: arrValue[(indexPath as NSIndexPath).row])
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let detailVC = segue.destination as! DetailVC
            let selectedRowIndex : IndexPath = self.tableView.indexPathForSelectedRow!
            let selectedCell : UITableViewCell = self.tableView.cellForRow(at: selectedRowIndex)!
            detailVC.stringTitle = selectedCell.textLabel?.text
            
            
        }
    }
    
    
}
