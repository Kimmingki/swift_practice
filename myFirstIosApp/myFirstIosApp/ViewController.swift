//
//  ViewController.swift
//  myFirstIosApp
//
//  Created by 김민기 on 2021/04/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func hello(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "My First App!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

