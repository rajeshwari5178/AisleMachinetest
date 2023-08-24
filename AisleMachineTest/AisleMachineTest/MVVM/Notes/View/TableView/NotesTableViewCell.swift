//
//  NotesTableViewCell.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import UIKit

class NotesTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource  {
 
    
    var photosData:[Photos]?
    
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension NotesTableViewCell{
  
    func configuretablecell(with photosData: [Photos]?) {
      //  print("hh",photosData)
        if var photosData = photosData {
            self.photosData = photosData
          
        }
        mCollectionView.reloadData()
    }
    // collectionViewSetup
    
    private func collectionViewSetup(){
        mCollectionView.delegate=self
        mCollectionView.dataSource=self
        mCollectionView.isScrollEnabled = true
        mCollectionView.register(UINib(nibName: "NotesCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "NotesCollectionViewCell")
    setCollectionViewLayouts()
    }
    func setCollectionViewLayouts(){
            let flowLayout=UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            
        flowLayout.itemSize=CGSize(width: 380, height: 360)
            flowLayout.minimumLineSpacing = 20
         flowLayout.minimumInteritemSpacing = 20
        mCollectionView.layer.cornerRadius = 20
            mCollectionView.setCollectionViewLayout(flowLayout, animated: true)
           /// CollectiobView1.setCollectionViewLayout(flowLayout, animated: true)
          
        }

}


extension NotesTableViewCell:UICollectionViewDelegateFlowLayout{
    // collection view methods
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosData?.count ?? 0
            }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotesCollectionViewCell", for: indexPath) as? NotesCollectionViewCell else { return UICollectionViewCell() }
//
      let dataimage=photosData![indexPath.item].photo!
        cell.Imagevieww.download(from: dataimage)
        print("photosData---------",photosData![indexPath.item].photo!)
        cell.Label1.text="\(photosData![indexPath.item].status?.uppercased() ?? "")"
      
        return cell
    }
   
}
