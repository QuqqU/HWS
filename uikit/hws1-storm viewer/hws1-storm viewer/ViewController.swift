//
//  ViewController.swift
//  hws1-storm viewer
//
//  Created by 정기웅 on 2020/06/25.
//  Copyright © 2020 정기웅. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var contents = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        try! fm.contentsOfDirectory(atPath: path)
            .filter{ $0.hasPrefix("nssl") }
            .sorted()
            .forEach{ contents.append($0) }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ContentCell")
        cell.textLabel?.text = contents[indexPath.row]
        cell.textLabel?.adjustsFontForContentSizeCategory = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ContentVC") as? ContentViewController else { return }
        //vc.image.image = UIImage(contentsOfFile: contents[indexPath.row])
        vc.content = contents[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

