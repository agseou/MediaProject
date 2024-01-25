//
//  TrendViewController.swift
//  MediaProject
//
//  Created by 은서우 on 2024/01/18.
//

import UIKit

class TrendViewController: UIViewController {
    
    @IBOutlet var TrendTableView: UITableView!
    let manager = TrendAPIManager()
    var trendMovieList: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.callRequest() { data in
            self.trendMovieList = data.results
            print(self.trendMovieList)
            self.TrendTableView.reloadData()
        }
        configureView()
        registerXIB()
    }
    
    func configureView() {
        TrendTableView.delegate = self
        TrendTableView.dataSource = self
        TrendTableView.separatorStyle = .none
        TrendTableView.rowHeight = UITableView.automaticDimension
    }
    
    func registerXIB() {
        let xib = UINib(nibName: TrendTableViewCell.identifier, bundle: nil)
        TrendTableView.register(xib, forCellReuseIdentifier: TrendTableViewCell.identifier)
    }
    
}

extension TrendViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.identifier, for: indexPath) as! TrendTableViewCell
        
        cell.setData(data: trendMovieList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: CreditViewController.identifier) as! CreditViewController
        
        vc.movieID = trendMovieList[indexPath.row].id
        vc.movieInfo = trendMovieList[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
