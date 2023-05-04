//
//  PhotosCollectionViewController.swift
//  UICollectionView
//
//  Created by Kate Kashko on 4.05.2023.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    let photos = ["1", "2", "3", "4", "5", "6", "7", "8",
                  "9", "10", "11", "12", "13", "14", "15"]
    
    let itemsPerRow: CGFloat = 2 //кол-во картинок по ширине
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Один из способов настройки layout:
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 70, height: 70)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
//        layout.scrollDirection = .vertical
//        collectionView.showsVerticalScrollIndicator = false //скрывает ползунок справа
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
       
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        cell.worldImageView.image = image
   
        
        return cell
    }
}
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout  {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInsets.left * (itemsPerRow + 1) //общая величина всех отступов по ширине
        let availableWidth = collectionView.frame.width - paddingWidth //доступна ширина для размещения картинок
        let widthPerItem = availableWidth / itemsPerRow //точная доступная ширина для одной картинки
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets //отступы всей коллекции
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left // отступ между картинками по высоте
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left // отступ между картинками по ширине
    }
}
