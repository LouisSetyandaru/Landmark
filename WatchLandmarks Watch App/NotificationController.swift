//
//  NotificationController.swift
//  WatchLandmarks Watch App
//
//  Created by student on 25/04/24.
//

import WatchKit
import SwiftUI
import UserNotifications

// Pengontrol untuk menangani notifikasi dan menampilkan tampilan notifikasi.
class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var landmark: Landmark?
    var title: String?
    var message: String?
    
    // Kunci untuk mengambil indeks landmark dari informasi notifikasi.
    let landmarkIndexKey = "landmarkIndex"
    
    // Menampilkan tampilan notifikasi dengan judul, pesan, dan informasi landmark yang diterima.
    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }

    // Menangani penerimaan notifikasi.
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()

        // Mendapatkan data notifikasi.
        let notificationData =
            notification.request.content.userInfo as? [String: Any]

        // Mendapatkan informasi judul dan pesan dari notifikasi.
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]


        title = alert?["title"] as? String
        message = alert?["body"] as? String

        // Mendapatkan indeks landmark jika ada dari informasi notifikasi.
        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
}
