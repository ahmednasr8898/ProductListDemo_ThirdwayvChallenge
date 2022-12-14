//
//  ProductsViewController.swift
//  ProductListDemo_ThirdwayvChallenge
//
//  Created by Semicolon on 14/12/2022.
//

import UIKit
import UIStyle

class ProductsViewController: UIViewController {

    //MARK: - outlets
    //
    @IBOutlet weak var productsCollectionView: UICollectionView!
   
    //MARK: - varaibles -
    //
    let viewModel: ProductsViewModelType
    
    //MARK: - init -
    //
    init(viewModel: ProductsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToIndicatorStatus()
        bindToErrorResponse()
        bindToProductsData()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }
}

//MARK: - navigation controller -
//
extension ProductsViewController {
    private func setupNavigationController() {
        title = "Products List"
    }
}


//MARK: - bind to Indicator status -
//
extension ProductsViewController {
    private func bindToIndicatorStatus() {
        viewModel.bindToActivityIndicator { [weak self] status in
            guard let self = self else { return }
            print("status", status)
            Indicator.createIndicator(on: self, start: status)
        }
    }
}


//MARK: - bind to products data -
//
extension ProductsViewController {
    private func bindToProductsData() {
        viewModel.bindToRelaodCollectionView { [weak self] in
            guard let self = self else { return }
            self.reloadCollectionView()
        }
    }
}


//MARK: - bind to Error Response -
//
extension ProductsViewController {
    private func bindToErrorResponse() {
        viewModel.bindToErrorResponse { [weak self] error in
            guard let self = self else { return }
            Alert.failedToFetchResponseAlert(on: self)
        }
    }
}


//MARK: - reload collection view -
//
extension ProductsViewController {
    private func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.productsCollectionView.reloadData()
        }
    }
}


//MARK: - set up collection view -
//
extension ProductsViewController {
    private func setupCollectionView() {
        productsCollectionView.register(PoductsCollectionViewCell.Nib(), forCellWithReuseIdentifier: PoductsCollectionViewCell.Identifier)
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
    }
}

//MARK: - number of cell -
//
extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfProductsCells()
    }
}

//MARK: - dequeue cell -
//
extension ProductsViewController {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PoductsCollectionViewCell.Identifier, for: indexPath) as! PoductsCollectionViewCell
//        let data = self.arrOfApprovalRequestData[indexPath.row]
//        cell.configration(data: data)
        return cell
    }
}


//MARK: - set up size of cell -
//
extension ProductsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * ( 175 / 375), height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}