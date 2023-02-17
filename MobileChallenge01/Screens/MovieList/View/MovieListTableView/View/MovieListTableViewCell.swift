//
//  MovieListTableViewCell.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 07/02/23.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    private let IMAGE_PLACEHOLDER_NAME = "no-image-placeholder"
    private let TITLE_PLACEHOLDER = "Movie"
    private let RELEASE_DATE_PLACEHOLDER = "xx/xx/xxxx"
    
    static let reuseIdentifier: String = "MovieListCell"
    
    private var poster = UIImageView()
    private var title = UILabel()
    private var releaseDate = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(poster)
        addSubview(title)
        addSubview(releaseDate)
        
        // POSTER CONSTRAINTS
        NSLayoutConstraint.activate([
            poster.widthAnchor.constraint(equalToConstant: 70),
            poster.heightAnchor.constraint(equalToConstant: 70),
            poster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            poster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15)
        ])
        
        // TITLE CONSTRAINTS
        NSLayoutConstraint.activate([
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 10),
            title.topAnchor.constraint(equalTo: poster.topAnchor, constant: 5)
        ])
        
        // RELEASE DATE CONSTRAINTS
        NSLayoutConstraint.activate([
            releaseDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            releaseDate.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 10),
            releaseDate.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setPoster(_ image: UIImage?) {
        guard let image else {
            let placeholderImage = UIImage(named: IMAGE_PLACEHOLDER_NAME)
            self.poster.image = placeholderImage
            return
        }
        
        self.poster.image = image
    }
    
    func setTitle(_ title: String?) {
        guard let title else {
            self.title.text = TITLE_PLACEHOLDER
            return
        }
        
        self.title.text = title
    }
    
    func setReleaseDate(_ releaseDate: String?) {
        guard let releaseDate else {
            self.releaseDate.text = RELEASE_DATE_PLACEHOLDER
            return
        }
        
        self.releaseDate.text = releaseDate
    }
}
