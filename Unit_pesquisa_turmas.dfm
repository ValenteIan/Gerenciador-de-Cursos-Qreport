object Form_pesquisa_turmas: TForm_pesquisa_turmas
  Left = 192
  Top = 157
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisa Turma'
  ClientHeight = 509
  ClientWidth = 1036
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Left = 16
    Top = 8
    Width = 113
    Height = 13
    Caption = 'Campo da pesquisa'
  end
  object Label2: TLabel
    Left = 176
    Top = 8
    Width = 132
    Height = 13
    Caption = 'Texto a ser pesquisado'
  end
  object cb_campo: TComboBox
    Left = 16
    Top = 24
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'C'#243'digo Turma'
      'Nome Curso'
      'Nome Instrutor')
  end
  object edt_texto: TEdit
    Left = 176
    Top = 24
    Width = 177
    Height = 21
    TabOrder = 1
  end
  object grid_pesquisa_turma: TDBGrid
    Left = 16
    Top = 64
    Width = 497
    Height = 177
    DataSource = ds_pesquisa_turma
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
  end
  object btn_pesquisar: TBitBtn
    Left = 360
    Top = 24
    Width = 75
    Height = 21
    Caption = 'Pesquisar'
    TabOrder = 3
    OnClick = btn_pesquisarClick
  end
  object btn_limpar: TBitBtn
    Left = 440
    Top = 24
    Width = 75
    Height = 21
    Caption = 'Limpar'
    TabOrder = 4
    OnClick = btn_limparClick
  end
  object btn_selecionar: TBitBtn
    Left = 144
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 5
    OnClick = btn_selecionarClick
  end
  object btn_cancelar: TBitBtn
    Left = 232
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = btn_cancelarClick
  end
  object adoquery_pesquisa_turma: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 56
    Top = 256
  end
  object ds_pesquisa_turma: TDataSource
    DataSet = adoquery_pesquisa_turma
    Left = 96
    Top = 256
  end
end
