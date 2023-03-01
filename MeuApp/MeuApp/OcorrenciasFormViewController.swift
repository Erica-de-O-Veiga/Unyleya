//
//  OcorrenciasFormViewController.swift
//  MeuApp
//
//  Created by Erica Veiga on 21/02/23.
//

import UIKit

class OcorrenciasFormViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldData: UITextField!
    @IBOutlet weak var imageViewImage: UIImageView!
    @IBOutlet weak var textFieldEndereco: UITextField!
    @IBOutlet weak var buttonAddEdit: UIButton!   
    @IBOutlet weak var textFieldDescricao: UITextView!
    
    
    var ocorrencia: Ocorrencia?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let ocorrencia = ocorrencia {
            title = "Edição"
            textFieldNome.text = ocorrencia.nome
            textFieldData.text = ocorrencia.data
            textFieldDescricao.text = ocorrencia.descricao
            textFieldEndereco.text = ocorrencia.endereco
            buttonAddEdit.setTitle("Editar", for: .normal)
            if let image = ocorrencia.imagem {
                imageViewImage.image = UIImage(data: image)
            }
        }
    }
    
    
    
    @IBAction func selecionaImagem(_ sender: Any) {
        
        let alert = UIAlertController(title: "Camera", message: "De onde voce deseja escolher a imagem?", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Camera", style: .default){ _ in
                self.selectPicture(sourceType: .camera)
            }
            alert.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let libraryAction = UIAlertAction(title: "Biblioteca de fotos", style: .default){ _ in
                self.selectPicture(sourceType: .photoLibrary)
            }
            alert.addAction(libraryAction)
        }
        
        
        let albumAction = UIAlertAction(title: "Album de fotos", style: .default){ _ in
            self.selectPicture(sourceType: .savedPhotosAlbum)
        }
        alert.addAction(albumAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present (alert, animated: true, completion: nil)
    }
    
    
    
    
    func selectPicture(sourceType: UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true,completion: nil)
        
    }
    @IBAction func save(_ sender: Any) {
        if ocorrencia == nil {
            ocorrencia = Ocorrencia(context: context)
        }
        ocorrencia?.nome = textFieldNome.text
        ocorrencia?.endereco = textFieldEndereco.text
        ocorrencia?.descricao = textFieldDescricao.text
        ocorrencia?.imagem = imageViewImage.image?.jpegData(compressionQuality:0.9)
        ocorrencia?.data = textFieldData.text
        
        try? context.save()
        navigationController?.popViewController(animated: true)
    }
    
}

extension OcorrenciasFormViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
        [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageViewImage.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
