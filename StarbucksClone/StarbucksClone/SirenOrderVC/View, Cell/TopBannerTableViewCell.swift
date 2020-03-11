//
//  TopBannerTableViewCell.swift
//  StarbuckCloneEx2
//
//  Created by Mac mini on 2020/03/07.
//  Copyright © 2020 Mac mini. All rights reserved.
//

import UIKit

class TopBannerTableViewCell: UITableViewCell {

   static let identifier = "TopBannerTableViewCell"
    
    let flowLayout = UICollectionViewFlowLayout()
    let viewWidth = UIScreen.main.bounds.width
    lazy var collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: 155), collectionViewLayout: flowLayout)
    let pageControl = UIPageControl()
    
  // image이름
    let items = ["SirenBanner1", "SirenBanner2", "SirenBanner3", "SirenBanner4", "SirenBanner5"]
    var time = Timer()
    var counter = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      
      setupCollectionView()
      pageControl.numberOfPages = items.count
      pageControl.pageIndicatorTintColor = .black
      //pageControl.currentPage = 0
      collectionView.isPagingEnabled = true
      
      DispatchQueue.main.async {
        self.time = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImages), userInfo: nil, repeats: true)
      }
      setupAutolayout()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    @objc func changeImages() {
      if counter < items.count {
        let index = IndexPath.init(item: counter, section: 0)
        self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        pageControl.currentPage = counter
        counter += 1
      } else {
        counter = 0
        let index = IndexPath.init(item: counter, section: 0)
        self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
        pageControl.currentPage = counter
        counter += 1
        
      }
    }
      
      func setupAutolayout() {
        contentView.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
          pageControl.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
        ])
      }
      
  // setupFlowLayout(), setupCollectionView() -> collectionView 셋팅
      func setupFlowLayout() {
        flowLayout.itemSize = CGSize(width: viewWidth, height: 155)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
      }
      
      func setupCollectionView() {
        setupFlowLayout()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TopBannerCollectionViewCell.self, forCellWithReuseIdentifier: TopBannerCollectionViewCell.identifier)
        contentView.addSubview(collectionView)
      }
}
extension TopBannerTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopBannerCollectionViewCell.identifier, for: indexPath) as! TopBannerCollectionViewCell
    cell.configure(image: UIImage(named: items[indexPath.item]))
    
    return cell
  }
  
  
}
extension TopBannerTableViewCell: UICollectionViewDelegateFlowLayout {
  // pageController 현재 페이지 표시하도록 설정!
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       let pageSide = self.collectionView.frame.width
       let offset = scrollView.contentOffset.x
       var pageNumber = Int(floor((offset - pageSide / 2) / pageSide) + 1)
       pageControl.currentPage = pageNumber
       counter = pageNumber
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let size = collectionView.frame.size
       return CGSize(width: size.width, height: size.height)
     }
  
}


