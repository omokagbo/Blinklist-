//
//  HeaderView.swift
//  BlinkList!
//
//  Created by omokagbo on 19/04/2021.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = String(describing: HeaderView.self)
    
    @IBOutlet weak var bookTypeLabel: UILabel!
    @IBOutlet weak var bookDescriptionLabel: UILabel!
    @IBOutlet weak var headerButtonLabel: UIButton!
    
}
