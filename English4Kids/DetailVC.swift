//
//  DetailVC.swift
//  English4Kids
//
//  Created by Pham Ngoc Hai on 12/5/16.
//  Copyright © 2016 pnh. All rights reserved.
//

import UIKit

class DetailVC: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var stringTitle : String!
    var dictData : NSDictionary!
    var arrayKeys : NSArray!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = stringTitle
        self.tableView.register((UITableViewCell.self), forCellReuseIdentifier: "Cell")
        self.creatDataWithName(Title: stringTitle)
        // Do any additional setup after loading the view.
    }
    
    func creatDataWithName(Title: String) {
        var path : String = ""
        if title == "Fruits"{
            path = Bundle.main.path(forResource: "FruitsList", ofType: "plist")!
        }
        if  title == "Animals" {
            
            path = Bundle.main.path(forResource: "AnimalsList", ofType: "plist")!
        }
        if title == "Color"{
            path = Bundle.main.path(forResource: "ColorList", ofType: "plist")!
        }
        if title == "Flower"{
            path = Bundle.main.path(forResource: "FlowerList", ofType: "plist")!
            
        }
        
        
        dictData = NSDictionary(contentsOfFile: path)
        arrayKeys = dictData.allKeys as NSArray!
        arrayKeys = arrayKeys.sortedArray(using: #selector(NSNumber.compare(_:))) as NSArray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        
        return arrayKeys.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // let key : String = arrayKeys[indexPath.row] as! String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let key: String = arrayKeys[(indexPath as NSIndexPath).row] as! String
        cell.textLabel!.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(indexPath.row) - \(arrayKeys[indexPath.row])")
        let DetailVc = UIViewController()
        DetailVc.view.backgroundColor = UIColor.white
        let img = UIImageView(frame: CGRect(x: (DetailVc.view.bounds.size.width - 250) / 2, y: 50, width: 250, height: 250))
        img.image = UIImage(named: "\(dictData[arrayKeys[indexPath.row]]!)")
        DetailVc.view.addSubview(img)
        
//        
            let lbl = UILabel(frame: CGRect(x: (DetailVc.view.bounds.size.width - 250) / 2, y: 300 , width: 250, height: 110))
        lbl.text = "\(arrayKeys[indexPath.row])"
        lbl.textAlignment = .center
        lbl.font = lbl.font.withSize(50)
        DetailVc.view.addSubview(lbl)
        self.navigationController?.pushViewController(DetailVc, animated: true)
        
        
    }
    
}

