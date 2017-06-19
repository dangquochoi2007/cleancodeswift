//
//  AppDelegate.swift
//  CleanStore
//
//  Created by hoi on 3/5/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
     var locationManager:CLLocationManager?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let screen = UIScreen.main
        self.window = UIWindow(frame: screen.bounds)
        self.window?.rootViewController = SignUpViewController()
        self.window?.makeKeyAndVisible()
        
//        let beaconUUID:UUID = UUID(uuidString: iBeaconViewModel.FetchPromotion.Request.uuid)!
//        let beaconRegion:CLBeaconRegion = CLBeaconRegion(proximityUUID: beaconUUID, identifier: iBeaconViewModel.FetchPromotion.Request.beaconIdentifier)
//    
//        locationManager = CLLocationManager()
//        if (CLLocationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization))) {
//            
//            locationManager?.requestWhenInUseAuthorization()
//        }
//        locationManager?.delegate = self
//        locationManager?.pausesLocationUpdatesAutomatically = false
//        // 20 beacons at a given time.
//        locationManager?.startMonitoring(for: beaconRegion)
//        
//        locationManager?.startRangingBeacons(in: beaconRegion)
//        //https://spin.atomicobject.com/2017/01/31/ibeacon-in-swift/
//        // Apple will reject it
//        
//        locationManager?.startUpdatingLocation()
        
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            center.requestAuthorization(options: [UNAuthorizationOptions.sound], completionHandler: { (granted, error) in
                
                if error == nil {
                    
                    UIApplication.shared.registerForRemoteNotifications()
                }
            })
        } else {
            // Lower version > 7.0
            let settings = UIUserNotificationSettings(types: [UIUserNotificationType.alert, UIUserNotificationType.badge, UIUserNotificationType.sound], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CleanStore")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("User info notification")
        completionHandler([
            UNNotificationPresentationOptions.sound,
            UNNotificationPresentationOptions.alert,
            UNNotificationPresentationOptions.badge
            ])
    }
    
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("user received notification")
        completionHandler()
    }
}


extension AppDelegate: CLLocationManagerDelegate {
    
    func sendLocalNotificationWithMessage(message: String, playSound: Bool) {
    
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        
        let knowBeacons = beacons.filter{
            $0.proximity != CLProximity.unknown
        }
        
        if (knowBeacons.count > 0) {
            
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
        guard region is CLBeaconRegion else {
            return
        }
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
        guard region is CLBeaconRegion else {
            return
        }
        
        
        
    }
    
    
    func tet() {
    
        let view1 = UIView()
        view1.alpha = 0.3
        
        
    }
}

