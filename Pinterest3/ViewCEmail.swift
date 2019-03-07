//
//  ViewCEmail.swift
//  Pinterest3
//
//  Created by Oscar on 3/6/19.
//  Copyright © 2019 Oscar. All rights reserved.
//

import Foundation
import UIKit
class ViewCEmail: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        let padding1:CGFloat = 10
        
        //title = "Registrate"
        setupNavigationBar()
        //add subview
        view.addSubview(buttonContainerView)
        view.addSubview(firstButton)
        
        buttonContainerView.addSubview(emailTextField)
        
        label1.center = CGPoint(x: UIScreen.main.bounds.width * 0.5, y: 70)
        //label1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        //label1.textAlignment = .center
        //label1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label1.text = "Correo electronico por favor"
        view.addSubview(label1)
        
        
        
        emailTextField.topAnchor.constraint(equalTo: buttonContainerView.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 70).isActive = true
        emailTextField.setLeftPaddingPoints(padding1)//Padding
        //constraints
        // constraints for input
        
        buttonContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60).isActive = true
        //buttonContainerView.heightAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        buttonContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        buttonContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        
        
        firstButton.topAnchor.constraint(equalTo: buttonContainerView.bottomAnchor, constant: 20).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.leftAnchor.constraint(equalTo: buttonContainerView.leftAnchor).isActive = true
        firstButton.rightAnchor.constraint(equalTo: buttonContainerView.rightAnchor).isActive = true
        
        
        
        
        
    }
    
    
    func setupNavigationBar(){
        //backButtonItem.rightBarButtonItem = backButton
        //
        //backButton.title = "hola man"
        navigationItem.leftBarButtonItem = backButton
        //navigationItem.leftBarButtonItem?.title = "hello my friend"
        //navigationItem.backBarButtonItem = backButton
        
    }
    
    
    
    let backButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action:#selector(handleButton))
    
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Email"
        tf.backgroundColor = .white
        return tf
    }()
    
    
    let buttonContainerView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    
    lazy var firstButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 100/255, green: 101/255, blue: 61/255, alpha: 1)
        ub.setTitleColor(.white, for: .normal)
        ub.setTitle("Siguiente", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)//Esta linea la metiste TU
        return ub
    }()
    
    
    let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    
    //let pinterestImage = #imageLiteral(resourceName: "pinterest")
    
    
    //Estafuncion la metiste TU
    @objc func handleButton(){
        /*print("El nombre es: \(nameTextField.text)")
         print("El correo es: \(emailTextField.text)")
         print("El contrasena es: \(passwordTextField.text)") */
        
    }
    
    /*
     @objc func handleButton(){
     guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
     print("Not valid")
     return
     }
     
     var data:AuthDataResultCallback
     Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
     
     var user2 = user?.user
     if error != nil {
     print("ira esto")
     print(error)
     return
     }
     
     guard let uid = user2?.uid else {
     print("algo salio mal")
     return
     }
     //sucessfully
     var ref = Database.database().reference(fromURL: "https://pinterest3-7db31.firebaseio.com/")
     let values = ["name" :name, "email": email]
     let usersRef = ref.child("users").child(uid)
     
     usersRef.updateChildValues(values, withCompletionBlock: { (error, databaseRef:DatabaseReference?) in
     if  error != nil {
     print("esto salio muy mal")
     print(error)
     }
     })
     
     
     //Incluir mensaje dummy
     let mensaje = ["mensaje" : "soy un mensaje dummy", "uid" : uid]
     let mensajeRef = ref.child("messages").child(uid)
     mensajeRef.updateChildValues(mensaje)
     
     
     // successfully included
     print("Saved user successfully into our database")
     print("El nombre es: \(self.nameTextField.text)")
     print("El correo es: \(self.emailTextField.text)")
     print("El contrasena es: \(self.passwordTextField.text)")
     
     }
     }*/
    
}


/*
 extension UIColor {
 
 convenience init(r:CGFloat, g: CGFloat, b: CGFloat) {
 self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
 }
 
 }*/
/*
 extension UITextField {
 func setLeftPaddingPoints(_ amount:CGFloat){
 let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
 self.leftView = paddingView
 self.leftViewMode = .always
 }
 func setRightPaddingPoints(_ amount:CGFloat) {
 let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
 self.rightView = paddingView
 self.rightViewMode = .always
 }
 }*/
