object Form_pesquisa: TForm_pesquisa
  Left = 525
  Top = 314
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisa'
  ClientHeight = 307
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 186
    Height = 13
    Caption = 'Digite o nome ou parte do nome'
  end
  object edt_nome: TEdit
    Left = 24
    Top = 24
    Width = 249
    Height = 21
    TabOrder = 0
  end
  object grid_pesquisa: TDBGrid
    Left = 24
    Top = 64
    Width = 425
    Height = 185
    DataSource = ds_pesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
  end
  object btn_pesquisar: TBitBtn
    Left = 280
    Top = 24
    Width = 75
    Height = 21
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btn_pesquisarClick
  end
  object btn_limpar: TBitBtn
    Left = 360
    Top = 24
    Width = 89
    Height = 21
    Caption = 'Limpar'
    TabOrder = 3
    OnClick = btn_limparClick
  end
  object btn_selecionar: TBitBtn
    Left = 152
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 4
    OnClick = btn_selecionarClick
  end
  object btn_cancelar: TBitBtn
    Left = 248
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btn_cancelarClick
  end
  object adoquery_pesquisa: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 40
    Top = 264
  end
  object ds_pesquisa: TDataSource
    DataSet = adoquery_pesquisa
    Left = 80
    Top = 264
  end
end
