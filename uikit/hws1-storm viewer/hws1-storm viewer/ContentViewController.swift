//
//  ContentViewController.swift
//  hws1-storm viewer
//
//  Created by 정기웅 on 2020/06/25.
//  Copyright © 2020 정기웅. All rights reserved.
//

import UIKit


class ContentViewController: UIViewController {
    
    @IBOutlet var image: UIImageView!
    var content: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = content
        navigationItem.largeTitleDisplayMode = .never
        
        if let selectedImage = content {
            image.image = UIImage(named: selectedImage)
        }
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
}
