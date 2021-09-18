//
//  ErrorView.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 18/09/2021.
//

import UIKit

class ErrorView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    var retryAction: () -> Void = {}
    
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
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of:self))
        let nib = UINib(nibName: String(describing: type(of:self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    func setErrorMessage(_ message: String = "Internal Server Error") {
        self.errorMessageLabel.text = message
    }
    
    @IBAction func didTabRetry(_ sender: UIButton) {
        retryAction()
    }
    
}
