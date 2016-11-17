//
//  ServiceMedicalExaminationViewController.swift
//  OneHealthApp
//
//  Created by Viet Anh on 11/4/16.
//  Copyright © 2016 OneHealth. All rights reserved.
//

import UIKit
import MapKit
class ServiceMedicalExaminationViewController: UIViewController,MKMapViewDelegate{

    @IBOutlet var mapView: MKMapView!
    var location:CLLocation!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var annotation:MKPointAnnotation!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        getMap()
    }
    func getMap(){
        if appDelegate.cordinate != nil{
            var region = MKCoordinateRegion()
            location = CLLocation(latitude: (appDelegate.cordinate?.latitude)!, longitude: (appDelegate.cordinate?.longitude)!)
            region.center.latitude = location.coordinate.latitude
            region.center.longitude = location.coordinate.longitude
            region.span.latitudeDelta = 0.01
            region.span.longitudeDelta = 0.01
            mapView.setRegion(region, animated: true)
            annotation = MKPointAnnotation()
            annotation.title = "Location"
            annotation.coordinate = location.coordinate
            mapView.addAnnotation(annotation)
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            mapView.add(MKCircle(center: center, radius: 10))
        }else{
            print("Not have location")
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //IBAction
    @IBAction func btnActionBack(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnActionDone(_ sender: AnyObject) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectOnlineViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
