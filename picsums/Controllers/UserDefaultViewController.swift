//
//  UserDefaultViewController.swift
//  picsums
//
//  Created by Admin on 2021/01/13.
//  Copyright © 2021 Rana singh. All rights reserved.
//

import UIKit

class UserDefaultViewController: UIViewController {
    @IBOutlet weak var enterText: UITextField!
    @IBOutlet weak var Current: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
           if let name = defaults.string(forKey: "name"){
           Current.text = name
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        if (enterText.text?.count)! > 0 {
            let defaults: Void = UserDefaults.standard.set(enterText.text!, forKey: "name")
           }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
