import UIKit

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
}
