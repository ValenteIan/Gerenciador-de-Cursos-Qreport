object Form_permissoes: TForm_permissoes
  Left = 348
  Top = 190
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Permiss'#245'es'
  ClientHeight = 234
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 114
    Height = 13
    Caption = 'Fun'#231#245'es do Sistema'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 65
    Height = 13
    Caption = 'Permiss'#245'es'
  end
  object cb_funcoes: TComboBox
    Left = 8
    Top = 24
    Width = 233
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnEnter = cb_funcoesEnter
  end
  object btn_inserir: TBitBtn
    Left = 248
    Top = 24
    Width = 25
    Height = 21
    Caption = '+'
    TabOrder = 1
    OnClick = btn_inserirClick
  end
  object btn_retirar: TBitBtn
    Left = 248
    Top = 192
    Width = 27
    Height = 25
    Caption = '-'
    TabOrder = 2
    OnClick = btn_retirarClick
  end
  object btn_fechar: TBitBtn
    Left = 96
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btn_fecharClick
  end
  object grid_permissoes: TDBGrid
    Left = 8
    Top = 64
    Width = 265
    Height = 120
    DataSource = ds_permissoes
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
  end
  object adoquery_permissoes: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 16
    Top = 200
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 184
    Top = 200
  end
  object ds_permissoes: TDataSource
    DataSet = adoquery_permissoes
    Left = 48
    Top = 200
  end
end
