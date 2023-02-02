
import UIKit


class HomeViewController: UIViewController, HomeViewDelegate {
    private var artObjects: [ArtObject] = []
    
    func getArtObjects() {
            ApiService.shared.getArtObjectsPage { [weak self] items in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.homeView.configure(artObjects: items)
                }
        }
    }
    
    private let homeView = HomeView(frame: .zero)
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.delegate = self
        getArtObjects()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }
    
}
