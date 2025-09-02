//
//  ViewController.swift
//  실습띠 viewcintroller
//
//  Created by 김리하 on 8/29/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var countLable: UILabel!
    @IBOutlet weak var countButton: UIButton!
    
    var counter = Counter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLable.text = "0"
        // Do any additional setup after loading the view.
    }

    @IBAction func excuteCounter(_ sender: UIButton) {
        let newCount = counter.addCount()
        countLable.text = "\(newCount)"
   
    }
    
}

