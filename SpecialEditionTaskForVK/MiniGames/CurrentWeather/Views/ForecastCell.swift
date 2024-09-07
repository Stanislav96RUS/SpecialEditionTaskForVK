//
//  ForecastCell.swift
//  AstonishingWeather
//
//  Created by Stanislav on 26.03.2024.
//

import SnapKit
import UIKit


final class ForecastCell: UITableViewCell {
    
    static var identifier: String { "\(Self.self)" }
    
    let labelDayWeek: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsCurrentWeather.fontSize.fontSize32)
        label.textColor = .white
        return label
    }()
    
    let labelTemp: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ConstantsCurrentWeather.fontSize.fontSize32)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(labelDayWeek)
        addSubview(labelTemp)
        
        labelDayWeek.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(ConstantsCurrentWeather.defaultOffset)
            make.top.equalToSuperview().offset(ConstantsCurrentWeather.defaultOffset)
            make.bottom.equalToSuperview().offset(-ConstantsCurrentWeather.defaultOffset)
        }
        labelTemp.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(ConstantsCurrentWeather.defaultOffset * 20)
            make.top.equalToSuperview().offset(ConstantsCurrentWeather.defaultOffset)
            make.bottom.equalToSuperview().offset(-ConstantsCurrentWeather.defaultOffset)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
