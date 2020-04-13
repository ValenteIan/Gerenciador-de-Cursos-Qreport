object Form_alunos: TForm_alunos
  Left = 504
  Top = 247
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Alunos'
  ClientHeight = 196
  ClientWidth = 456
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
    Left = 48
    Top = 104
    Width = 33
    Height = 13
    Caption = 'Idade'
  end
  object Label2: TLabel
    Left = 160
    Top = 104
    Width = 48
    Height = 13
    Caption = 'Telefone'
  end
  object Label3: TLabel
    Left = 328
    Top = 104
    Width = 29
    Height = 13
    Caption = 'Sexo'
  end
  object Label4: TLabel
    Left = 48
    Top = 56
    Width = 33
    Height = 13
    Caption = 'Nome'
  end
  object Label5: TLabel
    Left = 48
    Top = 8
    Width = 76
    Height = 13
    Caption = 'C'#243'digo Aluno'
  end
  object btn_novo: TBitBtn
    Left = 8
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 6
    OnClick = btn_novoClick
  end
  object btn_salvar: TBitBtn
    Left = 80
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 7
    OnClick = btn_salvarClick
  end
  object btn_alterar: TBitBtn
    Left = 152
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 8
    OnClick = btn_alterarClick
  end
  object btn_cancelar: TBitBtn
    Left = 224
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 9
    OnClick = btn_cancelarClick
  end
  object btn_excluir: TBitBtn
    Left = 296
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 10
    OnClick = btn_excluirClick
  end
  object btn_fechar: TBitBtn
    Left = 368
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 11
    OnClick = btn_fecharClick
  end
  object edt_idade: TEdit
    Left = 48
    Top = 120
    Width = 73
    Height = 21
    MaxLength = 3
    TabOrder = 3
  end
  object edt_telefone: TEdit
    Left = 160
    Top = 120
    Width = 153
    Height = 21
    Hint = '(85) 99999-9999'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object edt_sexo: TEdit
    Left = 328
    Top = 120
    Width = 49
    Height = 21
    MaxLength = 1
    TabOrder = 5
  end
  object edt_nome: TEdit
    Left = 48
    Top = 72
    Width = 329
    Height = 21
    MaxLength = 30
    TabOrder = 2
  end
  object edt_cod: TEdit
    Left = 48
    Top = 24
    Width = 81
    Height = 21
    MaxLength = 10
    TabOrder = 0
  end
  object btn_localizar: TBitBtn
    Left = 136
    Top = 24
    Width = 65
    Height = 21
    Caption = 'Localizar'
    TabOrder = 1
    OnClick = btn_localizarClick
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 392
    Top = 72
  end
end
