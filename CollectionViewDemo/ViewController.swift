//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Ravindra Sonkar on 17/09/19.
//  Copyright © 2019 Ravindra Sonkar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let collectionArr = ["One","Two","Three","Four", "Five", "Six", "Seven", "Eight", "Nine"]
    let synth = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.lbl1.text = collectionArr[indexPath.row]
        cell.lbl2.text = (indexPath.row + 1).description
        return cell
    }
    
}

extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let myUtterance = AVSpeechUtterance(string: collectionArr[indexPath.row])
        myUtterance.rate = 0.4
        synth.speak(myUtterance)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? CollectionCell {
                cell.mainView.transform = .init(scaleX: 0.8, y: 0.8)
                cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? CollectionCell {
                cell.mainView.transform = .identity
                cell.contentView.backgroundColor = .clear
            }
        }
    }
}

class CollectionCell : UICollectionViewCell {
    @IBOutlet weak var lbl1 : UILabel!
    @IBOutlet weak var lbl2 : UILabel!
    @IBOutlet weak var mainView : UIView!
    
    override func awakeFromNib() {
        mainView.layer.cornerRadius = 10
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.black.cgColor
        
        
    }
}
