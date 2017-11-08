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
        
        
        
        /*
        //Criar entidade
        let produto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)
        
        //configura o objeto
        produto.setValue("iPhone 5", forKey: "descricao")
        produto.setValue("Rosa", forKey: "cor")
        produto.setValue(2, forKey: "preco")
        
        //Salvar os dados
        
        do {
            try context.save()
            print("Sucesso ao salvar dados!")
        } catch  {
            print("Erro ao salvar dados!")
        }
        */
        
        
        
        //Criar Requisição
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        
        //Ordenar de A-Z ou Z-A
        let ordenacaoAZ = NSSortDescriptor(key: "descricao", ascending: true)
        //let ordenacaoZA = NSSortDescriptor(key: "preco", ascending: false)
        
        //aplicar filtros criados à requisição
        //let predicate = NSPredicate(format: "descricao == %@", "iPhone 5")
        let predicate = NSPredicate(format: "descricao contains [c] %@", "iphone")
        
        //aplicar filtros criados à requiscao
        requisicao.sortDescriptors = [ordenacaoAZ]
        requisicao.predicate = predicate
        
        
        
        do {
            let produtos = try context.fetch(requisicao)
            
            if produtos.count > 0{
                
                for produto in produtos as! [NSManagedObject]{
                    
                    if let nomeProduto = produto.value(forKey: "descricao"){
                        if let corProduto = produto.value(forKey: "cor"){
                            if let precoProduto = produto.value(forKey: "preco"){
                                
                                print(String(describing: nomeProduto) + " | " + String(describing: corProduto) + " | " +  String(describing: precoProduto))
                                
                            }
                        }
                    }
                    
                    
                }
                
            }else{
                print("Nenhum usuário encontrado!")
            }
            
        } catch {
            print("Erro ao recuperar os usuarios!")
        }
        
        
        
        
        
        
        
        //Recuperando dados
        //Criar uma requisição
        /*let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        
        
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
        }*/
        
        
        
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

