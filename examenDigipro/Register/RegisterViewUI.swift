//
//  RegisterViewUI.swift
//  inventoryProgramatically
//
//  Created by Mac on 27/02/23.
//

import UIKit

protocol RegisterViewUIDelegate {
    func notifyShowAlert(tittle: String, message: String)
    func notifyCreateUser(name: String,
                          secondName: String,
                          thirdName: String,
                          email: String,
                          phone: String)
}

class RegisterViewUI: UIView{
    var delegate: RegisterViewUIDelegate?
    var navigationController: UINavigationController?
    
    var containerScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.attributedText = getDecorativeTitleText(text: "Nombre:")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private lazy var nameTextField: Digipro_TextField = {
        let textField = Digipro_TextField(placeholderText: "Ingresa tu nombre")
        textField.delegate = self
        return textField
    }()
    
    private lazy var secondNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.attributedText = getDecorativeTitleText(text: "Apellido paterno")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private lazy var secondNameTextField: Digipro_TextField = {
        let textField = Digipro_TextField(placeholderText: "Ingresa tu primer apellido ")
        textField.delegate = self
        return textField
    }()
    
    private lazy var thirdNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.attributedText = getDecorativeTitleText(text: "Apellido materno")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private lazy var thirdNameTextField: Digipro_TextField = {
        let textField = Digipro_TextField(placeholderText: "Ingresa tu segundo apellido")
        textField.delegate = self
        return textField
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.attributedText = getDecorativeTitleText(text: "Correo")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private lazy var emailTextField: Digipro_TextField = {
        let textField = Digipro_TextField(placeholderText: "Ingresa tu correo")
        textField.delegate = self
        textField.tag = 1
        return textField
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.attributedText = getDecorativeTitleText(text: "Teléfono")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private lazy var phoneTextField: Digipro_TextField = {
        let textField = Digipro_TextField(placeholderText: "Ingresa tu teléfono")
        textField.keyboardType = .numberPad
        textField.delegate = self
        textField.tag = 2
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.backgroundColor = DigiproColors.darkColor
        button.addTarget(self, action: #selector(actionButtonTapped(_:)), for: .touchUpInside)
        button.setTitle("Crear", for: .normal)
        return button
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: RegisterViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            let gestoTap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard(_:)))
            self.addGestureRecognizer(gestoTap)
            
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
            
            setUI()
            setConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        self.addSubview(containerScrollView)
        containerScrollView.addSubview(contentView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameTextField)
        contentView.addSubview(secondNameLabel)
        contentView.addSubview(secondNameTextField)
        contentView.addSubview(thirdNameLabel)
        contentView.addSubview(thirdNameTextField)
        contentView.addSubview(emailLabel)
        contentView.addSubview(emailTextField)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(registerButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            containerScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: containerScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: containerScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: containerScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: containerScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: containerScrollView.widthAnchor),
            
            //nombre
            nameLabel.topAnchor.constraint(equalTo: containerScrollView.topAnchor, constant: 25),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            //apellido paterno
            secondNameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50),
            secondNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            secondNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            secondNameTextField.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 25),
            secondNameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            secondNameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            secondNameTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            //apelllido materno
            thirdNameLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 50),
            thirdNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            thirdNameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            thirdNameTextField.topAnchor.constraint(equalTo: thirdNameLabel.bottomAnchor, constant: 25),
            thirdNameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            thirdNameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            thirdNameTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            //correo
            emailLabel.topAnchor.constraint(equalTo: thirdNameTextField.bottomAnchor, constant: 50),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 25),
            emailTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            //telefono
            phoneLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 50),
            phoneLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            phoneLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 25),
            phoneTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            phoneTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            phoneTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            //boton
            registerButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 25),
            registerButton.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
        ])
    }
    
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        self.endEditing(true)
    }
    
    @objc private func actionButtonTapped(_ sender: UIButton) {
        setErrorState(for: nameTextField)
        setErrorState(for: secondNameTextField)
        setErrorState(for: thirdNameTextField)
        setErrorState(for: emailTextField)
        setErrorState(for: phoneTextField)
        validateForm()
    }
    
    private func validateForm() {
        if let name = nameTextField.text,
           let secondName = secondNameTextField.text,
           let thirdName = thirdNameTextField.text,
           let email = emailTextField.text,
           let phone = phoneTextField.text  {
            
            if !name.isEmpty && !secondName.isEmpty && !thirdName.isEmpty && !email.isEmpty && !phone.isEmpty {
                if phone.count != 10 {
                    self.delegate?.notifyShowAlert(tittle: "Hubo un error", message: "Por favor introduzca un numero de 10 digitos")
                }else {
                    delegate?.notifyCreateUser(name: name,
                                               secondName: secondName,
                                               thirdName: thirdName,
                                               email: email,
                                               phone: phone)
                }
            } else {
                self.delegate?.notifyShowAlert(tittle: "Hubo un error", message: "Por favor rellena todos los campos")
            }
        }
    }
    
    func clearFields(){
        nameTextField.clearField()
        secondNameTextField.clearField()
        thirdNameTextField.clearField()
        emailTextField.clearField()
        phoneTextField.clearField()
        secondNameTextField.becomeFirstResponder()
        self.endEditing(true)
    }
    func setErrorState(for textField: Digipro_TextField) {
        if !(textField.text?.isEmpty ?? true) {
            textField.setSuccess()
        } else {
            textField.setError()
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            containerScrollView.contentInset = contentInsets
            containerScrollView.scrollIndicatorInsets = contentInsets
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        containerScrollView.contentInset = .zero
        containerScrollView.scrollIndicatorInsets = .zero
    }
    
    @objc func previousButtonTapped() {
        if secondNameTextField.isFirstResponder {
            nameTextField.becomeFirstResponder()
        } else if thirdNameTextField.isFirstResponder {
            secondNameTextField.becomeFirstResponder()
        } else if emailTextField.isFirstResponder {
            thirdNameTextField.becomeFirstResponder()
        } else if phoneTextField.isFirstResponder {
            emailTextField.becomeFirstResponder()
        }
    }
    
    @objc func nextButtonTapped() {
        if nameTextField.isFirstResponder {
            secondNameTextField.becomeFirstResponder()
        } else if secondNameTextField.isFirstResponder {
            thirdNameTextField.becomeFirstResponder()
        } else if thirdNameTextField.isFirstResponder {
            emailTextField.becomeFirstResponder()
        } else if emailTextField.isFirstResponder {
            phoneTextField.becomeFirstResponder()
        } else if phoneTextField.isFirstResponder {
            phoneTextField.resignFirstResponder()
        }
    }
    
}
extension RegisterViewUI: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 {
            
            if string == "@" && (textField.text?.contains("@") ?? false) {
                return false
            }
            let allowedCharacters = CharacterSet(charactersIn: "@.! # $ % & ' * + - / = ? ^ _ ` { | } ~")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet) || CharacterSet.alphanumerics.isSuperset(of: characterSet)
        }else  if textField.tag == 2 {
            let allowedCharacters = CharacterSet(charactersIn: "0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet) && (textField.text?.count ?? 10) + string.count <= 10
        } else {
            let allowedCharacters = CharacterSet.letters
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let previousButton = UIBarButtonItem(title: "Anterior", style: .plain, target: self, action: #selector(previousButtonTapped))
        let nextButton = UIBarButtonItem(title: "Siguiente", style: .plain, target: self, action: #selector(nextButtonTapped))
        toolbar.items = [previousButton, nextButton]
        textField.inputAccessoryView = toolbar
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            secondNameTextField.becomeFirstResponder()
        case secondNameTextField:
            thirdNameTextField.becomeFirstResponder()
        case thirdNameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            phoneTextField.becomeFirstResponder()
        case phoneTextField:
            phoneTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
}
