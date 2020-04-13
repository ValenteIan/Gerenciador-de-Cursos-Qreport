object Form_logon: TForm_logon
  Left = 561
  Top = 338
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Logon'
  ClientHeight = 165
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 64
    Width = 36
    Height = 13
    Caption = 'Senha'
  end
  object Label2: TLabel
    Left = 32
    Top = 16
    Width = 43
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object edt_usuario: TEdit
    Left = 32
    Top = 32
    Width = 121
    Height = 21
    MaxLength = 30
    TabOrder = 0
  end
  object edt_senha: TEdit
    Left = 32
    Top = 80
    Width = 121
    Height = 21
    MaxLength = 10
    PasswordChar = '*'
    TabOrder = 1
  end
  object btn_ok: TBitBtn
    Left = 16
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = btn_okClick
    Kind = bkOK
  end
  object btn_fechar: TBitBtn
    Left = 96
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btn_fecharClick
    Kind = bkCancel
  end
  object ConexaoBD: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 160
  end
  object adoquery_aux: TADOQuery
    Connection = ConexaoBD
    Parameters = <>
    Left = 160
    Top = 32
  end
end
