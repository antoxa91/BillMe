//
//  PersonsView.swift
//  BillMe
//
//  Created by Антон Стафеев on 23.08.2022.
//

import UIKit

class PersonsView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество персон"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backgroundGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9561659694, green: 0.9591339231, blue: 0.9530903697, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let configForButton = UIImage.SymbolConfiguration(pointSize: 26, weight: .bold, scale: .large)
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "minus", withConfiguration: configForButton), for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus", withConfiguration: configForButton), for: .normal)
        button.tintColor = #colorLiteral(red: 0.4510066509, green: 0.4966486692, blue: 0.5633206367, alpha: 1)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var counter = 2
 
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
        counterLabel.font = UIFont(name: "Arial Bold", size: frame.height/2.5)
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(backgroundGrayView)
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLabel)
    }
    
    @objc func minusButtonTapped() {
        counter -= 1
        counterLabel.text = "\(counter)"
        
        if counter == 1 {
            minusButton.isEnabled = false
        }
    }
    
    @objc func plusButtonTapped() {
        counter += 1
        counterLabel.text = "\(counter)"
        minusButton.isEnabled = true
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            backgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            backgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundGrayView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            minusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor),
            minusButton.leadingAnchor.constraint(equalTo: backgroundGrayView.leadingAnchor),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 70),
            
            plusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor),
            plusButton.trailingAnchor.constraint(equalTo: backgroundGrayView.trailingAnchor),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 70),
            
            counterLabel.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10)
        ])
    }
}
