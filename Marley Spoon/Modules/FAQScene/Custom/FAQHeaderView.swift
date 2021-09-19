//
//  FAQHeaderView.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import UIKit

class FAQHeaderView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var headerLabel: UILabel!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.translatesAutoresizingMaskIntoConstraints = true
        addSubview(contentView)
    }
    
    func setTitle(title: String) {
        self.headerLabel.text = title
    }
    
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of:self))
        let nib = UINib(nibName: String(describing: type(of:self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
}
