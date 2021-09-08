//
//  PlayerCell.swift
//  TestHype
//
//  Created by ulixe on 08/09/2021.
//

import Foundation
import UIKit

class PlayerCell: UITableViewCell {
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 10, width: self.frame.width - 20, height: 200))
        view.backgroundColor = .white
        return view
    }()
    
    lazy var img : UIImageView = {
        let img = UIImageView(frame: CGRect(x: 20, y: 20, width: 90, height: 90))
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var nameLabel : UILabel = {
        let lbl = UILabel(frame: CGRect(x: 120, y: 25, width: backView.frame.width - 120, height: 30))
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.textColor = .blue
        return lbl
    }()
    
    lazy var teamLabel : UILabel = {
        let lbl = UILabel(frame: CGRect(x: 120, y: 55, width: backView.frame.width - 120, height: 30))
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        lbl.textColor = .red
        lbl.numberOfLines = 1
        return lbl
    }()
    
    lazy var infoLabel : UILabel = {
        let lbl = UILabel(frame: CGRect(x: 120, y: 85, width: backView.frame.width - 120, height: 30))
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        lbl.textColor = .gray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var info2Label : UILabel = {
        let lbl = UILabel(frame: CGRect(x: 120, y: 115, width: backView.frame.width - 120, height: 30))
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        lbl.textColor = .gray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var info3Label : UILabel = {
        let lbl = UILabel(frame: CGRect(x: 120, y: 145, width: backView.frame.width - 120, height: 30))
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        lbl.textColor = .gray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        addSubview(backView)
        addSubview(img)
        addSubview(nameLabel)
        addSubview(teamLabel)
        addSubview(infoLabel)
        addSubview(info2Label)
        addSubview(info3Label)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        backView.layer.cornerRadius = 5
        backView.clipsToBounds = true
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
    }
    
    func config(name: String, team: String, position: String, conference: String, division: String) {
        self.selectionStyle = .none
        self.nameLabel.text = name
        self.teamLabel.text = team
        if position != "" {
            self.infoLabel.text = "Posizione: " + position
        } else {
            self.infoLabel.text = "Posizione: n/a"
        }
        self.info2Label.text = "Conference: " + conference
        self.info3Label.text = "Division: " + division
        self.img.image = #imageLiteral(resourceName: "fakePlayer")
    }
}
