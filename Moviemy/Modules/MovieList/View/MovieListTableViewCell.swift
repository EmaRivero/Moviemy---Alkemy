//
//  MovieListTableViewCell.swift
//  Moviemy
//
//  Created by Ema Rivero on 20/07/2022.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let aLabel = UILabel()
        contentView.addSubview(aLabel)
        aLabel.font = UIFont(name: "Avenir-Black", size: 20)
        aLabel.numberOfLines = 0
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        return aLabel
    }()
    
    lazy var posterImage: UIImageView = {
        let aImage = UIImageView()
        contentView.addSubview(aImage)
        aImage.translatesAutoresizingMaskIntoConstraints = false
        return aImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupConstraints()
        contentView.backgroundColor = .black
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            posterImage.widthAnchor.constraint(equalToConstant: 100),
            posterImage.heightAnchor.constraint(equalToConstant: 140),
            
            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            posterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            posterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

