object Form_menu: TForm_menu
  Left = 509
  Top = 279
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Menu - Gerenciador de Cursos'
  ClientHeight = 298
  ClientWidth = 417
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
  object btn_cadcursos: TBitBtn
    Left = 16
    Top = 16
    Width = 185
    Height = 25
    Caption = 'Cadastro de Cursos'
    TabOrder = 0
    OnClick = btn_cadcursosClick
  end
  object btn_cadinstrutores: TBitBtn
    Left = 216
    Top = 16
    Width = 185
    Height = 25
    Caption = 'Cadastro de Instrutores'
    TabOrder = 1
    OnClick = btn_cadinstrutoresClick
  end
  object btn_cadturmas: TBitBtn
    Left = 16
    Top = 64
    Width = 185
    Height = 25
    Caption = 'Cadastro de Turmas'
    TabOrder = 2
    OnClick = btn_cadturmasClick
  end
  object btn_cadalunos: TBitBtn
    Left = 216
    Top = 64
    Width = 185
    Height = 25
    Caption = 'Cadastro de Alunos'
    TabOrder = 3
    OnClick = btn_cadalunosClick
  end
  object btn_matriculas: TBitBtn
    Left = 16
    Top = 112
    Width = 185
    Height = 25
    Caption = 'Matr'#237'culas'
    TabOrder = 4
    OnClick = btn_matriculasClick
  end
  object btn_aulas: TBitBtn
    Left = 216
    Top = 112
    Width = 185
    Height = 25
    Caption = 'Lan'#231'amento de aulas'
    TabOrder = 5
    OnClick = btn_aulasClick
  end
  object btn_frequencias: TBitBtn
    Left = 16
    Top = 160
    Width = 185
    Height = 25
    Caption = 'Frequ'#234'ncias'
    TabOrder = 6
    OnClick = btn_frequenciasClick
  end
  object btn_paginstrutores: TBitBtn
    Left = 216
    Top = 160
    Width = 185
    Height = 25
    Caption = 'Pagamento de Instrutores'
    TabOrder = 7
    OnClick = btn_paginstrutoresClick
  end
  object btn_relatorios: TBitBtn
    Left = 16
    Top = 208
    Width = 185
    Height = 25
    Caption = 'Relat'#243'rios'
    TabOrder = 8
    OnClick = btn_relatoriosClick
  end
  object btn_controle: TBitBtn
    Left = 216
    Top = 208
    Width = 187
    Height = 25
    Caption = 'Controle'
    TabOrder = 9
    OnClick = btn_controleClick
  end
  object btn_fechar: TBitBtn
    Left = 104
    Top = 256
    Width = 217
    Height = 25
    Caption = '&Close'
    TabOrder = 10
    OnClick = btn_fecharClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 8
    Top = 264
  end
end
