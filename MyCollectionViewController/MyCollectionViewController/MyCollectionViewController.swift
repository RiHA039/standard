//
//  MyCollectionViewController.swift
//  MyCollectionViewController
//
//  Created by 김리하 on 9/23/25.
//

import UIKit

class MyCollectionViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    let items = Array(1...20)
    
    var collectionView: UICollectionView!
    
    let colums: CGFloat
    let sectionInsetValue: CGFloat
    let itemSpacing: CGFloat
    let rowSpacing: CGFloat
    let itemHeight: CGFloat
    
    init(colums: CGFloat = 3,
         sectionInsetValue: CGFloat = 8,
         itemSpacing: CGFloat = 8,
         rowSpacing: CGFloat = 8,
         itemHeight: CGFloat = 100) {
        
        self.colums = colums
        self.sectionInsetValue = sectionInsetValue
        self.itemSpacing = itemSpacing
        self.rowSpacing = rowSpacing
        self.itemHeight = itemHeight
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = . white
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = rowSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = UIEdgeInsets(top: sectionInsetValue,
                                           left: sectionInsetValue,
                                           bottom: sectionInsetValue,
                                           right: sectionInsetValue)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCollectionViewCell")
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
    }
    
    private func itemSize(for width: CGFloat) -> CGSize {
        let totalSpacing = (colums - 1) * itemSpacing + (sectionInsetValue * 2)
        let itemWidth = (width - totalSpacing) / colums
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize(for: collectionView.bounds.width)
    }
}
