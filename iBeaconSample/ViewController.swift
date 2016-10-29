//
//  ViewController.swift
//  iBeaconSample
//
//  Created by goritech on 2016/10/29.
//  Copyright © 2016年 goritech. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    
    let height = CGFloat(30)
    var baseView: UIView!
    var uuidLabel: UILabel!
    var uuidTitleLabel: UILabel!
    var majorLabel: UILabel!
    var majorTitleLabel: UILabel!
    var minorLabel: UILabel!
    var minorTitleLabel: UILabel!
    var proximityLabel: UILabel!
    var proximityTitleLabel: UILabel!
    var accuracyLabel: UILabel!
    var accuracyTitleLabel: UILabel!
    var rssiLabel: UILabel!
    var rssiTitleLabel: UILabel!
    
    var beaconRegion: CLBeaconRegion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
        
        // UUID
        let uuidString = "B9407F30-F5F8-466E-AFF9-25556B57FE6D"
        // Major
        let majorValue = 17740
        // Minor
        let minorValue = 30611
        let beaconIdentifier = "iBeacon"
        let beaconUUID = UUID(uuidString: uuidString)
        
        // UUIDのみ指定
        beaconRegion = CLBeaconRegion(proximityUUID: beaconUUID!, identifier: beaconIdentifier)
        // Major, Minorも指定
        //beaconRegion = CLBeaconRegion(proximityUUID: beaconUUID!, major: CLBeaconMajorValue(majorValue), minor: CLBeaconMinorValue(minorValue), identifier: beaconIdentifier)
        
        // Beaconエリアの監視
        locationManager.startMonitoring(for: beaconRegion)
        
        // 表示の設定
        baseView = UIView()
        baseView.frame = self.view.bounds
        baseView.backgroundColor = UIColor.white
        self.view.addSubview(self.baseView)
        
        uuidTitleLabel = UILabel(frame: CGRect(x: 0, y: 50, width: self.view.bounds.size.width * 0.2, height: self.height))
        uuidTitleLabel.text = "UUID"
        uuidTitleLabel.textAlignment = .right
        uuidTitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(uuidTitleLabel)
        
        uuidLabel = UILabel(frame: CGRect(x: self.view.bounds.size.width * 0.2 + 20, y: 50, width: self.view.bounds.size.width * 0.8 - 20, height: self.height))
        uuidLabel.textAlignment = .left
        uuidLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(uuidLabel)
        
        majorTitleLabel = UILabel(frame: CGRect(x: 0, y: uuidTitleLabel.frame.maxY, width: self.view.bounds.size.width * 0.2, height: self.height))
        majorTitleLabel.text = "Major"
        majorTitleLabel.textAlignment = .right
        majorTitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(majorTitleLabel)
        
        majorLabel = UILabel(frame: CGRect(x: self.view.bounds.size.width * 0.2 + 20, y: uuidTitleLabel.frame.maxY, width: self.view.bounds.size.width * 0.8 - 20, height: self.height))
        majorLabel.textAlignment = .left
        majorLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(majorLabel)
        
        minorTitleLabel = UILabel(frame: CGRect(x: 0, y: majorTitleLabel.frame.maxY, width: self.view.bounds.size.width * 0.2, height: self.height))
        minorTitleLabel.text = "Minor"
        minorTitleLabel.textAlignment = .right
        minorTitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(minorTitleLabel)
        
        minorLabel = UILabel(frame: CGRect(x: self.view.bounds.size.width * 0.2 + 20, y: majorTitleLabel.frame.maxY, width: self.view.bounds.size.width * 0.8 - 20, height: self.height))
        minorLabel.textAlignment = .left
        minorLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(minorLabel)
        
        proximityTitleLabel = UILabel(frame: CGRect(x: 0, y: minorTitleLabel.frame.maxY, width: self.view.bounds.size.width * 0.2, height: self.height))
        proximityTitleLabel.text = "Proximity"
        proximityTitleLabel.textAlignment = .right
        proximityTitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(proximityTitleLabel)
        
        proximityLabel = UILabel(frame: CGRect(x: self.view.bounds.size.width * 0.2 + 20, y: minorTitleLabel.frame.maxY, width: self.view.bounds.size.width * 0.8 - 20, height: self.height))
        proximityLabel.textAlignment = .left
        proximityLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(proximityLabel)
        
        accuracyTitleLabel = UILabel(frame: CGRect(x: 0, y: proximityTitleLabel.frame.maxY, width: self.view.bounds.size.width * 0.2, height: self.height))
        accuracyTitleLabel.text = "Accuracy"
        accuracyTitleLabel.textAlignment = .right
        accuracyTitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(accuracyTitleLabel)
        
        accuracyLabel = UILabel(frame: CGRect(x: self.view.bounds.size.width * 0.2 + 20, y: proximityTitleLabel.frame.maxY, width: self.view.bounds.size.width * 0.8 - 20, height: self.height))
        accuracyLabel.textAlignment = .left
        accuracyLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(accuracyLabel)
        
        rssiTitleLabel = UILabel(frame: CGRect(x: 0, y: accuracyTitleLabel.frame.maxY, width: self.view.bounds.size.width * 0.2, height: self.height))
        rssiTitleLabel.text = "Rssi"
        rssiTitleLabel.textAlignment = .right
        rssiTitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(rssiTitleLabel)
        
        rssiLabel = UILabel(frame: CGRect(x: self.view.bounds.size.width * 0.2 + 20, y: accuracyTitleLabel.frame.maxY, width: self.view.bounds.size.width * 0.8 - 20, height: self.height))
        rssiLabel.textAlignment = .left
        rssiLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        baseView.addSubview(rssiLabel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            self.locationManager.requestAlwaysAuthorization()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        // 見つかったbeaconのリスト
        if beacons.count > 0 {
            uuidLabel.text = beacons[0].proximityUUID.uuidString
            majorLabel.text = beacons[0].major.stringValue
            minorLabel.text = beacons[0].minor.stringValue
            accuracyLabel.text = String(beacons[0].accuracy)
            rssiLabel.text = String(beacons[0].rssi)
            switch beacons[0].proximity {
            case .far:
                proximityLabel.text = "Far"
                break
            case .immediate:
                proximityLabel.text = "Immediate"
                break
            case .near:
                proximityLabel.text = "Near"
                break
            case .unknown:
                proximityLabel.text = "Unknown"
                break
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        switch state {
        case .inside:
            break
        case .outside:
            break
        case .unknown:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        // レイジング開始
        locationManager.startRangingBeacons(in: beaconRegion)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        // レイジング終了
        locationManager.stopRangingBeacons(in: beaconRegion)
    }
    
}

