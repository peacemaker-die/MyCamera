//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by 川岸孝輔 on 2023/02/20.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    // UIImagePickerController（写真撮影）が表示されているかを管理
    @Binding var isShowSheet: Bool
    // 撮影した写真を格納する変数
    @Binding var captureImage: UIImage?
    
    // Coordinatorでコントローラのdelegateを管理
    class Coordinator: NSObject,
                        UINavigationControllerDelegate,
                       UIImagePickerControllerDelegate{
        // ImagePickerView型の定数を用意
        let parent: ImagePickerView
        
        //イニシャライザ
        init(_ parent: ImagePickerView){
            self.parent = parent
        }
        
        //撮影が終わった時に呼ばれるdelegateメソッド,必ず必要
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info:
            [UIImagePickerController.InfoKey: Any]){
                
                //撮影した写真をcaptureImageに保存
                if let originalImage =
                    info[UIImagePickerController.InfoKey.originalImage]
                    as? UIImage{
                    parent.captureImage = originalImage
                }
                
                //sheetを閉じる
                parent.isShowSheet = false
            }
        
        //キャンセルボタンが選択された時に呼ばれる
        // delegateメソッド、必ず必要
        func imagePickerControllerDidCancel(
            _ picker: UIImagePickerController){
                // sheetを閉じる
                parent.isShowSheet = false
            }
    }
}
