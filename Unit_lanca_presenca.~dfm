object Form_lanca_presenca: TForm_lanca_presenca
  Left = 463
  Top = 202
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento de Presen'#231'a'
  ClientHeight = 301
  ClientWidth = 466
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
    Top = 16
    Width = 36
    Height = 13
    Caption = 'Turma'
  end
  object Label2: TLabel
    Left = 184
    Top = 16
    Width = 74
    Height = 13
    Caption = 'Data da Aula'
  end
  object edt_turma: TEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object cb_aulas: TComboBox
    Left = 184
    Top = 32
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnEnter = cb_aulasEnter
  end
  object btn_listar_alunos: TBitBtn
    Left = 336
    Top = 32
    Width = 75
    Height = 21
    Caption = 'Listar'
    TabOrder = 2
    OnClick = btn_listar_alunosClick
  end
  object btn_confirmar: TBitBtn
    Left = 144
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = btn_confirmarClick
  end
  object btn_fechar: TBitBtn
    Left = 232
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = btn_fecharClick
  end
  object ck_lista_alunos: TCheckListBox
    Left = 24
    Top = 64
    Width = 409
    Height = 185
    ItemHeight = 13
    TabOrder = 5
  end
  object btn_turma: TBitBtn
    Left = 152
    Top = 32
    Width = 25
    Height = 21
    Caption = '+'
    TabOrder = 6
    OnClick = btn_turmaClick
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 72
    Top = 264
  end
end
