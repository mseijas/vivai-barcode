//
//  ViewController.swift
//  Vivai
//
//  Created by Matias Seijas on 1/16/19.
//  Copyright © 2019 Vivai. All rights reserved.
//

import UIKit
import BarcodeScanner
import SafariServices

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let controller = BarcodeScannerViewController()
        controller.codeDelegate = self
        controller.errorDelegate = self
        controller.dismissalDelegate = self
        
        present(controller, animated: true, completion: nil)
    }

}

extension ViewController: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print(code)
        controller.reset()
        let url = URL(string: "http://vivai.com.uy/center/aspx/articulo.aspx?art=\(code)")!
        let webController = SFSafariViewController(url: url)
        controller.present(webController, animated: true, completion: nil)
    }
}

extension ViewController: BarcodeScannerErrorDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
        print(error)
    }
}

extension ViewController: BarcodeScannerDismissalDelegate {
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
