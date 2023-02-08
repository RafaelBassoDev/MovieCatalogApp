//
//  MovieListController.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 06/02/23.
//

import UIKit

class MovieListViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    let viewModel = MovieListViewModel()
    
    let movieListView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(movieListView)
        
        movieListView.delegate = self
        movieListView.dataSource = self
        
        setMovieListViewConstraints()
        
        movieListView.register(MovieListTableViewCell.self, forCellReuseIdentifier: MovieListTableViewCell.reuseIdentifier)
        
        viewModel.refreshListWithPopularMovies { [weak self] in
            DispatchQueue.main.async {
                self?.movieListView.reloadData()
            }
        }
    }
    
    func setMovieListViewConstraints() {
        movieListView.translatesAutoresizingMaskIntoConstraints = false
        movieListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        movieListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        movieListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        movieListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Clicked on table view cell
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.model?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.reuseIdentifier, for: indexPath) as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        
        guard let movieList = viewModel.model?.results else {
            return movieCell
        }
        
        let movieModel = movieList[indexPath.row]
        
        movieCell.setPoster(viewModel.getImageFor(path: movieModel.poster_path))
        movieCell.setTitle(movieModel.title)
        movieCell.setReleaseDate(movieModel.release_date)
        
        return movieCell
    }
    
}
