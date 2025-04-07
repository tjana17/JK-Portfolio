//
//  MailComposeViewController.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 27/12/24.
//

import Foundation
import MessageUI

class MailComposeViewController: UIViewController, MFMailComposeViewControllerDelegate {

    static let shared = MailComposeViewController()

    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["tjana17@gmail.com"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            UIApplication.shared.currentUIWindow()?.rootViewController?.present(mail, animated: true)
        } else {
            // show failure alert
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

// MARK: - UIApplication Extension
public extension UIApplication {
    func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }

        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }

        return window

    }
}
