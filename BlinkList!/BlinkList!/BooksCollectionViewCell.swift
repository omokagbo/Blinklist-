//
//  BooksCollectionViewCell.swift
//  BlinkList!
//
//  Created by omokagbo on 19/04/2021.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookTypeLabel: UILabel!
    
    func setup(with book: Book) {
        bookImageView.image = UIImage(named: book.image ?? "")
        bookTitleLabel.text = book.title ?? ""
        bookAuthorLabel.text = book.author ?? ""
        bookTypeLabel.text = book.book_type ?? ""
    }
}
