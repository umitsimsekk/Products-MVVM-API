//
//  UIImageView + Extention.swift
//  ProductMVVM
//
//  Created by Ümit Şimşek on 25.03.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let resource = ImageResource(downloadURL: url , cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
