//
//  DetailViewController.swift
//  BountyList
//
//  Created by 김민기 on 2021/06/10.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들기
    
    // View
    // - imgView, nameLabel, bountyLabel
    // > view들은 viewModel을 통해서 구성되기
    
    // ViewModel
    // - DetailViewModel
    // > 뷰레이어에서 필요한 메서드 만들기
    // > Model 가지고 있기, BountyInfo 들
    
    
    // 아웃렛 연결
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    
    // viewModel을 통하여 Model 가져오기
    let viewModel = detailViewModel()
    
    // viewDidLoad는 화면이 보이기 거의 직전에 호출됨
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // 데이터 세팅
    func updateUI() {
        
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    // 닫힘 버튼 클릭 시 닫힘
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


// viewModel 만들기
class detailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
