//
//  ViewController.swift
//  Core Data
//
//  Created by Rodrigo Abreu on 08/11/17.
//  Copyright © 2017 Rodrigo Abreu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        /*Criar entidade*/
        let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
        
        /*Configurar Objeto*/
        usuario.setValue("Tatiana Abreu", forKey: "nome")
        usuario.setValue(34, forKey: "idade")
        usuario.setValue("tatiana.abreu", forKey: "login")
        usuario.setValue("1234", forKey: "senha")
        
        //Salvar (persistir) os dados
        do {
            try context.save()
            print("Dados salvos corretamente!")
        } catch  {
            print("Erro ao salvar os dados")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

