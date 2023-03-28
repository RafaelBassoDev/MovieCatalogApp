//
//  MovieDetailViewController.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 21/02/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    weak var coordinator: Coordinator?
    
    let viewModel: MovieDetailViewModel!
    
    // --------------------
    // MARK: VIEWS
    // --------------------
    
    // BACK BUTTON
    lazy var backButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .medium
        config.cornerStyle = .medium
        config.title = "<"
        config.baseBackgroundColor = .systemGray2
        
        let button = UIButton(configuration: config)
        button.addAction(
            UIAction { _ in
                self.coordinator?.pop()
            },
            for: .touchUpInside
        )
        return button
    }()
    
    // POSTER
    lazy var poster: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // TITLE
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Bold", size: 38)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    // GENRES
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    // SYNOPSIS TITLE
    lazy var synopsisLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Semibold", size: 24)
        label.text = "Synopsis"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    // SYNOPSIS BODY
    lazy var synopsisBodyText: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "SFProText-Regular", size: 17)
        textView.textAlignment = .left
        textView.sizeToFit()
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    // RATING
    lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Bold", size: 24)
        label.numberOfLines = 1
        label.sizeToFit()
        return label
    }()
    
    // RATING DESCIRPTION
    lazy var ratingDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Light", size: 17)
        label.text = "- The Movie Database (TMDB)"
        return label
    }()
    
    // SCROLL VIEW
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.layoutMargins = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
        return view
    }()
    
    // --------------------
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWithViewModelData()
        
        view.addSubview(scrollView)
        view.addSubview(backButton)

        scrollView.addSubview(contentView)
        
        contentView.addSubview(poster)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(genreLabel)
        
        contentView.addSubview(synopsisLabel)
        contentView.addSubview(synopsisBodyText)
        
        contentView.addSubview(ratingLabel)
        contentView.addSubview(ratingDescriptionLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setConstraints()
    }
}

extension MovieDetailViewController {
    
    private func setupWithViewModelData() {
        poster.image = viewModel.getPoster()
        titleLabel.text = viewModel.getMovieTitle()
        genreLabel.text = viewModel.getGenres()
        synopsisBodyText.text = viewModel.getSynopsis()
        ratingLabel.text = viewModel.getRating()
    }
    
    private func setCanvasConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func setPosterConstraints() {
        poster.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            poster.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            poster.heightAnchor.constraint(equalToConstant: 450),
            poster.topAnchor.constraint(equalTo: contentView.topAnchor),
            poster.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setTitleConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])

        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genreLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12)
        ])
    }
    
    private func setSynopsisConstraints() {
        synopsisLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            synopsisLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            synopsisLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            synopsisLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 15)
        ])

        synopsisBodyText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            synopsisBodyText.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: -4),
            synopsisBodyText.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 4),
            synopsisBodyText.topAnchor.constraint(equalTo: synopsisLabel.bottomAnchor, constant: 2)
        ])
    }
    
    private func setRatingConstraints() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            ratingLabel.topAnchor.constraint(equalTo: synopsisBodyText.bottomAnchor, constant: 40)
        ])

        ratingDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            ratingDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            ratingDescriptionLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 2),
            ratingDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setConstraints() {
        
        setCanvasConstraints()

        setPosterConstraints()
        
        setTitleConstraints()
        
        setSynopsisConstraints()

        setRatingConstraints()
        
        // BACK BUTTON
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
}
