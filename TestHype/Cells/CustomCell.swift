//
//  CustomCell.swift
//  TestHype
//
//  Created by ulixe on 07/09/2021.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 10, width: self.frame.width - 20, height: 110))
        view.backgroundColor = #colorLiteral(red: 0.7952535152, green: 0.7952535152, blue: 0.7952535152, alpha: 1)
        return view
    }()
    
    lazy var img : UIImageView = {
        let img = UIImageView(frame: CGRect(x: 20, y: 20, width: 90, height: 90))
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var titleLabel : UILabel = {
        let lbl = UILabel(frame: CGRect(x: 120, y: 25, width: backView.frame.width - 120, height: 30))
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.textColor = .blue
        return lbl
    }()
    
    lazy var descriptionLabel : UILabel = {
        let lbl = UILabel(frame: CGRect(x: 120, y: 55, width: backView.frame.width - 120, height: 30))
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        lbl.textColor = .red
        lbl.numberOfLines = 1
        return lbl
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(fullName: String, conference: String, fakeImage: Bool = false) {
        self.selectionStyle = .none
        self.titleLabel.text = fullName
        self.descriptionLabel.text = conference
        let imageName = fullName.replacingOccurrences(of: " ", with: "").lowercased()
        if fakeImage {
            self.img.image = #imageLiteral(resourceName: "fakePlayer")
        } else {
            self.img.image = UIImage(named: imageName)
        }
    }
    
    override func layoutSubviews() {
        addSubview(backView)
        addSubview(img)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        backView.layer.cornerRadius = 5
        backView.clipsToBounds = true
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
    }
}
