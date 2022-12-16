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
    weak var coordinator: ProductCoordinatorProtocol?
    var isFetchingDataNow: Bool?
    let reachability = try! Reachability()

    //MARK: - init -
    //
    init(viewModel: ProductsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - life cycel -
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        delegatePinterestLayout()
        bindToIndicatorStatus()
        bindToProductsData()
        bindToIsFetchingDataNow()
        bindToErrorService()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
        bindToReachability()
    }
    
    deinit {
        reachability.stopNotifier()
    }
}


//MARK: - navigation controller -
//
extension ProductsViewController {
    private func setupNavigationController() {
        title = "Products List"
        navigationController?.navigationBar.tintColor = SystemDesign.AppColors.primary.color
    }
}


//MARK: - bind to Indicator status -
//
extension ProductsViewController {
    private func bindToIndicatorStatus() {
        viewModel.bindToActivityIndicator { [weak self] status in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                Indicator.createIndicator(on: self, start: status)
            }
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


//MARK: - bind to is fetching data now Data -
//
extension ProductsViewController {
    private func bindToIsFetchingDataNow() {
        viewModel.bindToIsFetchingDataNow { [weak self] isFetching in
            guard let self = self else { return }
            self.isFetchingDataNow = isFetching
        }
    }
}


//MARK: - bind to ErrorService -
//
extension ProductsViewController {
    private func bindToErrorService() {
        viewModel.bindToErrorService { [weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                Alert.defaultAlert(on: self, message: "Failed to connect with server and no found data offline!!!!")
            }
        }
    }
}


//MARK: - bind to reachability
//
extension ProductsViewController {
    private func bindToReachability() {
        HelperReachability.shared.handleReachability(reachability: reachability)
        HelperReachability.shared.bindToReachabilityStatus = { [ weak self] in
            guard let self = self else { return }
            self.viewModel.fetchProducts()
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
        productsCollectionView.register(PoductsCollectionViewCell.nib(), forCellWithReuseIdentifier: PoductsCollectionViewCell.identifier)
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.prefetchDataSource = self
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PoductsCollectionViewCell.identifier, for: indexPath) as! PoductsCollectionViewCell
        cell.Configuration(data: viewModel.getProductItemCell(indexPath: indexPath))
        return cell
    }
}


//MARK: - set up size of cell -
//
extension ProductsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right )) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}


//MARK: - confirm PinterestLayout Delegate -
//
extension ProductsViewController: PinterestLayoutDelegate {
    private func delegatePinterestLayout() {
        if let layout = productsCollectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }
    
    func collectionView( _ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        let width = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right)) / 2
        let productDescription = viewModel.getProductItemCell(indexPath: indexPath).productDescription
        
        let productDescriptionHeight = productDescription?.heightWithConstrainedWidth(width: width, font: .systemFont(ofSize: 16))
        
        let height = CGFloat(viewModel.getProductItemCell(indexPath: indexPath).image?.height ?? 0) + productDescriptionHeight! + 100
        return  height
    }
}


//MARK: - did selected item -
//
extension ProductsViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.showProductDetails(product: viewModel.getProductItemCell(indexPath: indexPath))
    }
}


//MARK: - pagination when scrolling with prefetching -
//
extension ProductsViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            guard let isFetchingDataNow = isFetchingDataNow else {return}
            if indexPath.row >= viewModel.getNumberOfProductsCells() - 3 && !isFetchingDataNow {
                viewModel.fetchProducts()
            }
        }
    }
}
