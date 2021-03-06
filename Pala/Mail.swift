//
//  Mail.swift
//  Pala
//
//  Created by Jaime Castañeda on 15/03/22.
//

import SwiftUI
import UIKit
import MessageUI

public typealias MailViewCallback = ((Result<MFMailComposeResult, Error>) -> Void)?

public struct MailView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentation
    @Binding var data: ComposeMailData
    let callback: MailViewCallback
    
    public init(data: Binding<ComposeMailData>,
                callback: MailViewCallback) {
        _data = data
        self.callback = callback
    }

    public class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var presentation: PresentationMode
        @Binding var data: ComposeMailData
        let callback: MailViewCallback

        public init(presentation: Binding<PresentationMode>,
             data: Binding<ComposeMailData>,
             callback: MailViewCallback) {
            _presentation = presentation
            _data = data
            self.callback = callback
        }

        public func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            if let error = error {
                callback?(.failure(error))
            } else {
                callback?(.success(result))
            }
            $presentation.wrappedValue.dismiss()
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(presentation: presentation, data: $data, callback: callback)
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setSubject(data.subject)
        vc.setToRecipients(data.recipients)
        vc.setMessageBody(data.message, isHTML: false)
        vc.accessibilityElementDidLoseFocus()
        return vc
    }

    public func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
    }
    
    public static var canSendMail: Bool {
        MFMailComposeViewController.canSendMail()
    }
}

public struct ComposeMailData {
    public let subject: String
    public let recipients: [String]?
    public let message: String
    
    public init(subject: String,
                recipients: [String]?,
                message: String) {
        self.subject = subject
        self.recipients = recipients
        self.message = message
    }
    
    public static let empty = ComposeMailData(subject: "", recipients: nil, message: "")
}
