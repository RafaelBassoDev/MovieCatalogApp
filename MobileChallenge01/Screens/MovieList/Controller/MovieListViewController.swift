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
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = MovieListViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewController = MovieListTableViewController(self)
        
        view.addSubview(tableViewController.view)
        
        viewModel.refreshListWithPopularMovies { [weak self] in
            DispatchQueue.main.async {
                self?.tableViewController.reloadData()
            }
        }
    }
    
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
        
        guard let movieModel = viewModel.getMovieData(for: indexPath) else {
            return movieCell
        }
        
        movieCell.setPoster(movieModel.poster)
        movieCell.setTitle(movieModel.title)
        movieCell.setReleaseDate(movieModel.releaseDate)
        
        return movieCell
    }
    
}
