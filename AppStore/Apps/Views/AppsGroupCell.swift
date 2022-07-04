//
//  AppsGroupCell.swift
//  AppStore
//
//  Created by Vladimir Gusev on 29.06.2022.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let header: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Text"
        view.font = .systemFont(ofSize: 32)
        view.backgroundColor = .gray
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(AppCell.self, forCellWithReuseIdentifier: AppCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addSubview(header)
        addSubview(collectionView)
        
        layoutHeader()
        layoutCollectionView()
    }
    
    private func layoutHeader() {
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: topAnchor),
            header.leadingAnchor.constraint(equalTo: leadingAnchor),
            header.trailingAnchor.constraint(equalTo: trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func layoutCollectionView() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: header.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

extension AppsGroupCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCell.identifier, for: indexPath)
        cell.backgroundColor = .systemPink
        return cell
    }
}

extension AppsGroupCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 200, height: 50)
    }
}
