import UIKit

class BreedsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: BreedsTableViewModelProtocol! {
        didSet {
            viewModel.fetchDogBreeds {
                self.tableView.reloadData()
                self.spinnerView.stopAnimating()
            }
        }
    }
    
    private var spinnerView: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = BreedsTableViewModel()
        tableView.rowHeight = 80
        spinnerView = showActivityIndicator(in: view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let viewModel = viewModel.viewModelForSelectedRow(at: indexPath)
        let breedDetailsVC = segue.destination as! BreedDetailsViewController
        breedDetailsVC.viewModel = viewModel
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

extension BreedsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let viewModel = viewModel.viewModelForCell(at: indexPath)
        cell.configure(with: viewModel)
        return cell
    }
}

extension BreedsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

