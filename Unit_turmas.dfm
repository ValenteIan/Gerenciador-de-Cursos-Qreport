object Form_turmas: TForm_turmas
  Left = 409
  Top = 251
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Turmas'
  ClientHeight = 272
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 144
    Width = 50
    Height = 13
    Caption = 'Instrutor'
  end
  object Curso: TLabel
    Left = 96
    Top = 88
    Width = 34
    Height = 13
    Caption = 'Curso'
  end
  object Label3: TLabel
    Left = 96
    Top = 40
    Width = 80
    Height = 13
    Caption = 'C'#243'digo Turma'
  end
  object Label4: TLabel
    Left = 240
    Top = 40
    Width = 107
    Height = 13
    Caption = 'Valor de cada Aula'
  end
  object btn_novo: TBitBtn
    Left = 64
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 0
    OnClick = btn_novoClick
  end
  object btn_salvar: TBitBtn
    Left = 136
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btn_salvarClick
  end
  object btn_alterar: TBitBtn
    Left = 208
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btn_alterarClick
  end
  object btn_cancelar: TBitBtn
    Left = 280
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btn_cancelarClick
  end
  object btn_excluir: TBitBtn
    Left = 352
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = btn_excluirClick
  end
  object btn_fechar: TBitBtn
    Left = 424
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = btn_fecharClick
  end
  object edt_instrutor: TEdit
    Left = 96
    Top = 160
    Width = 249
    Height = 21
    MaxLength = 30
    TabOrder = 6
  end
  object edt_curso: TEdit
    Left = 96
    Top = 104
    Width = 249
    Height = 21
    MaxLength = 20
    TabOrder = 7
  end
  object edt_cod: TEdit
    Left = 96
    Top = 56
    Width = 121
    Height = 21
    MaxLength = 9
    TabOrder = 8
  end
  object edt_valor: TEdit
    Left = 240
    Top = 56
    Width = 105
    Height = 21
    MaxLength = 6
    TabOrder = 9
    OnEnter = edt_valorEnter
    OnExit = edt_valorExit
  end
  object btn_curso: TBitBtn
    Left = 360
    Top = 104
    Width = 33
    Height = 21
    Caption = '+'
    TabOrder = 10
    OnClick = btn_cursoClick
  end
  object btn_instrutor: TBitBtn
    Left = 360
    Top = 160
    Width = 33
    Height = 21
    Caption = '+'
    TabOrder = 11
    OnClick = btn_instrutorClick
  end
  object btn_localizar: TBitBtn
    Left = 352
    Top = 56
    Width = 75
    Height = 21
    Caption = 'Localizar'
    TabOrder = 12
    OnClick = btn_localizarClick
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 448
    Top = 56
  end
end
