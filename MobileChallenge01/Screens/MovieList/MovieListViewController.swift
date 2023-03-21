//
//  MovieListController.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 06/02/23.
//

import UIKit

class MovieListViewController: UIViewController {
    
    weak var coordinator: Coordinator?
    
    var viewModel: MovieListViewModel!
    var tableViewController: MovieListTableViewController!
    
    init(viewModel: MovieListViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewController = MovieListTableViewController(controller: self)
        
        view.addSubview(tableViewController.view)
        
        Task {
            await viewModel.getPopularMovies()
            
            DispatchQueue.main.async {
                self.tableViewController.reloadData()
            }
            
            await viewModel.getPosterForAllMovies()
            
            DispatchQueue.main.async {
                self.tableViewController.reloadData()
            }
        }
    }
    
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedMovie = viewModel.getMovieData(for: indexPath) else { return }
        coordinator?.showDetails(of: selectedMovie)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getMovieCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.reuseIdentifier, for: indexPath) as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        
        guard let movieData = viewModel.getMovieData(for: indexPath) else {
            return movieCell
        }
        
        movieCell.setPoster(movieData.poster)
        movieCell.setTitle(movieData.title)
        movieCell.setReleaseDate(movieData.releaseDate)
        
        return movieCell
    }
    
}
