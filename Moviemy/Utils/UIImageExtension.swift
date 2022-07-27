//
//  UIImageExtension.swift
//  Moviemy
//
//  Created by Ema Rivero on 21/07/2022.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(url: String) {
        self.kf.setImage(with: URL(string: url))
    }
}
