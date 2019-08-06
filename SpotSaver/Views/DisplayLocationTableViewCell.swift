//
//  DisplayLocationTableViewCell.swift
//  SpotSaver
//
//  Created by Alex Ladines on 8/6/19.
//  Copyright © 2019 Alex Ladines. All rights reserved.
//

import UIKit

class DisplayLocationTableViewCell: UITableViewCell {

    // MARK: - Properties

    // MARK: - IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    // MARK: - IBActions

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Methods
    func configure(for location: Location) {
        if location.locationDescription.isEmpty {
            descriptionLabel.text = "(No Description)"
        }
        else {
            descriptionLabel.text = location.locationDescription
        }

        if let placemark = location.placemark {
            var text = ""
            // House Number
            if let s = placemark.subThoroughfare {
                text += s + " "

            }
            // Street Name
            if let s = placemark.thoroughfare {
                text += s + ", "
            }

            // City
            if let s = placemark.locality {
                text += s

            }

            addressLabel.text = text
        }
        else {
            addressLabel.text = String(format: "Lat: %.8f, Long: %.8f", location.latitude, location.longitude)
        }
    }

    // MARK: - Navigation

    // MARK: - Data Persistance

}