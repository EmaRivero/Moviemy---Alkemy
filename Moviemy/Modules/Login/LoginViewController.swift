//
//  LoginViewController.swift
//  Moviemy
//
//  Created by Ema Rivero on 24/07/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var imageLogo: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.contentMode = .scaleToFill
        aImage.image = UIImage(named: "ISO")
        view.addSubview(aImage)
        return aImage
    }()
    
    private lazy var emailField: UITextField = {
        let aField = UITextField()
        aField.translatesAutoresizingMaskIntoConstraints = false
        aField.placeholder = "email"
        aField.backgroundColor = UIColor(named: "inputColor")
        aField.textColor = .white
        aField.borderStyle = .line
        aField.layer.cornerRadius = 10
        aField.autocapitalizationType = UITextAutocapitalizationType.none
        view.addSubview(aField)
        return aField
    }()
    
    private lazy var passwordField: UITextField = {
        let aField = UITextField()
        aField.translatesAutoresizingMaskIntoConstraints = false
        aField.isSecureTextEntry = true
        aField.placeholder = "password"
        aField.backgroundColor = UIColor(named: "inputColor")
        aField.textColor = .white
        aField.borderStyle = .line
        aField.layer.cornerRadius = 10
        view.addSubview(aField)
        return aField
    }()
    
    private lazy var loginButton: UIButton = {
        let aButton = UIButton(primaryAction: UIAction { _ in
            self.login()
        })
        aButton.translatesAutoresizingMaskIntoConstraints = false
        aButton.layer.borderWidth = 1
        aButton.layer.cornerRadius = 10
        aButton.setTitle("Login", for: .normal)
        aButton.titleLabel?.tintColor = .white
        view.addSubview(aButton)
        aButton.backgroundColor = UIColor(named: "buttonColorLeft")
        return aButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupConstraints()
        view.backgroundColor = .black
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            imageLogo.widthAnchor.constraint(equalToConstant: 100),
            imageLogo.heightAnchor.constraint(equalToConstant: 100),
            imageLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageLogo.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 80),
            
            emailField.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 80),
            emailField.heightAnchor.constraint(equalToConstant: 40),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.heightAnchor.constraint(equalToConstant: 40),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
        ])
    }
    
    func login() {
        if emailField.text == "test@test.com" && passwordField.text == "123" {
            navigationController?.pushViewController(MovieListViewController(), animated: true)
        } else {
            let alerta = UIAlertController(title: "Contraseña Incorrecta",
                                           message: "Ingrese una nueva contraseña",
                                           preferredStyle: UIAlertController.Style.alert)
            let accion = UIAlertAction(title: "Ok",
                                       style: UIAlertAction.Style.default) { _ in
                alerta.dismiss(animated: true, completion: nil)}
            alerta.addAction(accion)
            self.present(alerta, animated: true, completion: nil)
        }
    }
}
