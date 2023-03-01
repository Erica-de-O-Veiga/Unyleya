//
//  OcorrenciasTableViewController.swift
//  MeuApp
//
//  Created by Erica Veiga on 20/02/23.
//

import UIKit
import CoreData

class OcorrenciasTableViewController: UITableViewController {
    
    var  fetcheResultsController : NSFetchedResultsController<Ocorrencia>!
             
    override func viewDidLoad() {
        super.viewDidLoad()
        loadOcorrencias()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ocorrenciaViewController = segue.destination as? OcorrenciaViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            ocorrenciaViewController.ocorrencia = fetcheResultsController.object(at: indexPath)
         }
    }
    
    func loadOcorrencias(){
        let fetchRequest : NSFetchRequest<Ocorrencia> = Ocorrencia.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key:"nome", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetcheResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
          
        fetcheResultsController.delegate = self
        try? fetcheResultsController.performFetch()
          
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetcheResultsController.fetchedObjects?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "tabela", for: indexPath) as?
        OcorrenciaTableViewCell else {
            return UITableViewCell()
        }
           
          //  let cell = tableView.dequeueReusableCell(withIdentifier: "tabela", for: indexPath)
        let ocorrencia = fetcheResultsController.object(at: indexPath)
             cell.configureWith(ocorrencia)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let ocorrencia = fetcheResultsController.object(at: indexPath)
            context.delete(ocorrencia)
            try? context.save()
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}

extension OcorrenciasTableViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChangeContentWith snapshot: NSDiffableDataSourceSnapshotReference) {
        tableView.reloadData()
    }
}
