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
        
        //Recuperando dados
        //Criar uma requisição
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        
        
        do {
            let usuarios = try context.fetch(requisicao)
            
            if usuarios.count > 0{
                
                for usuario in usuarios as! [NSManagedObject]{
                    if let nomeUsuario = usuario.value(forKey: "nome"){
                        print(nomeUsuario)
                    }
                    let idadeUsuario = usuario.value(forKey: "idade")
                    let loginUsuario = usuario.value(forKey: "login")
                    let senhaUsuario = usuario.value(forKey: "senha")
                    
                }
                
            }else{
                print("Nenhum usuário encontrado!")
            }
            
        } catch {
            print("Erro ao recuperar os usuarios!")
        }
        
        
        
        /*Criar entidade*/
        /*let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
        
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
        }*/
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

