//
//  ProductView.swift
//  AnumoluShoppingApp
//
//  Created by Sai Greeshma Anumolu on 10/21/23.
//

import UIKit
import AVKit

class ProductView: UIView {
    
    @IBOutlet weak var productIMG: UIImageView!
    
    @IBOutlet weak var likeLBL: UILabel!
    
    @IBOutlet weak var productNameLBL: UILabel!
    
    @IBOutlet weak var productPriceLBL: UILabel!
    
    @IBOutlet weak var recommendedLBL: UILabel!
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    convenience init() {
        self.init(frame: .zero)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
            if let view = Bundle.main.loadNibNamed("ProductView", owner: self)! [0] as? UIView {
                view.frame = bounds
                addSubview(view)
            }
        configureLikeLabelTapGesture()
        configureProductImage()
        
    }
    private func configureLikeLabelTapGesture() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(likeLabelTapped))
        likeLBL.isUserInteractionEnabled = true
        likeLBL.addGestureRecognizer(tapGesture)
        
    }
    private func configureProductImage() {
        productIMG.image = UIImage(named: "corset")
        productIMG.layer.borderColor = UIColor.white.cgColor
        productIMG.layer.borderWidth = 2
        productIMG.layer.cornerRadius = 20
        
    }
    @objc func likeLabelTapped() {
        // Toggle the like symbol (♥️/♡)
        likeLBL.text = (likeLBL.text == "♡") ? "♥️" : "♡"
        // Play a system sound (1105)
        AudioServicesPlaySystemSound(1105)
        
    }
    
}



