//
//  ReceipeTableViewCell.swift
//  Receipe_list
//
//  Created by MacBook Pro on 28/06/21.
//

import UIKit

class ReceipeTableViewCell: UITableViewCell {

    private let MyImageView: UIImageView = {
        
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleToFill//.scaleAspectFit
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = 5
        //myImageView.image = UIImage(named: "download.jpg")
        return myImageView
        
    }()
    
    private let myLabel:UILabel = {
        
        let myLabel = UILabel()
        
        myLabel.textAlignment = .center
        myLabel.backgroundColor = .white
        myLabel.font = .boldSystemFont(ofSize: 20)
        
        return myLabel
    }()
    
    private let textview:UITextView = {
        let textview = UITextView()
        textview.isEditable = false
        textview.backgroundColor = .white
        textview.textAlignment = .left
        textview.font = .boldSystemFont(ofSize: 14)
        return textview
    } ()
    
    private let textview2:UITextView = {
        let textview = UITextView()
        textview.isEditable = false
        textview.backgroundColor = .white
        textview.text = "Added 4 Days Ago"
        //textview.textAlignment = .center
        textview.textColor = .green
        return textview
    } ()
    
    public let myButton:UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right.2"), for: .normal)
        button.tintColor = .systemBlue
        
        return button
    }()
    public let heart:UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
        
        button.tintColor = .red
        return button
    }()
    
    
    func setupsimpleFood(title name:String , and index:Int , Abt about:String)
    {
        MyImageView.image = UIImage(named:name)
        myLabel.text = name
        myButton.tag = index
        textview.text = about
        setupUI(at: index)
    }
    
    private func setupUI(at index:Int)
    {
        contentView.addSubview(MyImageView)
        contentView.addSubview(myLabel)
        contentView.addSubview(myButton)
        contentView.addSubview(textview)
        contentView.addSubview(textview2)
        contentView.addSubview(heart)
        MyImageView.frame = CGRect(x: 20, y: 10, width: 120, height: 100)
        myLabel.frame = CGRect(x: MyImageView.right + 20, y: -10, width: 140, height: 60)
        textview.frame = CGRect(x: MyImageView.right + 20, y: 30, width: 140, height: 40)
        textview2.frame = CGRect(x: MyImageView.right + 20, y: 70, width: 140, height: 40)
        myButton.frame = CGRect(x: contentView.width - 50, y: 10, width: 40, height: 80)
        heart.frame = CGRect(x: contentView.width - 80, y: 70, width: 40, height: 40)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
