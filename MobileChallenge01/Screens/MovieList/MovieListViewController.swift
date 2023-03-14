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
        
        viewModel.getPopularMovies { result in
            switch result {
            case .success(let movies):
                self.viewModel.updateMovieList(with: movies)
                DispatchQueue.main.async {
                    self.tableViewController.reloadData()
                }
                
            case .failure(let error):
                print("ERROR: \(error)")
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
        
        guard let movieModel = viewModel.getMovieData(for: indexPath) else {
            return movieCell
        }
        
        movieCell.setPoster(movieModel.poster)
        movieCell.setTitle(movieModel.title)
        movieCell.setReleaseDate(movieModel.releaseDate)
        
        return movieCell
    }
    
}
