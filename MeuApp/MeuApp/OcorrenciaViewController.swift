//
//  OcorrenciaViewController.swift
//  MeuApp
//
//  Created by Erica Veiga on 21/02/23.
//

import UIKit

class OcorrenciaViewController: UIViewController {
 
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelData: UILabel!
   
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var labelEndereco: UILabel!
    @IBOutlet weak var ImageViewOcorrencia: UIImageView!     
    
    
    var ocorrencia :Ocorrencia?
    
    var ocorrencias: [Ocorrencia] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loadOcorrencias()
    }
    
    func loadOcorrencias(){
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareScreen()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ocorrenciaFormViewController = segue.destination as? OcorrenciasFormViewController{
            ocorrenciaFormViewController.ocorrencia = ocorrencia
        }
    }
    
        func prepareScreen(){
            
            if let itemselecionado = ocorrencia {
                labelNome.text = itemselecionado.nome
                labelData.text = itemselecionado.data
                labelEndereco.text = itemselecionado.endereco
                labelDescricao.text = itemselecionado.descricao
                if let image  = itemselecionado.imagem {
                    ImageViewOcorrencia.image = UIImage(data: image)
                }
              }
            }
        }
    

