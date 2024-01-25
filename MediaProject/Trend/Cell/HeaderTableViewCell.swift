//
//  HeaderTableViewCell.swift
//  MediaProject
//
//  Created by 은서우 on 2024/01/25.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    
    func configureView() {
        backgroundImageView.contentMode = .scaleAspectFill
        posterImageView.contentMode = .scaleAspectFill
        movieTitleLabel.font = .systemFont(ofSize: 17, weight: .black)
        movieTitleLabel.textColor = .white
    }
    
    func setData(data: Result) {
        movieTitleLabel.text = data.title
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w500\(data.backdropPath)")
        backgroundImageView.kf.setImage(with: backdropURL)
        let posterURL = URL(string: "https://image.tmdb.org/t/p/w500\(data.posterPath)")
        posterImageView.kf.setImage(with: posterURL)
    }
}
