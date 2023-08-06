//
//  DigiproInstructionsViewUI.swift
//  examenDigipro
//
//  Created by Mac on 04/08/23.
//

import UIKit

protocol DigiproInstructionsViewUIDelegate {
    func didTapOkButton()
}


class DigiproInstructionsViewUI: UIView {
    var delegate: DigiproInstructionsViewUIDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.attributedText = getDecorativeTitleText(text: "Instrucciones:")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var instructiosLabel1: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.attributedText = getDecorativeTitleText(text: "Completa todos los campos del formulario y presiona el boton Crear.", font: .systemFont(ofSize: 16, weight: .medium))
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    lazy var tutorialView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tutorialView")
        image.isUserInteractionEnabled = false
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var instructiosLabel2: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.attributedText = getDecorativeTitleText(text: "Si esta bien cambiara a verde.", font: .systemFont(ofSize: 16, weight: .regular))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var succesView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "successTextField")
        image.isUserInteractionEnabled = false
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var instructiosLabel3: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.attributedText = getDecorativeTitleText(text: "Si falta completarlo cambiara a rojo.", font: .systemFont(ofSize: 16, weight: .regular))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var errorView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "errorTextField")
        image.isUserInteractionEnabled = false
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let okButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = DigiproColors.darkColor
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.setTitle("Entendido", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        self.addSubview(titleLabel)
        self.addSubview(instructiosLabel1)
        self.addSubview(tutorialView)
        self.addSubview(instructiosLabel2)
        self.addSubview(succesView)
        self.addSubview(instructiosLabel3)
        self.addSubview(errorView)
        self.addSubview(okButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            instructiosLabel1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            instructiosLabel1.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            instructiosLabel1.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            instructiosLabel1.heightAnchor.constraint(equalToConstant: 50),
            
            tutorialView.topAnchor.constraint(equalTo: instructiosLabel1.bottomAnchor, constant: 10),
            tutorialView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tutorialView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            instructiosLabel2.topAnchor.constraint(equalTo: tutorialView.bottomAnchor, constant: 10),
            instructiosLabel2.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            instructiosLabel2.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            instructiosLabel2.heightAnchor.constraint(equalTo: instructiosLabel1.heightAnchor),
            
            succesView.topAnchor.constraint(equalTo: instructiosLabel2.bottomAnchor),
            succesView.leadingAnchor.constraint(equalTo: instructiosLabel2.leadingAnchor, constant: 20),
            succesView.trailingAnchor.constraint(equalTo: instructiosLabel2.trailingAnchor, constant: -20),
            succesView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),
            
            instructiosLabel3.topAnchor.constraint(equalTo: succesView.bottomAnchor, constant: 10),
            instructiosLabel3.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            instructiosLabel3.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            instructiosLabel3.heightAnchor.constraint(equalTo: instructiosLabel1.heightAnchor),
            
            errorView.topAnchor.constraint(equalTo: instructiosLabel3.bottomAnchor),
            errorView.leadingAnchor.constraint(equalTo: succesView.leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: succesView.trailingAnchor),
            errorView.heightAnchor.constraint(equalTo: succesView.heightAnchor),
            
            okButton.topAnchor.constraint(equalTo: errorView.bottomAnchor, constant: 5),
            okButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            okButton.heightAnchor.constraint(equalToConstant: 30),
            okButton.widthAnchor.constraint(equalToConstant: 100),
            okButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
        ])
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        self.delegate?.didTapOkButton()
    }
}
