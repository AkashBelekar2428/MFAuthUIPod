//
//  AuthView.swift
//  Reusable
//
//  Created by Akash Belekar on 26/04/23.
//

import UIKit

//MARK: Protocol AuthenticationLogInDelegate
public protocol AuthenticationLogInDelegate
{
    func sendPinBtnAction(email: String, password: String)
}

public class AuthenticationLogIn: UIView
{
    
    //MARK: @IBOutlets
    @IBOutlet weak public var imgHeaderLogo:UIImageView!
    @IBOutlet weak public var lblHeaderLogin:UILabel!
    @IBOutlet weak public var viewHeader:UIView!
    @IBOutlet weak public var lblAuthType:UILabel!
    @IBOutlet weak public var tfEmail:UITextField!
    @IBOutlet weak public var tfPassword:UITextField!
    @IBOutlet weak public var btnValidate:UIButton!
    @IBOutlet weak public var btnEye:UIButton!
    @IBOutlet weak public var viewContainerAuth:UIView!
    @IBOutlet weak public var btnForgotPassword:UIButton!
    @IBOutlet weak public var btnReminder:UIButton!
    @IBOutlet weak public var lblPassword:UILabel!
    @IBOutlet weak public var viewSpaceHeight:UIView!
    @IBOutlet weak public var viewContainerHeight: NSLayoutConstraint!
    
    @IBOutlet weak public var viewPasswordTf:UIView!
    
    
    //MARK: Variables
    let nibName = "AuthenticationLogIn"
    public var delegate:AuthenticationLogInDelegate?
    public var authConfig = AuthenticationConfiguration()
    var myUtility = Utility()
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
    func commonInit()
    {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        
        tfEmail.delegate = self
        tfPassword.delegate = self
        
        self.addSubview(view)
        
        self.viewContainerAuth.isHidden = true
    }
    
    func loadViewFromNib() -> UIView?
    {
        let bundel = Bundle(for: AuthenticationLogIn.self)
        let nib = bundel.loadNibNamed(nibName, owner: self)?.first as? UIView
        
        return nib
    }
    
    
    //MARK: lables
    public func setThemsForLable(lbl:UILabel, config:TALable)
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
    
    
    //MARK: ResendPIN Button
    public func setThemsForResentPINButton(btn:UIButton, config: TAButton)
    {
        btn.setTitle(config.TABtnTitleText, for: .normal)
        btn.setTitleColor(config.TABtnTitleTextColor, for: .normal)
        btn.titleLabel?.font = config.TABtnTitleTextFont
        btn.backgroundColor = config.TABtnBackgrounColor
    }
    
    
    //MARK: TextField
    public func setThemsForTextField(textfiled: UITextField, config:TATextFiled)
    {
        textfiled.placeholder  = config.TATextfiledPlaceHolderText
        textfiled.textColor   = config.TATextfiledPlaceHolderTextColor
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
    //MARK: tfPasswordView
    public func setTfViewBorderColors(view:UIView, config:TAUIView)
    {
        view.layer.borderColor = config.TAViewTfBorderColor.cgColor
        view.layer.cornerRadius = CGFloat(config.TAViewCornerRadius)
        view.layer.borderWidth = CGFloat(config.TAviewCornerWidth)
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
    public func setDefaultThems()
    {
        let config = self.themsConfiguration()
        setThemWithAuthConfiguration(config: config)
    }
    
    
    //MARK: Configure DefaultThems
    func themsConfiguration() -> AuthenticationConfiguration
    {
        let authConfigObj = AuthenticationConfiguration()
        let lblHeader = TALable()
        let lblFirst = TALable()
        let lblSecond = TALable()
        let tfFirst = TATextFiled()
        let tfSecond = TATextFiled()
        let viewHeader = TAUIView()
        let btnValide = TAButton()
        let btnResendPIN = TAButton()
        let headerImgLogo = TAImage()
        let containerView = TAUIView()
        let tfBoaderView = TAUIView()
        
        
        //MARK: HeaderView Txt
        lblHeader.TAText = "Log in"
        lblHeader.TATextColor = .textLblColor
        lblHeader.TATextAlignment = .left
        lblHeader.TATextFont = .boldSystemFont(ofSize: 20)
        
        //MARK: Email/Username Txt
        lblFirst.TAText = "Email Address"
        lblFirst.TATextColor = .textLblColor
        lblFirst.TATextAlignment = .left
        lblFirst.TATextFont = .systemFont(ofSize: 16)
        
        //MARK: Password Txt
        lblSecond.TAText = "Password"
        lblSecond.TATextColor = .textLblColor
        lblSecond.TATextAlignment = .left
        lblSecond.TATextFont = .systemFont(ofSize: 16)
        
        //MARK: Email Textfiled
        tfFirst.TATextfiledPlaceHolderText = "Enter Email"
        tfFirst.TATextfiledPlaceHolderTextColor = .black
        tfFirst.TATextfiledPlaceHolderBorderColor = .textfiledBoarderColor
        tfFirst.TATextfiledPlaceHolderBorderWidth = 0.5
        tfFirst.TATextfiledPlaceHolderCornerRadius = 5
        tfFirst.TATextfiledPlaceHolderTextFont = .systemFont(ofSize: 16)
        
        //MARK: Password Textfiled
        tfSecond.TATextfiledPlaceHolderText = "Enter Password"
        tfSecond.TATextfiledPlaceHolderTextColor = .black
        tfSecond.TATextfiledPlaceHolderBorderColor = .textfiledBoarderColor
        tfSecond.TATextfiledPlaceHolderCornerRadius = 5
        tfSecond.TATextfiledPlaceHolderTextFont = .systemFont(ofSize: 16)
        
        //MARK: HeaderView
        viewHeader.TAviewBackgroundColor = .headerBackgroundColor
        
        //MARK: tfBoaderColor
        tfBoaderView.TAViewTfBorderColor = .textfiledBoarderColor
        tfBoaderView.TAViewCornerRadius = 5
        tfBoaderView.TAviewCornerWidth = 1
        
        
        //MARK: ContainerView
        containerView.TAViewCornerRadius = 5
        containerView.TAviewShadowColor = .gray
        containerView.TAviewShadowOpacity = 0.4
        containerView.TAviewShadowOffset = CGSize(width: 2.0, height: 2.0)
        containerView.TAviewShadowRadius = 6
        containerView.TAViewHeight = 330
        
        
        //MARK: valide Btn
        btnValide.TABtnTitleText = "Validate"
        btnValide.TABtnTitleTextColor = .btnTitleColor
        btnValide.TABtnBackgrounColor = .btnBackgroundColor
        btnValide.TABtnTitleTextFont = .boldSystemFont(ofSize: 16)
        btnValide.TABtnCornerRadius = 5
        btnValide.TABtnMasksToBounds = true
        
        //MARK: ResendPIN btn
        btnResendPIN.TABtnTitleText = "Forgot Password?"
        btnResendPIN.TABtnTitleTextColor = .textLblColor
        btnResendPIN.TABtnBackgrounColor = .white
        btnResendPIN.TABtnTitleTextFont = .boldSystemFont(ofSize: 12)
        
        //MARK: header Logo
        headerImgLogo.TAImageLogo = UIImage(named: "\("logo2")")!
        
        authConfigObj.headerLbl = lblHeader
        authConfigObj.firstLbl = lblFirst
        authConfigObj.secondLbl = lblSecond
        authConfigObj.firstTextfiled = tfFirst
        authConfigObj.secondTextfiled = tfSecond
        authConfigObj.headerView = viewHeader
        authConfigObj.valideBtn = btnValide
        authConfigObj.resendPINBtn = btnResendPIN
        authConfigObj.logoImage = headerImgLogo
        authConfigObj.containerViewShow = containerView
        authConfigObj.tfView = tfBoaderView
        
        return authConfigObj
    }
    
    
    //MARK: Set Configurations
    public func setThemWithAuthConfiguration(config:AuthenticationConfiguration)
    {
        self.setThemsForHeaderView(view: viewHeader, config: config.headerView)
        
        self.setThemsForLable(lbl: lblHeaderLogin, config: config.headerLbl)
        
        self.setThemsForLable(lbl:lblAuthType, config: config.firstLbl)
        
        self.setThemsForLable(lbl: lblPassword, config: config.secondLbl)
        
        self.setThemsForTextField(textfiled: tfEmail, config: config.firstTextfiled)
        
        self.setThemsForTextField(textfiled: tfPassword, config: config.secondTextfiled)
        
        self.setThemsForHeaderViewImageORLogo(img: imgHeaderLogo, config: config.logoImage)
        
        self.setThemsForButton(btn: btnValidate, config: config.valideBtn)
        
        self.setThemsForResentPINButton(btn: btnForgotPassword, config: config.resendPINBtn)
        
        self.setThemsForHeaderView(view: viewSpaceHeight, config: config.headerView)
        
        self.setThemsContainerView(view: viewContainerAuth, config: config.containerViewShow)
        
        self.setTfViewBorderColors(view: viewPasswordTf, config: config.tfView)
        
       
        
        self.viewContainerAuth.isHidden = false
    }
    
    //MARK: IBAction
    @IBAction func validateBtnAction(_ sender:UIButton)
    {
        if myUtility.isValideEmail(email: (tfEmail.text?.trimmingCharacters(in: .whitespaces))!)
        {
            if myUtility.isPasswordValide(password: (tfPassword.text?.trimmingCharacters(in: .whitespaces))!)
            {
                delegate?.sendPinBtnAction(email: (tfEmail.text?.trimmingCharacters(in: .whitespaces))!, password: (tfPassword.text?.trimmingCharacters(in: .whitespaces))!)
            }
            else
            {
                myUtility.showAlter(title: "PASSWORD", msg: "Invalide Password", action: "OK", viewController: self.controller!)
            }
        }
        else
        {
            myUtility.showAlter(title: "EMAIL", msg: "Invalide Email", action: "OK", viewController: self.controller!)
        }
    }
    
    @IBAction func eyeBtnAction()
    {
        tfPassword.isSecureTextEntry = !tfPassword.isSecureTextEntry
        //        let btneyeImg = tfPassword.isSecureTextEntry ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye")
        //        btnEye.setImage(btneyeImg, for: .normal)
    }
    @IBAction func reminderBtnAction()
    {
        
    }
    @IBAction func resendBtnAction()
    {
        
    }
}

//MARK: UITextFieldDelegate
extension AuthenticationLogIn:UITextFieldDelegate
{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}


