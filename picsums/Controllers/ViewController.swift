//
//  ViewController.swift
//  Picsum
//
//  Created by Admin on 2021/01/11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   @IBOutlet weak var tableView: UITableView!
    var pic = [Structure]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "User", style: .plain, target: self, action: #selector(addTapped))
        
       downloadJSON  {
        DispatchQueue.main.async {
        self.tableView.reloadData()
        }
      }
    }
    
    
    @objc func addTapped(){
      let vc = self.storyboard?.instantiateViewController(withIdentifier: "User") as! UserDefaultViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return pic.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // let cell = UITableViewCell(style: .default, reuseIdentifier: "cellIdentifier")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)as! CustomTableViewCell
        let arrayContaint = self.pic[indexPath.row]
        let imageUrl = URL(string: (arrayContaint.download_url))!
        
        cell.lazyImage.loadImage(fromURL: imageUrl)
        
        cell.imageName.text = arrayContaint.author
        return cell
       }
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailUrl = self.pic[indexPath.row]
        let imageUrl = URL(string: (detailUrl.download_url))!
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        vc.detailUrl = imageUrl
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func downloadJSON(completed: @escaping () -> ()) {

        let url = URL(string: "https://picsum.photos/v2/list")
        
        URLSession.shared.dataTask(with: url!) {(data, response, error ) in
          
            if error == nil {
            do {
          
            self.pic = try JSONDecoder().decode([Structure].self, from: data!)
               
                if self.pic.count > 0{
                   completed()
                }
         

                
                
                } catch {
                    print("JSON Error")
                }
            }
        }.resume()
        
    }

    
    
    

}

