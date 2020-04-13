object Form_rel_alunos: TForm_rel_alunos
  Left = 573
  Top = 346
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rela'#231#227'o de Alunos por Turma'
  ClientHeight = 123
  ClientWidth = 290
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
    Left = 40
    Top = 16
    Width = 36
    Height = 13
    Caption = 'Turma'
  end
  object edt_turma: TEdit
    Left = 40
    Top = 32
    Width = 201
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object btn_ok: TBitBtn
    Left = 56
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btn_okClick
  end
  object btn_fechar: TBitBtn
    Left = 144
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = btn_fecharClick
  end
  object btn_turma: TBitBtn
    Left = 248
    Top = 32
    Width = 33
    Height = 21
    Caption = '+'
    TabOrder = 3
    OnClick = btn_turmaClick
  end
  object adoquery_rel_alunos: TADOQuery
    Connection = Form_logon.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    Left = 16
    Top = 72
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 232
    Top = 72
  end
  object rel_alunos: TRvProject
    Left = 8
    Top = 32
  end
  object ds_rel_alunos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = adoquery_rel_alunos
    Left = 160
  end
end
