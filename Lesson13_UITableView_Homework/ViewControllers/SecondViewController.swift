//
//  SecondViewController.swift
//  Lesson13_UITableView_Homework
//
//  Created by Valery Zvonarev on 14.02.2026.
//

import UIKit

final class SecondViewController: UIViewController {

    // MARK: - Properties
    private var titleString: String?
    private var subTitleString: String?
    private var iconString: String?

    init(titleString: String? = nil, subTitleString: String? = nil, iconString: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.titleString = titleString
        self.subTitleString = subTitleString
        self.iconString = iconString
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        return label
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.backgroundColor = .white
        imageView.tintColor = .systemBlue
        return imageView
    }()

    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewProperties()
        setupSubviews()
        setupConstraints()
    }

    // MARK: - Layout
    private func setupViewProperties(){
        view.backgroundColor = .systemGray2
    }

    private func setupSubviews(){
        titleLabel.text = titleString
        subTitleLabel.text = subTitleString
        iconImageView.image = UIImage(systemName: iconString ?? "home.fill")
        [titleLabel, subTitleLabel, iconImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            iconImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            iconImageView.widthAnchor.constraint(equalToConstant: 70),
            iconImageView.heightAnchor.constraint(equalToConstant: 70),

            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
//            subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

        ])
    }

    //    @objc private func didTapButton(){
    //    }
}

#Preview {
    SecondViewController()
}

