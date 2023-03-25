//
//  ProductCell.swift
//  ProductMVVM
//
//  Created by Ümit Şimşek on 25.03.2023.
//

import UIKit

class ProductCell: UITableViewCell {
    var product : Product? {
        didSet{
            productConfiguration()
        }
    }
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productRateButton: UIButton!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
}
extension ProductCell {
    func productConfiguration(){
        guard let product else { return }
        productTitleLabel.text = product.title
        productCategoryLabel.text = product.category
        productRateButton.setTitle("\(product.rating.rate)", for: .normal)
        productDescriptionLabel.text = product.description
        productPriceLabel.text = "$\(product.price)"
        productImageView.setImage(with: product.image)
    }
}
