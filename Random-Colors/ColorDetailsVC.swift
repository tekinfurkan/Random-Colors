//
//  ColorDetailsVC.swift
//  Random-Colors
//
//  Created by Furkan Tekin on 27.06.2023.
//

import UIKit

class ColorDetailsVC: UIViewController {
    
    var color : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue
    }
    

    

}
