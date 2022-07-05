import UIKit

class BreedDetailsViewController: UIViewController {
    
    @IBOutlet private weak var dogImage: UIImageView! {
        didSet {
            dogImage.contentMode = .scaleToFill
            dogImage.clipsToBounds = true
            dogImage.layer.cornerRadius = dogImage.bounds.height / 2
        }
    }
    
    @IBOutlet weak var breedNameLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var bredForLabel: UILabel!
    @IBOutlet weak var lifeSpanLabel: UILabel!
    
    var viewModel: BreedDetailsViewModelProtocol!
    private var spinnerView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinnerView = showActivityIndicator(in: view)
        setupUI()
    }
    
    private func setupUI() {
        breedNameLabel.text = viewModel.breedName
        originLabel.text = viewModel.origin ?? "n/a"
        temperamentLabel.text = viewModel.temperament ?? "n/a"
        bredForLabel.text = viewModel.bredFor ?? "n/a"
        lifeSpanLabel.text = viewModel.lifeSpan ?? "n/a"
        guard let imageData = viewModel.imageData else { return }
        DispatchQueue.main.async {
            self.dogImage.image = UIImage(data: imageData)
        }
        spinnerView.stopAnimating()
    }
    
    private func showActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)        
        return activityIndicator
    }
}
