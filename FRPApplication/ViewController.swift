//
//  ViewController.swift
//  FRPApplication
//
//  Created by Karim Ebrahem on 11/4/18.
//  Copyright © 2018 KarimEbrahem. All rights reserved.
//

import UIKit
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var validationLabel: UILabel!
    
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupRx()
    }
    
    private func setupRx() {
        _ = usernameTextField.rx.text.map { $0 ?? "" }
            .bind(to: loginViewModel.username)
        _ = passwordTextField.rx.text.map {$0 ?? "" }
            .bind(to: loginViewModel.password)
        
        _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled)
        
        _ = loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.loginButton.backgroundColor = isValid ? .green : .gray
            self.validationLabel.text = isValid ? "Enabled" : "Disabled"
            self.validationLabel.textColor = isValid ? .green : .red
        })
    }

}

