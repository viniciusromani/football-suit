import UIKit

class CompetitionListTableViewCell: UITableViewCell {
    private let content = UIStackView()
    private let flag = UIImageView()
    private let name = UILabel()
    private let from = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.buildViews()
    }
    
    private func buildViews() {
        self.addSubviews()
        self.formatSubviews()
        self.addConstraintsToSubviews()
    }

    private func addSubviews() {
        self.content.addArrangedSubviews([self.name,
                                          self.from])
        self.contentView.addSubviews([self.flag,
                                      self.content])
    }

    private func formatSubviews() {
        self.flag.clipsToBounds = true
        self.flag.contentMode = .scaleAspectFill
        self.flag.layer.cornerRadius = 64 / 2
        self.flag.layer.borderWidth = 0.5
        self.flag.layer.borderColor = UIColor.black.cgColor
        
        self.content.axis = .vertical
        self.content.spacing = 8
        
        self.name.numberOfLines = 1
        self.name.textColor = .black
        self.name.font = .systemFont(ofSize: 16)
        
        self.from.numberOfLines = 2
        self.from.textColor = .gray
        self.from.font = .systemFont(ofSize: 12)
    }
    
    private func addConstraintsToSubviews() {
        flag.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.width.height.equalTo(64)
            make.centerY.equalToSuperview()
        }
        
        content.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(8)
            make.left.equalTo(self.flag.snp.right).offset(16)
        }
    }
}

extension CompetitionListTableViewCell {
    func set(viewModel: CompetitionViewModel) {
        self.flag.image = viewModel.country.flag
        self.name.text = viewModel.name
        self.from.text = viewModel.currentSeason.year
    }
}
