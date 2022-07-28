import UIKit

class BreedDetailsViewController: UIViewController {
    
    @IBOutlet var dogBreedImage: DogBreedImage! {
        didSet {
            dogBreedImage.layer.cornerRadius = dogBreedImage.frame.width / 2
            dogBreedImage.contentMode = .scaleAspectFit
            dogBreedImage.clipsToBounds = true
            dogBreedImage.backgroundColor = .black
        }
    }
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var dogBreed: DogBreed?
    
    private var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = dogBreed?.description
        activityIndicator = showActivityIndicator(in: view)
        fetchImage(from: dogBreed?.image.url ?? "")
    }
    
    
    private func fetchImage(from url: String) {
        dogBreedImage.fetchImageWithAF(from: url)
        activityIndicator.stopAnimating()
    }
    
    private func showActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
}
