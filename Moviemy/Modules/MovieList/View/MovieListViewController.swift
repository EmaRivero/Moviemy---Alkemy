//
//  MovieListViewController.swift
//  Moviemy
//
//  Created by Ema Rivero on 19/07/2022.
//

import UIKit
import Alamofire

protocol MovieListDelegate {
    func reloadTable()
    func showError(error: String)
}

class MovieListViewController: UIViewController {
    
    private var service = MovieListService()
    private var viewModel: MovieListViewModel?
    
    private lazy var movieListTableView: UITableView = {
        let aTable = UITableView()
        aTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aTable)
        aTable.dataSource = self
        aTable.delegate = self
        aTable.register(MovieListTableViewCell.self, forCellReuseIdentifier: "MovieListTableViewCell")
        return aTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.viewModel = MovieListViewModel(service: service, delegate: self)
        self.viewModel?.getMovies()
    }
    
    private func setupView() {
        setupConstraints()
        view.backgroundColor = .black
        title = "Popular Movies"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            movieListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            movieListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.moviesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as? MovieListTableViewCell else {return UITableViewCell()}
        let movie = self.viewModel?.getMovie(at: indexPath.row)
        cell.titleLabel.text = movie?.originalTitle
        let url = "https://image.tmdb.org/t/p/w600_and_h900_bestv2\(movie!.posterPath)"
        cell.posterImage.setImage(url: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }
}


extension MovieListViewController: MovieListDelegate {
    func reloadTable() {
        self.movieListTableView.reloadData()
    }
    
    func showError(error: String) {
        print(error.description)
    }
}

extension MovieListViewController: UITabBarDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = MovieDetailViewController()
        let movie = self.viewModel?.getMovie(at: indexPath.row)
        detailViewController.movieId = movie?.id ?? 0
        self.present(detailViewController, animated: true)
    }
}




