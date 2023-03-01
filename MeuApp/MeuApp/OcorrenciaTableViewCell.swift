//
//  OcorrenciaTableViewCell.swift
//  MeuApp
//
//  Created by Erica Veiga on 21/02/23.
//

import UIKit

class OcorrenciaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewOcorr: UIImage!
    @IBOutlet weak var LabelNome: UILabel!
    @IBOutlet weak var LabelData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureWith(_ ocorrencia: Ocorrencia){
        textLabel?.text = ocorrencia.nome
        detailTextLabel?.text = ocorrencia.data
        //if let image = ocorrencia.image {
        //imageViewPoste = UiImage(data? ocorrencia.image)
        //}
        
    }

}
