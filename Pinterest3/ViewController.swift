
//
//  ViewController.swift
//  Pinterest
//
//  Created by Juan Cabral on 1/31/19.
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        let padding1:CGFloat = 10
        
        //add subview
        view.addSubview(inputContainerView)
        view.addSubview(firstButton)
        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(emailTextField)
        inputContainerView.addSubview(passwordTextField)
        
        
        //constraints
        // constraints for input
        
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        
        
        firstButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 20).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor).isActive = true
        firstButton.rightAnchor.constraint(equalTo: inputContainerView.rightAnchor).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        nameTextField.setLeftPaddingPoints(padding1)//Padding
        
        
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        emailTextField.setLeftPaddingPoints(padding1)//Padding
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1/3).isActive = true
        passwordTextField.setLeftPaddingPoints(padding1)//Padding
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Email"
        tf.backgroundColor = .white
        return tf
    }()
    
    let passwordTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password"
        tf.backgroundColor = .white
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let nameTextField : UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Name"
        tf.backgroundColor = .white
        return tf
    }()
    
    let inputContainerView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var firstButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        ub.setTitle("Register", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)//Esta linea la metiste TU
        return ub
    }()
    
    /*
    //Estafuncion la metiste TU
    @objc func handleButton(){
        print("El nombre es: \(nameTextField.text)")
        print("El correo es: \(emailTextField.text)")
        print("El contrasena es: \(passwordTextField.text)")    }*/
    
    
     @objc func handleButton(){//Comentaste el codigo porque no jalaba
     guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
     print("Not valid")
     return
     }
        
        /*static func signUp(username: String, email: String, User: String, Phone: String ,password: String, imageData: Data, onSuccess: @escaping () -> Void, onError:  @escaping (_ errorMessage: String?) -> Void) {
         Auth.auth().createUser(withEmail: email, password: password, completion: { user, error in
         if error != nil {*/
        var data:AuthDataResultCallback
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            //Cannot convert value of type '(AuthDataResultCallback?, _) -> ()' (aka '(Optional<(Optional<AuthDataResult>, Optional<Error>) -> ()>, _) -> ()') to expected argument type 'AuthDataResultCallback?' (aka 'Optional<(Optional<AuthDataResult>, Optional<Error>) -> ()>')
            //var user = data.user
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
            
            //usersRef.setValue(values)
            
     usersRef.updateChildValues(values, withCompletionBlock: { (error, databaseRef:DatabaseReference?) in
     if  error != nil {
        print("esto salio muy mal")
     print(error)
     }
     })
            
            //
     
     // successfully included
     print("Saved user successfully into our database")
        print("El correo es: \(self.emailTextField.text)")
        print("El contrasena es: \(self.passwordTextField.text)")      }
     }
    
}


extension UIColor {
    
    convenience init(r:CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}

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
}
