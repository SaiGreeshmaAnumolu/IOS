//
//  ViewController.swift
//  AnumoluShoppingApp
//
//  Created by Sai Greeshma Anumolu on 10/19/23.
//

import UIKit
import Lottie
import AnimatedGradientView
import SwiftUI

class LoginVC: UIViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginBTN: UIButton!
    
    
    @IBOutlet weak var resetBTN: UIButton!
    
    
    @IBOutlet weak var logoAnimationView: LottieAnimationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setupAnimatedGradientBackground()
        setupLogoAnimation()
        
    }
    func setupUI() {
        usernameTF.isEnabled = true
        passwordTF.isEnabled = false
        loginBTN.isEnabled = false
        resetBTN.isEnabled = false
        passwordTF.backgroundColor = .clear
        usernameTF.backgroundColor = .clear
        
    }
    func setupAnimatedGradientBackground() {
        let animationGrad = AnimatedGradientView(frame: view.bounds)
        animationGrad.direction = .up
        animationGrad.animationValues = [
            (colors: ["#2BC0E4", "#EAECC6"], .up, .axial),
            (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .right, .axial),
            (colors: ["#003973", "#E5E5BE"], .down, .axial),
            (colors: ["#1E9600", "#FFF200", "#FF0000"], .left, .axial)]
        view.insertSubview(animationGrad, at: 0)
        
    }
    func setupLogoAnimation() {
        logoAnimationView.animation = LottieAnimation.named("loginAnimation")
        logoAnimationView.contentMode = .scaleAspectFit
        logoAnimationView.loopMode = .playOnce
        logoAnimationView.animationSpeed = 0.5
        logoAnimationView.play()
        
    }
    
    
    @IBAction func UserNameEditingChanged(_ sender: UITextField) {
        if let username = sender.text {
                    resetBTN.isEnabled = !username.isEmpty
                    passwordTF.isEnabled = (username == UtilityConstants.username)
                }
    }
    
    @IBAction func PasswordEditingChanged(_ sender: UITextField) {
        if let password = sender.text {
                   loginBTN.isEnabled = (password == UtilityConstants.password)
               }
    }
    
    @IBAction func login(_ sender: UIButton) {
        performSegue(withIdentifier: "showProducts", sender: self)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        usernameTF.text = ""
        passwordTF.text = ""
        UserNameEditingChanged(usernameTF)
    }
}

