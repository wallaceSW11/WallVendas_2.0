object TelaCadastroDespesas: TTelaCadastroDespesas
  Left = 0
  Top = 0
  Caption = 'Despesas'
  ClientHeight = 461
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object lblDescricao: TLabel
    Left = 10
    Top = 10
    Width = 57
    Height = 17
    Caption = 'Descri'#231#227'o'
  end
  object lblValor: TLabel
    Left = 565
    Top = 10
    Width = 30
    Height = 17
    Caption = 'Valor'
  end
  object lblTotal: TLabel
    Left = 649
    Top = 405
    Width = 28
    Height = 17
    Caption = 'Total'
  end
  object edtDescricao: TEdit
    Left = 10
    Top = 33
    Width = 547
    Height = 25
    TabOrder = 0
  end
  object edtValor: TEditCurrency
    Left = 565
    Top = 33
    Width = 121
    Height = 25
    Alignment = taRightJustify
    TabOrder = 1
    Text = '0,00'
  end
  object btnAdicionar: TButton
    Left = 695
    Top = 33
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 10
    Top = 64
    Width = 760
    Height = 335
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object edtTotal: TEditCurrency
    Left = 649
    Top = 428
    Width = 121
    Height = 25
    TabStop = False
    Alignment = taRightJustify
    Enabled = False
    TabOrder = 4
    Text = '0,00'
  end
end
