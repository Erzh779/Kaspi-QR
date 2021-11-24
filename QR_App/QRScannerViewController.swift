//
//  QRScannerViewController.swift
//  QR_App
//
//  Created by Erzhan Taipov on 22.11.2021.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit
import AVFoundation



class QRScannerViewController : UIViewController {
    
    
    
    var captureSession = AVCaptureSession()
    var videoPreviewLayer : AVCaptureVideoPreviewLayer?
    var qrCodeFrameView : UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        //Get the back-facing camera for capturing videos
        
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            
            print("FAIL")
            return
        }
        
        do {
            //Get instance of the AVCaptureDeviceInput class using the previous device object
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            //Set the input device on the capture session
            captureSession.addInput(input)
            
            //Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            //Set delegate and use the default dispatch queue to execute the call back
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            //Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            //Start Video capture
            captureSession.startRunning()
            
            //Initialize QR code frame to highlight the QR code
            
            qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.yellow.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                
            }
            
            
        } catch {
            
            //If any error occurs simply print it out and don't continue
            print("Error")
            return
            
        }
        
    }
    
    func setUpViews() {
        
        
    }
    
    
}

extension QRScannerViewController : AVCaptureMetadataOutputObjectsDelegate {
    
}
