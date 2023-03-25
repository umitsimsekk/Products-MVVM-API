//
//  DetailsViewController.swift
//  ProductMVVM
//
//  Created by Ümit Şimşek on 25.03.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    var product : Product?
    @IBOutlet weak var detailsPriceLabel: UILabel!
    @IBOutlet weak var detailsDescriptionLabel: UILabel!
    @IBOutlet weak var detailsRateButton: UIButton!
    @IBOutlet weak var detailsCategoryLabel: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailsConfiguration()
    }
    


}
extension DetailsViewController {
    func detailsConfiguration(){
        guard let product else { return }
        detailsDescriptionLabel.text = product.description
        detailsCategoryLabel.text = product.category
        detailsRateButton.setTitle("\(product.rating.rate)", for: .normal)
        detailsPriceLabel.text = "$\(product.price)"
        detailsImageView.setImage(with: product.image)
        detailsTitleLabel.text = product.title
    }
}
