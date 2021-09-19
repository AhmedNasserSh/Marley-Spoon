//
//  FAQSceneTableViewCell.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import UIKit

class FAQSceneTableViewCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var cellView: UIView!
    
    static let identifier = "FAQSceneTableViewCell"
    let arrowUp = "arrowUp"
    let arrowDown = "arrowDown"

    override func awakeFromNib() {
        self.cellView.layer.cornerRadius = 5
    }
    func configure(item: FAQScene.FAQViewSectionItem) {
        self.questionLabel.text = item.question
        self.answerLabel.text = item.answer
        self.answerLabel.isHidden = !item.isExpanded
        let imageName = item.isExpanded ? arrowUp : arrowDown
        arrowImage.image = UIImage(named: imageName)
    }
    
}
