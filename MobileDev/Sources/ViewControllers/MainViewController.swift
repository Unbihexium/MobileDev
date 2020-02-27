//
//  ViewController.swift
//  MobileDev
//
//  Created by Egor Nalobin on 27.02.2020.
//  Copyright © 2020 Egor Nalobin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Главный экран"
    }

    @IBAction func firstLabClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "FirstLabViewController") as! FirstLabViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func secondLabClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SecondLabViewController") as! SecondLabViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

