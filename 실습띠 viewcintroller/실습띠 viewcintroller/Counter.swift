//
//  Counter.swift
//  실습띠 viewcintroller
//
//  Created by 김리하 on 8/29/25.
//

import UIKit

//class Counter: UIViewController {
    

//    override func viewDidLoad() {
//        super.viewDidLoad()

        // Do any additional setup after loading the view.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
class Counter {
    var number: Int = 0
    
    func addCount() -> Int {
        number += 1
        return number
    }
}
