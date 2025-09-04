//
//  ViewController.swift
//  FirstViewController
//
//  Created by 김리하 on 9/4/25.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
    
    
             return cell
    
}
    
    
    let table = UITableView()
    let datas = ["전정국", "김태형", "정호석", "김석진"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        view.backgroundColor = .purple
        
       
        }
        
    }

