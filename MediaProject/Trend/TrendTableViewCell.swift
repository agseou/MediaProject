//
//  TrendTableViewCell.swift
//  MediaProject
//
//  Created by 은서우 on 2024/01/18.
//

import UIKit
import Kingfisher

class TrendTableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var trendImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var CardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        CardView.layer.cornerRadius = 15
        CardView.contentMode = .scaleToFill
        
    }

    func setData(data: Result){
        dateLabel.text = data.releaseDate
        titleLabel.text = data.title
        descriptionLabel.text = data.overview
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(data.backdropPath)")
        trendImageView.kf.setImage(with: url)
    }
}
