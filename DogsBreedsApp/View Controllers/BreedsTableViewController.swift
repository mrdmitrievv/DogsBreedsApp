import UIKit

class BreedsTableViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    var dogsBreeds: [DogBreed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.rowHeight = 80
        fetchData(from: URLS.breedURL.rawValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = TableView.indexPathForSelectedRow else { return }
        let dogBreed = dogsBreeds[indexPath.row]
        let breedDetailsVC = segue.destination as! BreedDetailsViewController
        breedDetailsVC.dogBreed = dogBreed
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchDataWithAF(from: url) { dogsBreeds in
            self.dogsBreeds = dogsBreeds
            self.TableView.reloadData()
        }
    }
}

extension BreedsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogsBreeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.configureWithIndex(with: dogsBreeds, and: indexPath.row)
        return cell
    }
}

