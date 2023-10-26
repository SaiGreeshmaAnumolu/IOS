//
//  ProductDescriptionVC.swift
//  AnumoluShoppingApp
//
//  Created by Sai Greeshma Anumolu on 10/21/23.
//

import UIKit

class ProductDescriptionVC: UIViewController {

    
    @IBOutlet weak var productIV: UIImageView!
 
    @IBOutlet weak var priceLBL: UILabel!
    
    @IBOutlet weak var colorPUBTN: UIButton!
    
    @IBOutlet weak var sizePUBTN: UIButton!
    
    @IBOutlet weak var descriptionTV: UITextView!
    
    var productTag: Int = 0
    var isFullScreen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

                setupUI()
                addDoubleTapGesture()
                selectSize()
                selectColor()
            }
            
            // Function to set up UI elements
            func setupUI() {
                productIV.image = UIImage(named: UtilityConstants.items[productTag].image)
                descriptionTV.text = UtilityConstants.items[productTag].description
                priceLBL.text = String(UtilityConstants.items[productTag].price)
                
                // Set a gradient background
                //setupGradientBackground()
                
                // Round the product image and clip to bounds
                productIV.layer.cornerRadius = 20.0
                productIV.clipsToBounds = true
            }
            
            // Function to add a double-tap gesture for fullscreen image
            func addDoubleTapGesture() {
                let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
                doubleTapGesture.numberOfTapsRequired = 2
                productIV.addGestureRecognizer(doubleTapGesture)
                productIV.isUserInteractionEnabled = true
            }
            
            @objc func handleDoubleTap(_ sender: UITapGestureRecognizer) {
                if sender.state == .recognized {
                    if isFullScreen {
                        // Exit full screen mode with a scaling animation.
                        UIView.animate(withDuration: 0.5) {
                            self.productIV.transform = .identity
                        }
                    } else {
                        // Enter full screen mode with a scaling animation.
                        UIView.animate(withDuration: 0.5) {
                            let scale = UIScreen.main.bounds.size.width / self.productIV.bounds.size.width
                            let transform = CGAffineTransform(scaleX: scale, y: scale)
                            self.productIV.transform = transform
                        }
                    }
                }
                            isFullScreen.toggle()
                
            }
            
            // Function to handle the selection of size
            func selectSize() {
                let size = { (action: UIAction) in
                    print(action.title)
                }
                
                self.sizePUBTN.menu = UIMenu(children: [
                    UIAction(title: "Small", state: .on, handler: size),
                    UIAction(title: "Medium", state: .on, handler: size),
                    UIAction(title: "Large", state: .on, handler: size),
                    UIAction(title: "Extra large", state: .on, handler: size),
                    UIAction(title: "Plus size", state: .on, handler: size),
                    UIAction(title: "Size", state: .off, handler: size)
                ])
                
                self.sizePUBTN.showsMenuAsPrimaryAction = true
                self.sizePUBTN.changesSelectionAsPrimaryAction = true
            }
            
            // Function to handle the selection of color
            func selectColor() {
                let pop = { (action: UIAction) in
                    print(action.title)
                }
                
                self.colorPUBTN.menu = UIMenu(children: [
                    UIAction(title: "Red 🟥", state: .on, handler: pop),
                    UIAction(title: "Green 🟩", state: .on, handler: pop),
                    UIAction(title: "White ⬜️", state: .on, handler: pop),
                    UIAction(title: "Blue 🟦", state: .on, handler: pop),
                    UIAction(title: "Black ⬛️", state: .on, handler: pop),
                    UIAction(title: "Color", state: .off, handler: pop)
                ])
                
                self.colorPUBTN.showsMenuAsPrimaryAction = true
                self.colorPUBTN.changesSelectionAsPrimaryAction = true
            }
            
            @IBAction func buy(_ sender: UIButton) {
                let alert = UIAlertController(title: "Order confirmation", message: "Thanks for purchasing the product. We will send you the shipping information soon.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }

