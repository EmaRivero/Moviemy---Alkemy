//
//  MovieDetailViewController.swift
//  Moviemy
//
//  Created by Ema Rivero on 23/07/2022.
//

import UIKit

protocol MovieDetailDelegate {
    func movieData(data: MovieDetail)
    func showError(error: String)
}

class MovieDetailViewController: UIViewController {
    
    var movieId: Int = 0
    private var service = MovieDetailService()
    private var viewModel: MovieDetailViewModel?
    
    lazy var posterImage: UIImageView = {
        let aImage = UIImageView()
        view.addSubview(aImage)
        aImage.contentMode = .scaleAspectFit
        aImage.translatesAutoresizingMaskIntoConstraints = false
        return aImage
    }()
    
    lazy var titleLabel: UILabel = {
        let aLabel = UILabel()
        view.addSubview(aLabel)
        aLabel.font = UIFont(name: "Avenir-Black", size: 24)
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        return aLabel
    }()
    
    lazy var overviewLabel: UILabel = {
        let aLabel = UILabel()
        view.addSubview(aLabel)
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.numberOfLines = 0
        aLabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        aLabel.textColor = .white
        return aLabel
    }()
    
    lazy var releaseDateLabel: UILabel = {
        let aLabel = UILabel()
        view.addSubview(aLabel)
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        aLabel.textColor = .white
        return aLabel
    }()
    
    lazy var voteAverageLabel: UILabel = {
        let aLabel = UILabel()
        view.addSubview(aLabel)
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        aLabel.textColor = .white
        return aLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.viewModel = MovieDetailViewModel(movieId: movieId, delegate: self, service: service)
        self.viewModel?.getMovie()
    }
    
    func setupView() {
        setupConstraints()
        view.backgroundColor = .black
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: view.topAnchor),
            posterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            posterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            posterImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: posterImage.topAnchor, constant: 300),
            titleLabel.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: -20),
            
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            overviewLabel.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: -20),
            
            releaseDateLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 20),
            releaseDateLabel.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor, constant: 20),
            releaseDateLabel.trailingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: -20),
            
            voteAverageLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 20),
            voteAverageLabel.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor, constant: 20),
            voteAverageLabel.trailingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: -20)
        ])
    }
}

extension MovieDetailViewController: MovieDetailDelegate {
    
    func movieData(data: MovieDetail){
        
        let url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2\(data.posterPath)"
        posterImage.setImage(url: url)
        
        titleLabel.text = data.originalTitle
        overviewLabel.text = data.overview
        releaseDateLabel.text = "Release Date: \(String(describing: data.releaseDate!))"
    }
    func showError(error: String) {
        print(error)
    }
}



