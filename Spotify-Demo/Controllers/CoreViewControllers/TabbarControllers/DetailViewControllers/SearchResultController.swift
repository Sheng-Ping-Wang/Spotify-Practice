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
        searchResultView.searchTextField.delegate = self
        searchResultView.searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
    }
    
    //MARK: - Functions
    
    @objc func search() {
        if let text = searchResultView.searchTextField.text?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            APICaller.shared.searchSong(text: text) { result in
                switch result {
                case .success(let songs):
                    self.searchResult = songs
                    DispatchQueue.main.async {
                        self.searchResultView.resultTableView.isHidden = false
                        self.searchResultView.errorLabel.isHidden = true
                    }
                case .failure(let error):
                    print("Error: \(error)")
                    DispatchQueue.main.async {
                        self.searchResultView.errorLabel.isHidden = false
                        self.searchResultView.resultTableView.isHidden = true
                        self.searchResultView.errorLabel.text = "Couldn't find \(text), please try again."
                    }
                    
                }
            }
        }
    }
    

}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchResultController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult?.tracks.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell()}
        
        guard let result = searchResult?.tracks.items.map({$0}) else { return UITableViewCell() }
        let info = result[indexPath.row]
        
        if let url = URL(string: info.album?.images.first?.url ?? "") {
            cell.myImageView.getImages(url: url)
            cell.songLabel.text = info.name
            cell.singerLabel.text = info.artists.first?.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerVC = PlayerViewController()
        let result = searchResult?.tracks.items[indexPath.row]

        playerVC.song = PlaySongInfo(imageUrl: searchResult?.tracks.items[indexPath.row].album?.images.first?.url ?? "",
            song: result?.name ?? "",
            singer: result?.artists.first?.name ?? "",
            previewUrl: result?.preview_url ?? "",
            songID: result?.artists.first?.id ?? "")

        playerVC.isPlaylist = false
        present(playerVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    //滑動時收鍵盤
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchResultView.searchTextField.resignFirstResponder()
    }
    
}

//按下Enter收鍵盤並開始搜尋
extension SearchResultController: UITextFieldDelegate {
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        search()
        return true
    }
    
    
}