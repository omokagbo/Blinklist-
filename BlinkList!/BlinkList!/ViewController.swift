//
//  ViewController.swift
//  BlinkList!
//
//  Created by omokagbo on 19/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let books = DataLoader().book
    
    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        booksCollectionView.dataSource = self
        booksCollectionView.delegate = self
        booksCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        //        booksCollectionView?.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView" )
    }
}

extension ViewController: UICollectionViewDataSource {
    
    private var numberOfSections: Int {
        return 3
    }
    
    private var numberOfItemsInSection: Int {
        return 4
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BooksCollectionViewCell.identifier, for: indexPath) as? BooksCollectionViewCell else {
            fatalError("Error dequeueing book cell!")
        }
        
        let book = books[indexPath.row]
        
        cell.bookTitleLabel.text = book.title
        cell.bookAuthorLabel.text = book.author
        cell.bookTypeLabel.text = book.book_type! + "   .  \(book.length! / 60)h"
        cell.bookImageView.image = UIImage(named: book.image ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as? HeaderView else {
            fatalError("Error dequeueing Header!")
        }
        
        let headerTitleArray = ["Audiobooks", "Trending Blinks", "Latest Blinks"]
        let headerDescriptionArray = ["Recommended by our curators", "What's popular right now", "Titles recently added on blinklist"]
        
        headerView.bookTypeLabel.text = headerTitleArray[indexPath.row]
        headerView.bookDescriptionLabel.text = headerDescriptionArray[indexPath.row]
        
        //headerView.headerButtonLabel = UIButton()
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.width/3)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  200, height: 300)
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = mainStoryboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
                destinationVC.authorLbl = books[indexPath.row].author!
                destinationVC.titleLbl = books[indexPath.row].title!
                destinationVC.imageName = UIImage(named: books[indexPath.row].image!)!
        
        self.navigationController?.pushViewController( destinationVC, animated: true)
    }
    
}

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
