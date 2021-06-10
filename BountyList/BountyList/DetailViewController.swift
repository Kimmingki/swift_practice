//
//  DetailViewController.swift
//  BountyList
//
//  Created by 김민기 on 2021/06/10.
//

import UIKit

class DetailViewController: UIViewController {
    
    // 아웃렛 연결
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    var name: String?
    var bounty: Int?
    
    // viewDidLoad는 화면이 보이기 거의 직전에 호출됨
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // 데이터 세팅
    func updateUI() {
        if let name = self.name, let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg")
            imgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }
    
    
    // 닫힘 버튼 클릭 시 닫힘
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
