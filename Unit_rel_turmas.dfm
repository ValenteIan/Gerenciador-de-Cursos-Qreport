object Form_rel_turmas: TForm_rel_turmas
  Left = 508
  Top = 367
  Width = 332
  Height = 159
  Caption = 'Rela'#231#227'o de Turmas por Curso'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Curso'
  end
  object edt_curso: TEdit
    Left = 16
    Top = 32
    Width = 257
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object btn_ok: TBitBtn
    Left = 112
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btn_okClick
  end
  object btn_fechar: TBitBtn
    Left = 208
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = btn_fecharClick
  end
  object btn_curso: TBitBtn
    Left = 280
    Top = 32
    Width = 25
    Height = 21
    Caption = '+'
    TabOrder = 3
    OnClick = btn_cursoClick
  end
  object btn_todos: TBitBtn
    Left = 16
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Todos'
    TabOrder = 4
    OnClick = btn_todosClick
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 88
  end
end
