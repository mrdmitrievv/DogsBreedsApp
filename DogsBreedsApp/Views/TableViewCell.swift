import UIKit
import Alamofire
import AlamofireImage

class TableViewCell: UITableViewCell {
    @IBOutlet weak var breedNameLabel: UILabel!
    @IBOutlet weak var dogBreedImage: DogBreedImage! {
        didSet {
            dogBreedImage.contentMode = .scaleAspectFit
            dogBreedImage.clipsToBounds = true
            dogBreedImage.layer.cornerRadius = dogBreedImage.bounds.height / 2
            dogBreedImage.backgroundColor = .black
        }
    }
    
    func configureWithIndex(with dogBreeds: [DogBreed], and indexPathRow: Int) {
        let dogBreed = dogBreeds[indexPathRow]
        breedNameLabel.text = dogBreed.name                        
        
        DispatchQueue.main.async {
            if dogBreed.referenceImageId == dogBreed.image.id {
                self.dogBreedImage.fetchImageWithAF(from: dogBreed.image.url)
            } else {
                self.dogBreedImage.image = nil
            }
            
        }        
    }
    
//    func configureCell(forArray dogBreeds: [DogBreed], for cell: UITableViewCell, and indexPath: IndexPath, tableView: UITableView) {
//        breedNameLabel.text = dogBreeds[indexPath.row].name
//        DispatchQueue.main.async {
//            let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
//            cell?.dogBreedImage.image
//        }
//    }
    
    /*func configure(from dogBreed: DogBreed) {
        breedNameLabel.text = dogBreed.name
        DispatchQueue.global().async {
            guard let stringUrl = dogBreed.image.url else { return }
            guard let imageURL = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.dogBreedImage.image = UIImage(data: imageData)
            }
        }
    }*/
}
