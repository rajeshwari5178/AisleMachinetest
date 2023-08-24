//
//  InterestedTableViewCell.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import UIKit

class InterestedTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    var profileData:[Profiles]?
   
    @IBOutlet weak var mCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //configuretablecell
    
    func configuretablecell(with profileData: [Profiles]?) {
        print("profileData",profileData!)
        if let profileData = profileData {
            self.profileData = profileData
           
        }
        mCollectionView.reloadData()
    }
    
    //collectionViewSetup
    
    private func collectionViewSetup(){
        mCollectionView.delegate=self
        mCollectionView.dataSource=self
        mCollectionView.isScrollEnabled = true
        mCollectionView.register(UINib(nibName: "InterestedCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "InterestedCollectionViewCell")
    setCollectionViewLayouts()
    }
    
    
    
    func setCollectionViewLayouts(){
            let flowLayout=UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            
        flowLayout.itemSize=CGSize(width: 200, height: 260)
            flowLayout.minimumLineSpacing = 5
         flowLayout.minimumInteritemSpacing = 5
        mCollectionView.layer.cornerRadius=5; mCollectionView.setCollectionViewLayout(flowLayout, animated: true)
           
          
        }

}


extension InterestedTableViewCell:UICollectionViewDelegateFlowLayout{
    ///collection view methods
    ///
    ///
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return profileData?.count ?? 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestedCollectionViewCell", for: indexPath) as? InterestedCollectionViewCell else { return UICollectionViewCell() }
//
      let dataimage=profileData![indexPath.item].avatar!
        cell.Imagevieww.download(from: dataimage)
        print("profileData===",profileData![indexPath.item].avatar!)
    cell.Label1.text="\(profileData![indexPath.item].first_name?.uppercased() ?? "")"
      print("\(cell.Label1.text)")
        return cell
    }
   
}
