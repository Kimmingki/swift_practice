//
//  DetailViewController.swift
//  BountyList
//
//  Created by 김민기 on 2021/06/10.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 닫힘 버튼 클릭 시 닫힘
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
