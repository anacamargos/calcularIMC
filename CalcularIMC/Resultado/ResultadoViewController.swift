//
//  ResultadoViewController.swift
//  CalcularIMC
//
//  Created by Ana Leticia Camargos on 05/03/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var labelResultadoIMC: UILabel!
    @IBOutlet weak var labelIdade: UILabel!
    @IBOutlet weak var labelNomeCompleto: UILabel!
    
    // MARK: - Variaveis
    var nomeCompleto: String?
    var resultadoIMC: Float?
    var idade: Float?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sValorImc = NSString(format: "%.2f", resultadoIMC!);
        let sIdade = NSString(format: "%.0f", idade!);
        
        labelNomeCompleto.text = nomeCompleto
        labelIdade.text = "\(sIdade) anos"
        labelResultadoIMC.text = "\(sValorImc)"
        
        
    }
    

}
