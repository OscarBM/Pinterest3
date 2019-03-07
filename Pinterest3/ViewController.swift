
//
//  ViewController.swift
//  Pinterest
//
//  Created by Juan Cabral. Edited by Oscar Beltran
//  Copyright © 2019 Juan Cabral. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "hola"
        //setupNavigationBar()
        
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        //let padding1:CGFloat = 10
        
        //add subview
        view.addSubview(buttonContainerView)
        view.addSubview(firstButton)
        
        buttonContainerView.addSubview(emailButton)
        buttonContainerView.addSubview(facebookButton)
        buttonContainerView.addSubview(googleButton)
        let pinterestImage = #imageLiteral(resourceName: "pinterest")
        //let imagen:UIImageView = pinterestImage
        
        //let imageName = "yourImage.png"
        //let image = UIImage(named: imageName)
        let imageView = UIImageView(image: pinterestImage)
        imageView.frame = CGRect(x: UIScreen.main.bounds.width * 0.5, y:UIScreen.main.bounds.height * 0.2, width: 90, height: 90)
        
        //imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //imageView.sizeToFit()
        
        view.addSubview(imageView)
        
        //imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true        //constraints
        // constraints for input
        
        buttonContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60).isActive = true
        //buttonContainerView.heightAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        buttonContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        buttonContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        
        
        firstButton.topAnchor.constraint(equalTo: buttonContainerView.bottomAnchor, constant: 20).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstButton.leftAnchor.constraint(equalTo: buttonContainerView.leftAnchor).isActive = true
        firstButton.rightAnchor.constraint(equalTo: buttonContainerView.rightAnchor).isActive = true
        
        
        emailButton.topAnchor.constraint(equalTo: buttonContainerView.topAnchor, constant: -10).isActive = true
        emailButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor).isActive = true
        emailButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 1/3).isActive = true
        emailButton.leftAnchor.constraint(equalTo: buttonContainerView.leftAnchor).isActive = true
        emailButton.rightAnchor.constraint(equalTo: buttonContainerView.rightAnchor).isActive = true
        
        
        facebookButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 10).isActive = true
        facebookButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor).isActive = true
        facebookButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 1/3).isActive = true
        //facebookButton.setLeftPaddingPoints(padding1)//Padding
        facebookButton.leftAnchor.constraint(equalTo: buttonContainerView.leftAnchor).isActive = true
        facebookButton.rightAnchor.constraint(equalTo: buttonContainerView.rightAnchor).isActive = true
        //facebookButton.isHidden = true
        
        
        googleButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 10).isActive = true
        googleButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor).isActive = true
        googleButton.heightAnchor.constraint(equalTo: buttonContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
        googleButton.leftAnchor.constraint(equalTo: buttonContainerView.leftAnchor).isActive = true
        googleButton.rightAnchor.constraint(equalTo: buttonContainerView.rightAnchor).isActive = true
        
        //googleButton.setLeftPaddingPoints(padding1)//Padding
        // Do any additional setup after loading the view, typically from a nib.
        //pinterestImage.draw(at: CGPoint(x: 0, y: 0))
        
        //label1.center = CGPoint(x: 0, y: 285)
        //label1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        //label1.textAlignment = .center
        //label1.text = "Si continuas aceptas la condiciones del servicio y la politica de privacidad"
        //self.view.addSubview(label1)
        
    }
    
    
    func setupNavigationBar(){
        //backButtonItem.rightBarButtonItem = backButton
        //
        //backButton.title = "hola man"
        navigationItem.leftBarButtonItem = backButton
        //navigationItem.leftBarButtonItem?.title = "hello my friend"
        //navigationItem.backBarButtonItem = backButton
        
    }
    //let backButtonItem = UINavigationItem(title: "Back my friend")
    
    let backButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action:#selector(handleButton))
    
    
    
    let buttonContainerView : UIView =  {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var emailButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 255/255, green: 20/255, blue: 0/255, alpha: 1)
        ub.setTitle("Continuar con el correo electronico", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)//Esta linea la metiste TU
        return ub
    }()
    
    lazy var facebookButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        ub.setTitle("Continuar con Facebook", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)//Esta linea la metiste TU
        return ub
    }()
    
    lazy var googleButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 30/255, green: 101/255, blue: 161/255, alpha: 1)
        ub.setTitle("Continuar con Google", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)//Esta linea la metiste TU
        return ub
    }()
    
    lazy var firstButton : UIButton = {
        let ub = UIButton()
        ub.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        ub.setTitleColor(.black, for: .normal)
        ub.setTitle("Iniciar sesion", for: .normal)
        ub.translatesAutoresizingMaskIntoConstraints = false
        //ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        ub.addTarget(self, action: #selector(handleButton), for: .touchUpInside)//Esta linea la metiste TU
        return ub
    }()
    
    //let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    
    
    
    
    //Estafuncion la metiste TU
     @objc func handleButton(){
        //print("hola")
        //facebookButton.isHidden = true
        //presentedViewController(ViewCEmail, animated: true, completion: nil)
        /*print("El nombre es: \(nameTextField.text)")
         print("El correo es: \(emailTextField.text)")
         print("El contrasena es: \(passwordTextField.text)") */
        //let secondViewController = ViewController(nibName: "ViewCEmail", bundle: nil)
        //self.present(secondViewController, animated: true, completion: nil)
        
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
