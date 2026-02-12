//
//  CellView.swift
//  Lesson13_UITableView_Homework
//
//  Created by Valery Zvonarev on 12.02.2026.
//

import UIKit

final class CustomCellView: UITableViewCell {

    // MARK: - Properties
    static let reuseIdentifier: String = "CustomCellView"

    private lazy var cellTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.layer.cornerRadius = 12
        label.backgroundColor = .systemGreen
//        label.backgroundColor = .clear
        return label
    }()

//    private lazy var cellTitleView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 12
//        view.backgroundColor = .systemGreen
//        return view
//    }()

    private lazy var cellSubtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.textColor = .white
        label.layer.cornerRadius = 12
        label.backgroundColor = .systemBlue
        return label
    }()

    private lazy var cellImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = 25
        myImageView.layer.borderWidth = 1
        myImageView.layer.borderColor = UIColor.black.cgColor
        myImageView.backgroundColor = .white
        myImageView.tintColor = .systemBlue
        return myImageView
    }()

    private var cellBGColor: UIColor = .clear {
        didSet {
            contentView.backgroundColor = cellBGColor
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        cellTitleLabel.text = nil
        cellSubtitleLabel.text = nil
        cellImageView.image = nil
        cellBGColor = .clear
    }

    // MARK: - Subviews

    // MARK: - Lifecycles

    // MARK: - Layout
    private func setupViewProperties(){
        contentView.backgroundColor = cellBGColor
    }

    private func setupSubviews(){
//        cellTitleView.addSubview(cellTitleLabel)
//        contentView.addSubview(cellTitleView)
        contentView.addSubview(cellTitleLabel)
        contentView.addSubview(cellSubtitleLabel)
        contentView.addSubview(cellImageView)

    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
//            cellTitleLabel.topAnchor.constraint(equalTo: cellTitleView.topAnchor, constant: 5),
//            cellTitleLabel.leadingAnchor.constraint(equalTo: cellTitleView.leadingAnchor, constant: 5),
//            cellTitleLabel.trailingAnchor.constraint(equalTo: cellTitleView.leadingAnchor, constant: -5),
//            cellTitleLabel.bottomAnchor.constraint(equalTo: cellTitleView.topAnchor, constant: -5),
//
//            cellTitleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            cellTitleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//            cellTitleView.trailingAnchor.constraint(equalTo: cellImageView.leadingAnchor, constant: -10),
            //            cellTitleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            cellTitleView.widthAnchor.constraint(equalToConstant: 50),
//            cellTitleView.heightAnchor.constraint(equalToConstant: ),

            cellTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellTitleLabel.trailingAnchor.constraint(equalTo: cellImageView.leadingAnchor, constant: -10),

            cellSubtitleLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 5),
            cellSubtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cellSubtitleLabel.trailingAnchor.constraint(equalTo: cellImageView.leadingAnchor, constant: -10),
            cellSubtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cellImageView.widthAnchor.constraint(equalToConstant: 50),
            cellImageView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    func configure(with model: CellModel) {
        cellTitleLabel.text = model.title
        cellSubtitleLabel.text = model.subtitle
        cellImageView.image = UIImage(systemName: model.imageName)
        cellBGColor = model.cellBackgroundColor
    }

    //    @objc private func didTapButton(){
    //    }
}

#Preview {
    CustomCellView()
}





