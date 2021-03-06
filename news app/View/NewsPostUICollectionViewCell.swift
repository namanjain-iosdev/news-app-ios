//
//  NewsPostUICollectionViewCell.swift
//  news app
//
//  Created by Naman Jain on 08/09/21.
//

import UIKit


protocol NewsPostCollectionViewCellDelegate: AnyObject{
    func didPressedReadMoreButton()
}

class NewsPostUICollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var shortTitle: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var bottomViewImage: UIImageView!
    
    weak var newsPostCellDelegate: NewsPostCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsDescription.setLineSpacing(lineSpacing: 1.2, lineHeightMultiple: 1.2)
    }
    
    func configureCell(
        shortTitle: String,
        newsTitle: String,
        newsDescription: String,
        newsImage: String
    ){
        DispatchQueue.main.async {
            self.shortTitle.text = shortTitle
            self.newsTitle.text = newsTitle
            self.newsDescription.text = newsDescription
            if let url = URL(string: newsImage){
                // Fetch Image Data
                if let data = try? Data(contentsOf: url) {
                    // Create Image and Update Image View
                    self.newsImage.image = UIImage(data: data)
                    self.bottomViewImage.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func readMoreAction(){
        if let del = newsPostCellDelegate{
            del.didPressedReadMoreButton()
        }
    }
    
    @IBAction func readMoreButtonTapped(_ sender: UIButton) {
//        guard let url = URL(string: getNewsUrl()) else {
//            return
//        }
//
//        let vc = WebViewController(url: url,title: "google")
//        let navVc = UINavigationController(rootViewController: vc)
        readMoreAction()
        print("read more button tapped")
    }
    
    private func getNewsUrl()->String{
        return "https://google.com"
    }
}
