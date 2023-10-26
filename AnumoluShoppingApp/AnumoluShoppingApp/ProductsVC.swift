//
//  ProductsVC.swift
//  AnumoluShoppingApp
//
//  Created by Sai Greeshma Anumolu on 10/21/23.
//

import UIKit
import AVKit
import CoreML
import AnimatedGradientView

class ProductsVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
 
    @IBOutlet var products: [ProductView]!
    // var products: [ProductView] = []
            
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setupGradientBackground()
            setupScrollView()
            loadProductViews()
        }
        
        // Function to set up the gradient background
        func setupGradientBackground() {
            let animationGrad = AnimatedGradientView(frame: view.bounds)
            animationGrad.direction = .up
            animationGrad.animationValues = [(colors: ["#2BC0E4", "#EAECC6"], .up, .axial),
                                             (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .right, .axial),
                                             (colors: ["#003973", "#E5E5BE"], .down, .axial),
                                             (colors: ["#1E9600", "#FFF200", "#FF0000"], .left, .axial)]
            view.insertSubview(animationGrad, at: 0)
        }
        
        // Function to set up the scroll view
        func setupScrollView() {
           // scrollView.delegate = self
            scrollView.minimumZoomScale = 1.0 / 25.0
            scrollView.maximumZoomScale = 1.0
            scrollView.backgroundColor = .clear
        }
        
        // Function to make a recommendation prediction
        func makePrediction(input: DCBT500Input) -> Bool? {
            if let model = try? DCBT500(configuration: MLModelConfiguration()),
               let prediction = try? model.prediction(input: input) {
                return prediction.recommendation == 0
            }
            return nil
        }
        
        // Function to load ProductViews with recommendations
        func loadProductViews() {
            for product in products {
                        product.backgroundColor = .clear
                        product.productIMG.backgroundColor = .clear
                        product.productNameLBL.backgroundColor = .clear
                        product.productPriceLBL.backgroundColor = .clear
                        product.productIMG.image = UIImage(named: UtilityConstants.items[product.tag].image)
                        product.productNameLBL.text = "\(UtilityConstants.items[product.tag].name)"
                        product.productPriceLBL.text = String(UtilityConstants.items[product.tag].price)
                        guard let price = UtilityConstants .priceTypes[UtilityConstants.items[product.tag].priceTag] else{return}
                        print(price)
                        guard let season = UtilityConstants .seasonTypes[UtilityConstants.items[product.tag].season] else{return}
                        //print(season)
                        guard let material = UtilityConstants .materialTypes[UtilityConstants.items[product.tag].material] else { return }
                        //print(material)
                        let rating = UtilityConstants.items[product.tag].rating
                  
                        //print(rating)
                        
                        if let model = try? DCBT500(configuration: MLModelConfiguration()),
                           let prediction = try? model.prediction(price: price, rating: rating, season: season, material: material){
                            if(prediction.recommendation == 0){
                                product.recommendedLBL.text = "Recommended 👍🏻"
                                product.recommendedLBL.textColor = UIColor.green
                            }else{
                                product.recommendedLBL.text = "Not recommended 👎🏻"
                                product.recommendedLBL.textColor = UIColor.red
                            }
                        }
                        product.isUserInteractionEnabled = true
                            let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
                            product.addGestureRecognizer(longPressGesture)
                        
                    }
                        
           /* for (index, product) in products.enumerated() {
                print("ghn\(index)")
                print(product)
                let productView = ProductView(frame: CGRect(x: 0, y: index * 150, width: Int(scrollView.bounds.size.width), height: 150))
                
                // Set product's tag to identify it for the segue
                productView.tag = index
                
                // Load product details into the ProductView
                //productView.loadProductDetails(product)
                
                // Convert price, season, and material to Int64
               /* guard let price = UtilityConstants.priceTypes[product.priceTag],
                      let season = UtilityConstants.seasonTypes[product.season],
                      let material = UtilityConstants.materialTypes[product.material] else {
                    continue
                }*/
                
                // Make a prediction and set the recommendation label
              //  if let isRecommended = makePrediction(input: DCBT500Input(price: Int64(price), rating: product.rating, season: Int64(season), material: Int64(material)) {
                  //  productView.setRecommendationLabel(isRecommended: isRecommended)
               // },
                
                // Add the product view to the scroll view
                scrollView.addSubview(productView)
                                                      
                
                // Add a long press gesture for segue and system sound
                let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
                productView.addGestureRecognizer(longPressGesture)
                
                productView.isUserInteractionEnabled = true
            }*/
            
        }
        
        // Handle the long press gesture for segue and system sound
        @objc func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
            if let productView = gesture.view as? ProductView, gesture.state == .began {
                // Play system sound (1306)
                AudioServicesPlaySystemSound(1306)
                
                // Perform the segue to ProductDescriptionVC and pass the product's tag value
                performSegue(withIdentifier: "productDetails", sender: productView.tag)
            }
        }
        
        // Prepare for the segue to ProductDescriptionVC
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "productDetails", let tag = sender as? Int {
                if let destinationViewController = segue.destination as? ProductDescriptionVC {
                    // Pass the product's tag to the ProductDescriptionVC
                    destinationViewController.productTag = tag
                }
            }
        }
    }

