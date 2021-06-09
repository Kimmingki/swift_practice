//
//  BountyViewController.swift
//  BountyList
//
//  Created by 김민기 on 2021/06/10.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // 수동 데이터 삽입
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [30000000, 50, 44000000, 30000000, 16000000, 8000000, 77000000, 120000000]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UITableViewDataSource -> 테이블을 몇 개 생성 할 것이냐
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 갯수를 수동으로 넣지 않고 count를 이용해 갯수 파악
        return bountyList.count
    }
    
    // UITableViewDelegate -> 테이블을 어떻게 보여줄 것이냐
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
//            return UITableViewCell()
//            // UITableViewCell 말고 ListCell을 쓰고 싶은데 혹시 값이 없을 수 있으니 옵셔널로 적용
//        }
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.imgView.image = img
//        cell.nameLabel.text = nameList[indexPath.row]
//        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
//        return cell
        
        // 위 코드와 동일
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
            // 데이터 가져오기
            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
            cell.imgView.image = img
            cell.nameLabel.text = nameList[indexPath.row]
            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    // UITableViewDelegate -> 클릭 됐을 때 어떻게 반응할 것인가
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        
        // 연결 된 세그웨이를 수행해라
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
}


// Custom Cell 만들기
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}
