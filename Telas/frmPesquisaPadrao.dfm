object TelaPesquisaPadrao: TTelaPesquisaPadrao
  Left = 0
  Top = 0
  Caption = 'TelaPesquisaPadrao'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object lblCampo: TLabel
    Left = 10
    Top = 10
    Width = 42
    Height = 17
    Caption = 'Campo'
  end
  object btnPesquisar: TSpeedButton
    Left = 655
    Top = 32
    Width = 121
    Height = 25
    Caption = 'Pesquisar'
  end
  object btnOk: TSpeedButton
    Left = 610
    Top = 531
    Width = 80
    Height = 22
    Caption = 'OK'
  end
  object btnCancelar: TSpeedButton
    Left = 696
    Top = 531
    Width = 80
    Height = 22
    Caption = 'Cancelar'
  end
  object edtTrecho: TEdit
    Left = 161
    Top = 32
    Width = 488
    Height = 25
    TabOrder = 1
  end
  object cbCampo: TComboBox
    Left = 10
    Top = 32
    Width = 145
    Height = 25
    Style = csDropDownList
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 10
    Top = 63
    Width = 766
    Height = 462
    DataSource = dsPesquisa
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object dsPesquisa: TDataSource
    Left = 384
    Top = 288
  end
end
