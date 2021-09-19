//
//  UIViewController+Progress.swift
//  Marley Spoon
//
//  Created by Ahmed Naser on 19/09/2021.
//

import Foundation
import UIKit
import ProgressHUD

extension UIViewController {
    func showProgess() {
        ProgressHUD.show()
    }
    
    func hidProgress() {
        ProgressHUD.dismiss()
    }
}
