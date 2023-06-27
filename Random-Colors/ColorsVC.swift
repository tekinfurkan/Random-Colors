//
//  ColorsVC.swift
//  Random-Colors
//
//  Created by Furkan Tekin on 27.06.2023.
//

import UIKit

class ColorsVC: UIViewController {
    
    var colors : [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    func addRandomColors() {
        
        for _ in 0..<50 {
            colors.append(createRandomColors())
        }
    }
    
    
    func createRandomColors() -> UIColor {
        
        let randomColor = UIColor(red:   CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue:  CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorDetailsVC
        destVC.color = sender as? UIColor
    }

}
extension ColorsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            return UITableViewCell()
        }
        cell.backgroundColor = colors.randomElement()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var color = colors[indexPath.row]
        performSegue(withIdentifier: "ToDetailVC", sender: nil)
    }
}
