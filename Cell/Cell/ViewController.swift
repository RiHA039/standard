//
//  ViewController.swift
//  Cell
//
//  Created by 김리하 on 9/8/25.
//

import UIKit

class ViewController: UIViewController {
    var tableView = UITableView()
    var data = ["전정국", "김태형", "정호석"]
    var addedData: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MyCustomCell.self, forCellReuseIdentifier: "MyCustomCell")
        
        
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
        cell.textLabel?.text = data[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addedData.append("셀 선택")
        print("추가된 데이터: \(addedData)")
    }
    
    }


extension ViewController: MyCellDelegate {
    func didTapAddButton(in cell: MyCustomCell) {
        if let text = cell.textLabel?.text {
            addedData.append(text)
            print("버튼으로 추가된 데이터: \(addedData)")
        }
    }
}

