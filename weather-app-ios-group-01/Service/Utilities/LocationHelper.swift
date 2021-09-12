//
//  LocationHelper.swift
//  weather-app-ios-group-01
//
//  Created by jack Maarek on 12/09/2021.
//

import CoreLocation
import SwiftUI

class LocationHelper: NSObject, ObservableObject {
    @Published var locationChanged: Bool = false

    static let helper = LocationHelper()
    static let DefaultLocation = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
    private let locationManager = CLLocationManager()

    static var currentLocation: CLLocationCoordinate2D {
        guard let location = helper.locationManager.location else {
            return DefaultLocation
        }
        return location.coordinate
    }

    override private init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationHelper: CLLocationManagerDelegate {
    func locationManager(_: CLLocationManager, didUpdateLocations _: [CLLocation]) {
        locationChanged = true
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
        manager.stopUpdatingLocation()
    }

    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied:
            manager.stopUpdatingLocation()

        case .authorizedWhenInUse:
            manager.startUpdatingLocation()

        case .notDetermined:
            manager.requestWhenInUseAuthorization()

        default:
            manager.stopUpdatingLocation()
        }
    }
}
