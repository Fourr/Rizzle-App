//
//  FeedViewController.swift
//  Rizzle App
//
//  Created by Johnny Sheffer on 1/18/21.
//

import UIKit
import AVKit
import AVFoundation

final class FeedViewController: UIViewController {
    
    private let viewModel = FeedViewModel()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureCollectionView()
        viewModel.fetchFeed()
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object: nil)
        
    }
    
    private func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.backgroundColor = view.backgroundColor
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.isPagingEnabled = true
        viewModel.configure(collectionView: collectionView)
    }
    
    @objc func onDidReceiveData(_ notification:Notification) {
        let urlString =  notification.object as? String ?? ""
        let fileUrl = URL(string: urlString)

        let player = AVPlayer(url: fileUrl!)
        let vc = AVPlayerViewController()
        vc.player = player

        present(vc, animated: true) {
            vc.player?.play()
        }
    }
    
}


