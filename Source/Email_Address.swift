//
//  EmailView.swift
//  Reusable
//
//  Created by Akash Belekar on 27/04/23.
//

import UIKit

//MARK: Protocol EmailAddressDelegate
public protocol EmailAddressDelegate{
    func sendPINBtnAction(email:String)
}


public class Email_Address: UIView{
    
    //MARK: Outlets
    @IBOutlet weak public var imgHeaderLogo:UIImageView!
    @IBOutlet weak public var lblHeaderLogin:UILabel!
    @IBOutlet weak public var viewHeader:UIView!
    @IBOutlet weak public var tfEmail:UITextField!
    @IBOutlet weak public var btnSendPIN:UIButton!
    @IBOutlet weak public var btnReminder:UIButton!
    @IBOutlet weak public var lblEmailAddress:UILabel!
    @IBOutlet weak public var viewContainerEmail:UIView!
    @IBOutlet weak public var viewSpaceHeight:UIView!
    @IBOutlet weak public var viewContainerHeight: NSLayoutConstraint!

    
    
    //MARK: Variables
    let nibName = "Email_Address"
    public var pinViewIns = PINView()
    public var delegate:EmailAddressDelegate?
    public var emailConfig = AuthenticationConfiguration()
    lazy var  myUtility = Utility()
    public weak var controller: UIViewController?
    
    
    //MARK: System methods
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        commonInit()
    }
    
    
    //MARK: Custom methods
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        tfEmail.delegate = self
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView?
    {
        let bundel = Bundle(for: Email_Address.self)
        let nib = bundel.loadNibNamed(nibName, owner: self)?.first as? UIView
        return nib
    }
    
    
    //MARK: lables
    public func setThemsForHeaderLable(lbl:UILabel, config:TALable)
    {
        lbl.text = config.TAText
        lbl.textColor = config.TATextColor
        lbl.font = config.TATextFont
        lbl.numberOfLines = config.TATextNumberOfLines
        lbl.textAlignment = config.TATextAlignment
    }
    
    //MARK: Validate Button
    public func setThemsForButton(btn:UIButton, config:TAButton)
    {
        btn.setTitle(config.TABtnTitleText, for: .normal)
        btn.setTitleColor(config.TABtnTitleTextColor, for: .normal)
        btn.titleLabel?.font = config.TABtnTitleTextFont
        btn.backgroundColor = config.TABtnBackgrounColor
        btn.layer.cornerRadius = CGFloat(config.TABtnCornerRadius)
        btn.layer.masksToBounds = config.TABtnMasksToBounds
    }
    
    //MARK: TextField
    public func setThemsForTextField(textfiled: UITextField, config:TATextFiled)
    {
        textfiled.placeholder = config.TATextfiledPlaceHolderText
        textfiled.textColor = config.TATextfiledPlaceHolderTextColor
        textfiled.font = config.TATextfiledPlaceHolderTextFont
        textfiled.layer.borderColor = config.TATextfiledPlaceHolderBorderColor.cgColor
        textfiled.layer.borderWidth = CGFloat(config.TATextfiledPlaceHolderBorderWidth)
        textfiled.layer.cornerRadius = CGFloat(config.TATextfiledPlaceHolderCornerRadius)
    }
    
    
    //MARK: HeaderView
    public func setThemsForHeaderView(view:UIView, config: TAUIView)
    {
        view.backgroundColor = config.TAviewBackgroundColor
    }
 
    //MARK: ContainerView
    public func setThemsContainerView(view:UIView, config: TAUIView)
    {
        view.layer.shadowColor = config.TAviewShadowColor.cgColor
        view.layer.shadowOpacity = Float(config.TAviewShadowOpacity)
        view.layer.shadowOffset = config.TAviewShadowOffset
        view.layer.shadowRadius = CGFloat(config.TAViewCornerRadius)
        view.layer.cornerRadius = CGFloat(config.TAViewCornerRadius)
        self.viewContainerHeight.constant = CGFloat(config.TAViewHeight)
        
    }
    
    //MARK: HeaderView Logo
    public func setThemsForHeaderViewImageORLogo(img: UIImageView, config: TAImage)
    {
        img.image = config.TAImageLogo
    }
    
    //MARK: SetDefaultThems
    public func setEmailDefaultThemes()
    {
        let configObj = themsConfiguration()
        self.setThemeWithEmailConfiguration(config: configObj)
    }
    
    //MARK: Configure DefaultThems
    func themsConfiguration() -> AuthenticationConfiguration
    {
        let config = AuthenticationConfiguration()
        let lblHeader = TALable()
        let lblFirst = TALable()
        let tfFirst = TATextFiled()
        let viewHeader = TAUIView()
        let btnValide = TAButton()
        let imgLogo = TAImage()
        let containerView = TAUIView()
        
        //MARK: HeaderView Txt
        lblHeader.TAText = "Log in"
        lblHeader.TATextColor = .textLblColor
        lblHeader.TATextAlignment = .left
        lblHeader.TATextFont = .boldSystemFont(ofSize: 20)
        
        //MARK: Txt
        lblFirst.TAText = "Email Addresss"
        lblFirst.TATextColor = .textLblColor
        lblFirst.TATextAlignment = .left
        lblFirst.TATextFont = .boldSystemFont(ofSize: 14)
        
        //MARK:  Textfiled
        tfFirst.TATextfiledPlaceHolderText = "Enter Email"
        tfFirst.TATextfiledPlaceHolderTextColor = .black
        tfFirst.TATextfiledPlaceHolderBorderColor = .textfiledBoarderColor
        tfFirst.TATextfiledPlaceHolderBorderWidth = 0.5
        tfFirst.TATextfiledPlaceHolderCornerRadius = 5
        tfFirst.TATextfiledPlaceHolderTextFont = .systemFont(ofSize: 12)
        
        //MARK: HeaderView
        viewHeader.TAviewBackgroundColor = .headerBackgroundColor
        
        //MARK: ContainerView
        containerView.TAViewCornerRadius = 5
        containerView.TAviewShadowColor = .gray
        containerView.TAviewShadowOpacity = 0.4
        containerView.TAviewShadowOffset = CGSize(width: 2.0, height: 2.0)
        containerView.TAviewShadowRadius = 6
        containerView.TAViewHeight = 350
        
        //MARK: valide Btn
        btnValide.TABtnTitleText = "Send PIN"
        btnValide.TABtnTitleTextColor = .btnTitleColor
        btnValide.TABtnBackgrounColor = .btnBackgroundColor
        btnValide.TABtnTitleTextFont = .boldSystemFont(ofSize: 18)
        btnValide.TABtnCornerRadius = 8
        btnValide.TABtnMasksToBounds =  true
        
        //MARK: Header Img Logo
        imgLogo.TAImageLogo = UIImage(named: "\("logo2")")!
        
        //MARK: Assign Values
        config.headerLbl = lblHeader
        config.firstLbl = lblFirst
        config.headerView = viewHeader
        config.logoImage = imgLogo
        config.firstTextfiled = tfFirst
        config.valideBtn = btnValide
        config.logoImage = imgLogo
        config.containerViewShow = containerView
       
        
        return config
    }
    
    //MARK: Set Configurations
    public func setThemeWithEmailConfiguration(config:AuthenticationConfiguration){
        
        self.setThemsForHeaderView(view: viewHeader, config: config.headerView)
        
        self.setThemsForHeaderLable(lbl: lblHeaderLogin, config: config.headerLbl)
        
        self.setThemsForTextField(textfiled: tfEmail, config: config.firstTextfiled)
        
        self.setThemsForButton(btn: btnSendPIN, config: config.valideBtn)
        
        self.setThemsForHeaderLable(lbl: lblEmailAddress, config: config.firstLbl)
        
        self.setThemsForHeaderViewImageORLogo(img: imgHeaderLogo, config: config.logoImage)
        
        self.setThemsForHeaderView(view: viewSpaceHeight, config: config.headerView)
        
        self.setThemsContainerView(view: viewContainerEmail, config: config.containerViewShow)
        
        self.setThemsContainerView(view: viewContainerEmail, config: config.containerViewShow)
        
        
    }
    
    //MARK: IBAction
    @IBAction func sendPINClicked(_ sender:UIButton){
        //     emailNavDelegate?.navEmail()
        if myUtility.isValideEmail(email: (tfEmail.text?.trimmingCharacters(in: .whitespaces))!)
        {
            delegate?.sendPINBtnAction(email: (tfEmail.text?.trimmingCharacters(in: .whitespaces))!)
        }
        else
        {
            myUtility.showAlter(title: "EMAIL", msg: "Invalide Email", action: "OK", viewController: self.controller!)
        }
    }
}

//MARK: UITextFieldDelegate
extension Email_Address:UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}




