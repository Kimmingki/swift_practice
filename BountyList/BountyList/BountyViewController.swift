//
//  BountyViewController.swift
//  BountyList
//
//  Created by 김민기 on 2021/06/10.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들기
    
    // View
    // - ListCell
    // > ListCell 필요한 정보를 ViewModel한테서 받기
    // > ListCell은 ViewModel로부터 받은 정보로 View 업데이트 하기
    
    // ViewModel
    // - BountyViewModel
    // > BountyViewModel을 만들기, 뷰레이어에서 필요한 메서드 만들기
    // > Model 가지고 있기, BountyInfo 들
    
    
    // viewModel에 들어있는 Model 가져오기
    let viewModel = BountyViewModel()
    
    
    // performSegue 실행 전 준비 사항
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController로 데이터 넘기기
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            
            if let index = sender as? Int {
                let bountyInfo = viewModel.bountyInfo(at: index)
                // DetailViewController로 데이터 넘겨주기
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UITableViewDataSource -> 테이블을 몇 개 생성 할 것이냐
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 갯수를 수동으로 넣지 않고 count를 이용해 갯수 파악
        // viewModel을 이용하여 갯수를 가져오기
        return viewModel.numOfBountyInfoList
    }
    
    // UITableViewDelegate -> 테이블을 어떻게 보여줄 것이냐
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
            // UITableViewCell 말고 ListCell을 쓰고 싶은데 혹시 값이 없을 수 있으니 옵셔널로 적용
        }
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.update(info: bountyInfo)
        return cell
    }
    
    // UITableViewDelegate -> 클릭 됐을 때 어떻게 반응할 것인가
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        
        // 연결 된 세그웨이를 수행해라
        performSegue(withIdentifier: "showDetail", sender: indexPath.row) // 몇번째 cell인지 보내기
    }
}


// Custom Cell 만들기
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}


// ViewModel 만들기
class BountyViewModel {
    // ViewModel은 Model과 접근해야한다.
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    // 랭킹 순으로 나열
    var sortedList: [BountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        
        return sortedList
    }
    
    var numOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo{
        return sortedList[index]
    }
}
