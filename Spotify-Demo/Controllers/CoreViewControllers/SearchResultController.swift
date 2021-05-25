//
//  SearchResultController.swift
//  Spotify-Demo
//
//  Created by Wang Sheng Ping on 2021/5/24.
//

import UIKit

class SearchResultController: UIViewController {

    //MARK: - Properties
    
    let searchResultView = SearchResultView()
    var searchResult: SearchResult? {
        didSet{
            DispatchQueue.main.async {
                self.searchResultView.resultTableView.reloadData()
            }
        }
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = searchResultView
        searchResultView.resultTableView.delegate = self
        searchResultView.resultTableView.dataSource = self
        searchResultView.searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
    }
    
    //MARK: - Functions
    
    @objc func search() {
        print("zzz")
        if let text = searchResultView.searchTextField.text?.replacingOccurrences(of: " ", with: "") {
            APICaller.shared.searchSong(text: text) { result in
                switch result {
                case .success(let songs):
                    self.searchResult = songs
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
    

}

extension SearchResultController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult?.tracks.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell()}
        
        guard let result = searchResult?.tracks.items.map({$0}) else { return UITableViewCell() }
        if let url = URL(string: result[indexPath.row].album.images[0].url) {
            cell.myImageView.getImages(url: url)
            cell.songLabel.text = result[indexPath.row].name
            cell.singerLabel.text = result[indexPath.row].artists[0].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
