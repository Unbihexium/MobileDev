//
//  FirstLabViewController.swift
//  MobileDev
//
//  Created by Egor Nalobin on 27.02.2020.
//  Copyright © 2020 Egor Nalobin. All rights reserved.
//

import Foundation
import UIKit

class FirstLabViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return languages[row]
    }

    let cellIdentifier = "puzzleCell"
    
    let languages = ["Python", "C++", "C#", "Java", "Rust"]

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var languagesPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Первая лабораторная"
        
        self.collectionView.register(UINib(nibName:"PuzzleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
        languagesPicker.dataSource = self
        languagesPicker.delegate = self


        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionView.collectionViewLayout = layout
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PuzzleCollectionViewCell

        return cell
    }

}

