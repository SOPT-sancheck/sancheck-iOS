//
//  BookStoreTableViewCell.swift
//  Cozy
//
//  Created by 양재욱 on 2020/07/05.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class BookStoreTableViewCell: UITableViewCell {
    
    var isBookmarkClicked: Bool = false

    @IBOutlet weak var wholeView: UIView!
    @IBOutlet var hashTagCollection: [UIView]!
    
    @IBOutlet weak var bookStoreImageView: UIImageView!
    @IBOutlet weak var bookStoreName: UILabel!
    @IBOutlet weak var hashTagLabel01: UILabel!
    @IBOutlet weak var hashTagLabel02: UILabel!
    @IBOutlet weak var hashTagLabel03: UILabel!
    
    @IBOutlet weak var bookmarkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        for view in hashTagCollection{
            view.layer.cornerRadius = 5
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.dustyOrange.cgColor
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setBookStoreData(image1: String, bookStoreName: String, hashtag1: String, hashtag2:String, hashtag3:String){
        let url = URL(string: image1)
        guard let data = try? Data(contentsOf: url!) else {return}
        self.bookStoreImageView.image = UIImage(data: data)
        self.bookStoreName.text = bookStoreName
        hashTagLabel01.text = hashtag1
        hashTagLabel02.text = hashtag2
        hashTagLabel03.text = hashtag3
    }
    
    @IBAction func bookmarkButtonAction(_ sender: UIButton) {
        if isBookmarkClicked == false{
            //put data
            //reload tableview cell
            bookmarkButton.setImage(UIImage(named: "icBookmark"), for: .normal)
            deleteData()
            isBookmarkClicked = true
        }
        else{
            bookmarkButton.setImage(UIImage(named: "icBookmarkSelected"), for: .normal)
            isBookmarkClicked = false
        }
        
    }
    
    func deleteData(){
        InterestService.shared.putBookStoreData(){ NetworkResult in
            switch NetworkResult {
            case .success(let data):
                guard let data = data as? PutData else {return print("put data error")}
                print("@@@data@@@")
                print(data)
                
            case .requestErr(_):
                print("Request error@@")
            case .pathErr:
                print("path error")
            case .serverErr:
                print("server error")
            case .networkFail:
                print("network error")
            }
        }
    }
    

}
