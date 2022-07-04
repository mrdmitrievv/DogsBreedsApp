import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var dogBreedImage: UIImageView! {
        didSet {
            dogBreedImage.contentMode = .scaleToFill
            dogBreedImage.clipsToBounds = true
            dogBreedImage.layer.cornerRadius = dogBreedImage.bounds.height / 2            
        }
    }
        
    @IBOutlet weak var breedName: UILabel!
        
    func configure(with dogBreed: DogBreed) {
        breedName.text = dogBreed.name
        guard let imageData = DogBreedImage.shared.fetchImageData(from: dogBreed.image?.url) else { return }
        dogBreedImage.image = UIImage(data: imageData)
    }
}
