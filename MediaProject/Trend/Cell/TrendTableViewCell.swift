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
    @IBOutlet var shadowView: UIView!
    @IBOutlet var clipBtn: UIButton!
    @IBOutlet var rateTitleBackgroundView: UIView!
    @IBOutlet var rateTitleLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        configureCell()
    }
    
    func configureCell() {
        titleLabel.font = .systemFont(ofSize: 17)
        
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .gray
        
        CardView.layer.cornerRadius = 10
        CardView.clipsToBounds = true
        
        rateTitleLabel.text = "평점"
        rateTitleLabel.textColor = .white
        rateTitleBackgroundView.backgroundColor = .purple
        
        trendImageView.contentMode = .scaleAspectFill
        trendImageView.backgroundColor = .gray
        
        shadowView.layer.cornerRadius = 10
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        
        clipBtn.setTitle("", for: .normal)
        clipBtn.setImage(UIImage(systemName: "paperclip.circle.fill"), for: .normal)
        clipBtn.tintColor = .white
    }

    func setData(data: Result){
        dateLabel.text = data.releaseDate
        titleLabel.text = data.title
        descriptionLabel.text = data.overview
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(data.backdropPath)")
        trendImageView.kf.setImage(with: url)
        rateLabel.text = String(data.voteAverage)
    }
}
