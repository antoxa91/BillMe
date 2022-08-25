//
//  MainViewController.swift
//  BillMe
//
//  Created by Антон Стафеев on 23.08.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bill Me"
        label.minimumScaleFactor = 0.6
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите сумму счета и нажмите \"Посчитать\""
        label.textColor = .black
        label.font = UIFont(name: "Arial Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.minimumScaleFactor = 0.6
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    let tipsView = TipsView()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Посчитать", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.6393250823, green: 0.2680583298, blue: 0.7918022871, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        addTap()
    }
    
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9813271165, green: 0.9813271165, blue: 0.9813271165, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Arial Bold", size: view.frame.height * 0.04)

        view.addSubview(logoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(tipsView)
        view.addSubview(calculateButton)
        calculateButton.titleLabel?.font = UIFont(name: "Arial", size: view.frame.height / 40)
    }
    
    @objc func calculateButtonTapped() {
        guard let totalBill = totalBillView.sumTextField.text,
              let totalBillDouble = Double(totalBill) else {
            titleLabel.text = "Введите общий счет"
            titleLabel.textColor = .red
            return
        }
        
        let summ = totalBillDouble + totalBillDouble * tipsView.tipsCount / 100
        let persons = Double(personsView.counter)
        let result = String(format: "%.2f", summ/persons)

        animate(result)
    }
    
    private func animate(_ result: String) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, animations: {
            self.calculateButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            self.calculateButton.transform = .identity
        })

        UIView.animateKeyframes(withDuration: 1, delay: 0) { [title = self.titleLabel] in
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.45) {
                title.center.y -= 100
                title.transform = CGAffineTransform(scaleX: 1, y: 0.01)
                self.logoImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8).inverted()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.45) {
                title.center.y += 100
                title.textColor = #colorLiteral(red: 0.5855548382, green: 0.1616748869, blue: 0.4218605161, alpha: 1)
                title.transform = .identity
                self.logoImageView.transform = .identity
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.titleLabel.text = "\(result) на человека"
            }
        }
    }
    
    private func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false //чтоб ячейки работали после скрытия клавы
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Constraints
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),

            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 5),
            personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            
            tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),

            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 15),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            calculateButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06)
        ])
    }
}
