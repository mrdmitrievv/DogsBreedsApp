import UIKit

class TableViewCell: UITableViewCell {
    func configure(with dogBreed: DogBreed) {
        var content = defaultContentConfiguration()
        content.text = dogBreed.name
        guard let imageData = DogBreedImage.shared.fetchImageData(from: dogBreed.image.url) else { return }
        content.image = UIImage(data: imageData)
        contentConfiguration = content
    }
}
