//
//  CalculatorCell.swift
//  Everyday Calx
//
//  Created by Vladimir Todorov on 17.02.25.
//

import UIKit

class CalculatorCell: UITableViewCell {
    
    // MARK: - Properties
    static let indentifier = "CalculatorCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper functions
    func setupUI() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    func configure(with label: String, and image: UIImage) {
        self.titleLabel.text = label
        self.iconImageView.image = image
    }
    
    
}
