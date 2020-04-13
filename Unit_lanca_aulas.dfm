object Form_lanca_aulas: TForm_lanca_aulas
  Left = 522
  Top = 409
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento de aulas'
  ClientHeight = 121
  ClientWidth = 305
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
    Top = 16
    Width = 36
    Height = 13
    Caption = 'Turma'
  end
  object Label2: TLabel
    Left = 208
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Data'
  end
  object edt_turma: TEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object dt_aula: TDateTimePicker
    Left = 208
    Top = 32
    Width = 81
    Height = 21
    Date = 43923.000000000000000000
    Format = 'dd/MM/yyyy'
    Time = 43923.000000000000000000
    TabOrder = 1
  end
  object btn_lancar: TBitBtn
    Left = 96
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Lan'#231'ar'
    TabOrder = 2
    OnClick = btn_lancarClick
  end
  object btn_cancelar: TBitBtn
    Left = 192
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btn_cancelarClick
  end
  object btn_turma: TBitBtn
    Left = 144
    Top = 32
    Width = 33
    Height = 21
    Caption = '+'
    TabOrder = 4
    OnClick = btn_turmaClick
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 48
    Top = 72
  end
end
