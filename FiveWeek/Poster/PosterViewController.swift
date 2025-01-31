//
//  PosterViewController.swift
//  FiveWeek
//
//  Created by 권우석 on 1/24/25.
//

import UIKit
import SnapKit
import Kingfisher
class PosterViewController: UIViewController {

    lazy private var tableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.rowHeight = 200
        view.register(PosterTableViewCell.self, forCellReuseIdentifier: PosterTableViewCell.id)
        return view
    }()
    
    var list = ["test1", "test2", "test3"]
    
    var detailList1 = ["star.fill", "pencil", "xmark", "heart"]
    var detailList2 = ["pencil", "xmark", "heart"]
    var detailList3 = ["star", "pencil", "xmark", "heart.fill"]
    var detailList: [[RandomPhoto]] = [
        [],
        [],
        []
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        let group = DispatchGroup()
        
        group.enter()
        PhotoManager.shared.getRandomPhoto(api: .randomPhoto) { photo in
            self.detailList[0] = photo
            group.leave()
        } failHandler: {
            print("실패")
        }
        
        group.enter()
        PhotoManager.shared.getRandomPhoto(api: .randomPhoto) { photo in
            self.detailList[1] = photo
            group.leave()
        } failHandler: {
            print("실패")
        }
        
        group.enter()
        PhotoManager.shared.getRandomPhoto(api: .randomPhoto) { photo in
            self.detailList[2] = photo
            group.leave()
        } failHandler: {
            print("실패")
        }
        
        
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
        
    }
    
    
    


}
extension PosterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.id) as!  PosterTableViewCell
        cell.titleLabel.text = list[indexPath.row]
        cell.collectionView.backgroundColor = .green
        cell.collectionView.tag = indexPath.row
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.id)
        cell.collectionView.reloadData()
        return cell
    }
    
    
    
    
}

extension PosterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
            return detailList[collectionView.tag].count
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.id, for: indexPath) as! PosterCollectionViewCell
        
        
        
        
        let data = detailList[collectionView.tag][indexPath.item]
        let link = URL(string: data.urls.thumb)
        cell.posterImageView.kf.setImage(with: link)
        
        
        return cell
    }
    
    
}
