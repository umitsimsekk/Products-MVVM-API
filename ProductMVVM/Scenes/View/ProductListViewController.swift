//
//  ProductListViewController.swift
//  ProductMVVM
//
//  Created by Ümit Şimşek on 25.03.2023.
//

import UIKit

class ProductListViewController: UIViewController {
    var productViewModel = ProductViewModel()
    var selectedProduct : Product?
    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configuaration()
    }
    

}
extension ProductListViewController {
    func configuaration() {
        productTableView.dataSource = self
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        productViewModel.fetchProduct()
    }
    func observeEvent() {
        productViewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading :
                print("Product loading...")
            case .stopLoading:
                print("Stop loading...")
            case .dataLoaded :
                print("Data loaded...")
                DispatchQueue.main.sync {
                    self.productTableView.reloadData()
                    print("data reloaded")
                }
            case .error(let error):
                print(error)
            }
            
        }
    }
}
extension ProductListViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(productViewModel.products.count)
        return self.productViewModel.products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? ProductCell else {
            return UITableViewCell()
        }
        let product = productViewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.product = selectedProduct
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProduct = productViewModel.products[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
}


