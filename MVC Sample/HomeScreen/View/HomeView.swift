
import UIKit
import SnapKit

protocol HomeViewDelegate: AnyObject {
    //func getArtObjects() -> [ArtObject]
}

class HomeView: UIView {
    weak var delegate: HomeViewDelegate?
    
    // MARK: - Private properties
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var listArtObjects: [ArtObject] = []
    
    // MARK: - Page init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(artObjects: [ArtObject]) {
       listArtObjects = artObjects
       tableView.reloadData()
    }

    
    private func addSubviews() {
        addSubview(tableView)
        tableView.dataSource = self

    }
    
    private func makeConstraints(){
        tableView.snp.makeConstraints{  make in
            make.edges.equalToSuperview()
        }
    }
    
    
}

extension HomeView: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArtObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let title = listArtObjects[indexPath.row].title
        cell.textLabel?.text = title
        
        return cell
    }
    
}
