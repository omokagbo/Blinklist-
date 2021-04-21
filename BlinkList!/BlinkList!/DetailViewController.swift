//
//  DetailViewController.swift
//  BlinkList!
//
//  Created by omokagbo on 19/04/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var imageName = UIImage()
    var titleLbl = ""
    var authorLbl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = imageName
        titleLabel.text = titleLbl
        authorLabel.text = authorLbl
    }
    
}
