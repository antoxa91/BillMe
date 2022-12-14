//
//  TotalBillView.swift
//  BillMe
//
//  Created by Антон Стафеев on 23.08.2022.
//

import UIKit

class TotalBillView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Общий счет"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sumTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.tintColor = #colorLiteral(red: 0.6393250823, green: 0.2680583298, blue: 0.7918022871, alpha: 1)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.font = UIFont(name: "Arial", size: frame.width/20)
        sumTextField.font = UIFont(name: "Arial Bold", size: frame.height/2.5)
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(sumTextField)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),

            sumTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            sumTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            sumTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            sumTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
