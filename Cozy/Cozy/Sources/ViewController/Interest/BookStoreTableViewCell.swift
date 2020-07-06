//
//  BookStoreTableViewCell.swift
//  Cozy
//
//  Created by 양재욱 on 2020/07/05.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class BookStoreTableViewCell: UITableViewCell {

    @IBOutlet weak var wholeView: UIView!
    @IBOutlet var hashTagCollection: [UIView]!
    
    @IBOutlet weak var bookStoreImageView: UIImageView!
    @IBOutlet weak var bookStoreName: UILabel!
    @IBOutlet weak var hashTagLabel01: UILabel!
    @IBOutlet weak var hashTagLabel02: UILabel!
    @IBOutlet weak var hashTagLabel03: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        for view in hashTagCollection{
            view.layer.cornerRadius = 5
            view.layer.borderWidth = 1
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setBookStoreData(bookStoreImageName: String, bookStoreName: String, hashTag01: String, hashTag02:String, hashTag03:String){
        self.bookStoreImageView.image = UIImage(named: bookStoreImageName)
        self.bookStoreName.text = bookStoreName
        hashTagLabel01.text = hashTag01
        hashTagLabel02.text = hashTag02
        hashTagLabel03.text = hashTag03
    }

}