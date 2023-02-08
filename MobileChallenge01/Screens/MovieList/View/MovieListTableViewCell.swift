//
//  MovieListTableViewCell.swift
//  MobileChallenge01
//
//  Created by Rafael Basso on 07/02/23.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

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
        self.poster.image = image
    }
    
    func setTitle(_ title: String?) {
        self.title.text = title ?? "placeholder"
    }
    
    func setReleaseDate(_ releaseDate: String?) {
        self.releaseDate.text = releaseDate ?? "xxxx"
    }
}
