//
//  InfoViewController.swift
//  Picsum
//
//  Created by Admin on 2021/01/11.
//

import UIKit

class InfoViewController: UIViewController {

  
    
    @IBOutlet weak var detailImageView: LazyImageView!
    @IBOutlet weak var firstlable: UILabel!
    @IBOutlet weak var secoundlable: UILabel!
    var detailUrl:URL?
    override func viewDidLoad() {
        super.viewDidLoad()

       UIUpdate()
    }
    
    
    func UIUpdate(){
        detailImageView.loadImage(fromURL: detailUrl!)
        
    }

   
    
    
}
