object Form_pag_instrutores: TForm_pag_instrutores
  Left = 503
  Top = 328
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pagamento de Instrutores'
  ClientHeight = 140
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana,'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 16
    Top = 32
    Width = 40
    Height = 14
    Caption = 'Instrutor'
  end
  object Label2: TLabel
    Left = 208
    Top = 32
    Width = 43
    Height = 14
    Caption = 'M'#234's/Ano'
  end
  object edt_instrutor: TEdit
    Left = 16
    Top = 48
    Width = 121
    Height = 22
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object cb_mes_ano: TComboBox
    Left = 184
    Top = 48
    Width = 145
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    TabOrder = 1
    OnEnter = cb_mes_anoEnter
  end
  object btn_gerar: TBitBtn
    Left = 32
    Top = 96
    Width = 115
    Height = 25
    Caption = 'Gerar demonstrativo'
    TabOrder = 2
    OnClick = btn_gerarClick
  end
  object btn_cancelar: TBitBtn
    Left = 192
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btn_cancelarClick
  end
  object btn_instrutor: TBitBtn
    Left = 144
    Top = 48
    Width = 33
    Height = 21
    Caption = '+'
    TabOrder = 4
    OnClick = btn_instrutorClick
  end
  object adoquery_demonstrativo: TADOQuery
    Connection = Form_logon.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    Left = 120
    Top = 8
    object adoquery_demonstrativoCOD_INSTRUTOR: TAutoIncField
      FieldName = 'COD_INSTRUTOR'
      ReadOnly = True
    end
    object adoquery_demonstrativoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object adoquery_demonstrativoCOD_TURMA: TStringField
      FieldName = 'COD_TURMA'
      Size = 9
    end
    object adoquery_demonstrativoDATA: TDateTimeField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object adoquery_demonstrativoVALOR_AULA: TBCDField
      FieldName = 'VALOR_AULA'
      DisplayFormat = 'R$ ,0.00'
      Precision = 19
    end
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 160
    Top = 8
  end
  object rel_demonstrativo: TRvProject
    Left = 40
  end
  object ds_demonstrativo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = adoquery_demonstrativo
    Left = 208
  end
end
