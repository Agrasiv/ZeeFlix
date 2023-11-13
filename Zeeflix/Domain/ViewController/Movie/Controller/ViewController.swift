//
//  ViewController.swift
//  Zeeflix
//
//  Created by Pyae Phyo Oo on 07/10/2021.
//

import UIKit
import CoreData

class ViewController: BaseViewController {
    
    var vm = UpcomingMovieVM()
    var UpcomingList : [UpcomingMovieResponseData] = []
    
    var vm1 = PopularMovieVM()
    var PopularList : [PopularMovieModelResponseData] = []
    
    @IBOutlet weak var tblMovie: UITableView!
    @IBOutlet weak var colMovie: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initBindings()
        initBindings1()
    }
    
    func tableViewSetup() {
        let tableNib = UINib (nibName: "MovieCell", bundle: nil)
        self.tblMovie.register(tableNib, forCellReuseIdentifier: "MovieCell")
        self.tblMovie.delegate = self
        self.tblMovie.dataSource = self
        let colNib = UINib (nibName: "PopularMovieCell", bundle: nil)
        colMovie.register(colNib, forCellWithReuseIdentifier: "PopularMovieCell")
        colMovie.dataSource = self
        colMovie.delegate = self
    }
    
    
    
    fileprivate func initBindings() {
        vm.error = { [weak self] errMsg in
            self?.showError(msg: errMsg)
        }
        vm.upcomingMovieList = { [weak self] movieListdata in
            self?.bindData(data: movieListdata)
        }
        vm.loadUpcomingMovie()
    }
    
    fileprivate func initBindings1() {
        vm1.error = { [weak self] errMsg in
            self?.showError(msg: errMsg)
        }
        vm1.popularMovieList = { [weak self] pupularlist in
            self?.bindData1(data: pupularlist)
        }
        vm1.loadPopularMovie()
    }
    
    fileprivate func bindData(data: [UpcomingMovieResponseData]?) {
        if let upcomingList = data {
            self.UpcomingList = upcomingList
            self.tblMovie.reloadData()
        }
    }

    
    fileprivate func bindData1(data: [PopularMovieModelResponseData]?) {
        if let popularList = data {
            self.PopularList = popularList
            self.colMovie.reloadData()
        }
    }
}

extension ViewController :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UpcomingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.upcomingModel = UpcomingList[indexPath.row]
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.upcomingModel = UpcomingList[indexPath.row]
        let vc = UIStoryboard(name: "MovieDetail", bundle: nil).instantiateViewController(withIdentifier: "MovieDetail") as! MovieDetail
        vc.ImageString = cell.upcomingModel.backdrop_path
        vc.Name = cell.upcomingModel.original_title
        vc.Overview = cell.upcomingModel.overview
        vc.Date = cell.upcomingModel.release_date
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        PopularList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMovieCell", for: indexPath) as! PopularMovieCell
        cell.popularModel = PopularList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = colMovie.frame.size.width / 2 - 90
        return CGSize(width: width ,height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMovieCell", for: indexPath) as! PopularMovieCell
        cell.popularModel = PopularList[indexPath.row]
        let vc = UIStoryboard(name: "MovieDetail", bundle: nil).instantiateViewController(withIdentifier: "MovieDetail") as! MovieDetail
        vc.ImageString = cell.popularModel.backdrop_path
        vc.Name = cell.popularModel.original_title
        vc.Overview = cell.popularModel.overview
        vc.Date = cell.popularModel.release_date
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController : MovieCellDelegate {
    
    func onTapAdd(cell: MovieCell) {
        FavouriteDAO.shared.addFav(id: cell.upcomingModel.id, name: cell.upcomingModel.original_title!, photo: cell.upcomingModel.backdrop_path!)
        print("ok")
        
    }
}

