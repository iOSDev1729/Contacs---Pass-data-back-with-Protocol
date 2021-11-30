//
//  AddContactController.swift
//  Contacts
//
//  Created by Radhika Chilukuri on 30/11/21.
//

import UIKit

class AddContactController: UIViewController {
    
    var delegate: AddContactDelegate?
    
//MARK: Programmatic textField
    
    let textField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Full Name"
    tf.textAlignment = .center
    tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
}()
    
      override func viewDidLoad() {
        super.viewDidLoad()
          view.backgroundColor = .white
     navBarButtons()
          
//MARK: Add textField to the view
          
     view.addSubview(textField)
          
//MARK: textField AutoLayout contraints programatically
          
       textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
          textField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
          textField.becomeFirstResponder()
        }
    
    
 //MARK: Navigation bar buttons
    func navBarButtons() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
    }
//MARK: Selectors
    
    @objc func handleDone() {
        guard let fullName = textField.text,textField.hasText else {
            print("Handle Error")
            return
        }
    let contact = Contact(fullName: fullName)
        print(contact.fullName)
        
        delegate?.addContact(contact: contact)
        
}
    @objc func handleCancel() {
    self.dismiss(animated: true, completion: nil)
}

    
}

