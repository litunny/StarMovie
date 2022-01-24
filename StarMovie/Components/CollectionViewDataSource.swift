//
//  CollectionViewDataSource.swift
//  StarMovie
//
//  Created by Itunu on 23/01/2022.
//

import UIKit

class CollectionViewDataSource<Cell : UICollectionViewCell, T> : NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (Cell, T) -> () = {_,_ in }
    var size : CGSize!
    private var edgeInsects : UIEdgeInsets!

    init(cellIdentifier : String, items : [T], size : CGSize, configureCell : @escaping (Cell, T) -> (), _ edgeInsects : UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
          self.cellIdentifier = cellIdentifier
          self.items =  items
          self.configureCell = configureCell
          self.size = size
          self.edgeInsects = edgeInsects
      }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! Cell
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return edgeInsects //UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 5)
    }
}

class UICollectionViewGeneric<Cell : UICollectionViewCell> :  UICollectionView {

    private let layout = UICollectionViewFlowLayout()
    private var cell : Cell?

    init(scrollDirection : UICollectionView.ScrollDirection, cell : Cell) {
        layout.scrollDirection = scrollDirection
        self.cell = cell
        super.init(frame: .zero, collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

