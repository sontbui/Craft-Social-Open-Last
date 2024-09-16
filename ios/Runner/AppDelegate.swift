 import Flutter
 import UIKit

 @UIApplicationMain
 @objc class AppDelegate: FlutterAppDelegate {
     override func application(
         _ application: UIApplication,
         didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
     ) -> Bool {
         GeneratedPluginRegistrant.register(with: self)
         return super.application(application, didFinishLaunchingWithOptions: launchOptions)
     }
    
 }

//import Flutter
//import UIKit
//import Firebase
//
//@UIApplicationMain
//@objc class AppDelegate: FlutterAppDelegate {
//    override func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//    ) -> Bool {
//        // Khởi tạo Firebase
//        FirebaseApp.configure()
//        
//        GeneratedPluginRegistrant.register(with: self)
//        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//    }
//
//    // Thêm phương thức này để xử lý thông báo
//    override func application(
//        _ application: UIApplication,
//        didReceiveRemoteNotification userInfo: [AnyHashable: Any],
//        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
//    ) {
//        if Auth.auth().canHandleNotification(userInfo) {
//            completionHandler(.noData)
//            return
//        }
//        // Xử lý các thông báo khác ở đây nếu cần
//        completionHandler(.newData)
//    }
//}
