object Form_rel_aulas: TForm_rel_aulas
  Left = 422
  Top = 281
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Aulas por Instrutor'
  ClientHeight = 123
  ClientWidth = 296
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
    Left = 24
    Top = 24
    Width = 50
    Height = 13
    Caption = 'Instrutor'
  end
  object edt_instrutor: TEdit
    Left = 24
    Top = 40
    Width = 225
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object btn_ok: TBitBtn
    Left = 104
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btn_okClick
  end
  object btn_fechar: TBitBtn
    Left = 200
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = btn_fecharClick
  end
  object btn_instrutor: TBitBtn
    Left = 256
    Top = 40
    Width = 25
    Height = 21
    Caption = '+'
    TabOrder = 3
    OnClick = btn_instrutorClick
  end
  object btn_todos: TBitBtn
    Left = 8
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Todos'
    TabOrder = 4
    OnClick = btn_todosClick
  end
  object adoquery_rel_aulas: TADOQuery
    Connection = Form_logon.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    Left = 88
    Top = 8
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 120
    Top = 8
  end
  object rel_aulas: TRvProject
    Left = 176
    Top = 8
  end
  object ds_rel_aulas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = adoquery_rel_aulas
    Left = 232
    Top = 8
  end
end
