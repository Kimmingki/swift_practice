//
//  BountyViewController.swift
//  BountyList
//
//  Created by 김민기 on 2021/04/13.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [3300000, 50, 4400000, 3000000, 1600000, 8000000, 7700000, 12000000]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DeatilViewController 데이터 전송
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        return cell
        
        //        if let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
        //            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        //            cell.imgView.image = img
        //            cell.nameLabel.text = nameList[indexPath.row]
        //            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        //            return cell
        //        } else {
        //            return UITableViewCell()
        //        }
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}
