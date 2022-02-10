object TelaCalcularPrecoMetroQuadrado: TTelaCalcularPrecoMetroQuadrado
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Calcular o pre'#231'o do metro quadrado'
  ClientHeight = 169
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 17
  object lblAltura: TLabel
    Left = 10
    Top = 10
    Width = 63
    Height = 17
    Caption = 'Altura (cm)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblLargura: TLabel
    Left = 113
    Top = 10
    Width = 74
    Height = 17
    Caption = 'Largura (cm)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblPrecoCompra: TLabel
    Left = 217
    Top = 10
    Width = 33
    Height = 17
    Caption = 'Pre'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblPrecoMetroQuadrado: TLabel
    Left = 83
    Top = 64
    Width = 165
    Height = 20
    Caption = 'Pre'#231'o Metro Quadrado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblValorMetroQuadrado: TLabel
    Left = 112
    Top = 91
    Width = 79
    Height = 24
    Caption = 'R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TSpeedButton
    Left = 57
    Top = 128
    Width = 105
    Height = 30
    Caption = 'OK'
    OnClick = btnOKClick
  end
  object btnCancelar: TSpeedButton
    Left = 168
    Top = 128
    Width = 105
    Height = 30
    Caption = 'Cancelar'
    OnClick = btnCancelarClick
  end
  object edtAltura: TEditNumber
    Left = 10
    Top = 32
    Width = 90
    Height = 25
    Alignment = taRightJustify
    TabOrder = 0
    Text = '0'
    OnChange = CalcularPreco
    AceitaVirgula = True
  end
  object edtLargura: TEditNumber
    Left = 113
    Top = 32
    Width = 90
    Height = 25
    Alignment = taRightJustify
    TabOrder = 1
    Text = '0'
    OnChange = CalcularPreco
    AceitaVirgula = True
  end
  object edtPreco: TEditCurrency
    Left = 217
    Top = 33
    Width = 90
    Height = 25
    Alignment = taRightJustify
    TabOrder = 2
    Text = '0,00'
    OnChange = CalcularPreco
    ExibirCifrao = False
  end
end
