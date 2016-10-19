//
//  StatsViewController.swift
//  Todo List
//
//  Created by chena on 10/17/16.
//  Copyright © 2016 julie. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    @IBOutlet weak var completedItemsCount: UILabel!
    var completeCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //update the completed items label
        completedItemsCount.text = String(completeCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
