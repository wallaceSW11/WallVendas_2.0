object TelaCadastroVendaProduto: TTelaCadastroVendaProduto
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Produto'
  ClientHeight = 180
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 17
  object lblIdProduto: TLabel
    Left = 15
    Top = 12
    Width = 39
    Height = 16
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblDescricaoProduto: TLabel
    Left = 98
    Top = 12
    Width = 55
    Height = 16
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnLocalizarProduto: TSpeedButton
    Left = 70
    Top = 34
    Width = 23
    Height = 22
    Caption = 'F2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnLocalizarProdutoClick
  end
  object lblPrecoVenda: TLabel
    Left = 128
    Top = 68
    Width = 63
    Height = 16
    Caption = 'Vl. Unit'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblQuantidade: TLabel
    Left = 14
    Top = 68
    Width = 65
    Height = 16
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblDesconto: TLabel
    Left = 241
    Top = 68
    Width = 71
    Height = 16
    Caption = 'Vl. Desconto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblAcrescimo: TLabel
    Left = 355
    Top = 68
    Width = 78
    Height = 16
    Caption = 'Vl. Acr'#233'scimo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTotalItem: TLabel
    Left = 468
    Top = 68
    Width = 77
    Height = 16
    Caption = 'Vl. Total item'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnEditarDescicaoProduto: TSpeedButton
    Left = 545
    Top = 34
    Width = 23
    Height = 22
    Caption = 'E'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnEditarDescicaoProdutoClick
  end
  object lblSalario: TLabel
    Left = 15
    Top = 125
    Width = 43
    Height = 17
    Caption = 'Sal'#225'rio:'
  end
  object lblVlSalario: TLabel
    Left = 15
    Top = 142
    Width = 43
    Height = 17
    Alignment = taRightJustify
    BiDiMode = bdRightToLeft
    Caption = 'R$ 0,00'
    Color = clGrayText
    ParentBiDiMode = False
    ParentColor = False
  end
  object lblLucro: TLabel
    Left = 87
    Top = 125
    Width = 35
    Height = 17
    Caption = 'Lucro:'
  end
  object lblVlLucro: TLabel
    Left = 87
    Top = 142
    Width = 43
    Height = 17
    Alignment = taRightJustify
    BiDiMode = bdRightToLeft
    Caption = 'R$ 0,00'
    Color = clGrayText
    ParentBiDiMode = False
    ParentColor = False
  end
  object lblTotalInsumo: TLabel
    Left = 153
    Top = 125
    Width = 77
    Height = 17
    Caption = 'Total insumo:'
  end
  object lblVlTotalInsumo: TLabel
    Left = 153
    Top = 142
    Width = 43
    Height = 17
    Alignment = taRightJustify
    BiDiMode = bdRightToLeft
    Caption = 'R$ 0,00'
    Color = clGrayText
    ParentBiDiMode = False
    ParentColor = False
  end
  object lblEstoque: TLabel
    Left = 267
    Top = 125
    Width = 50
    Height = 17
    Caption = 'Estoque:'
    Visible = False
  end
  object lblQtEstoque: TLabel
    Left = 267
    Top = 142
    Width = 7
    Height = 17
    Alignment = taRightJustify
    BiDiMode = bdRightToLeft
    Caption = '0'
    ParentBiDiMode = False
    Visible = False
  end
  object btnEstoque: TSpeedButton
    Left = 316
    Top = 137
    Width = 23
    Height = 22
    Caption = '?'
    Visible = False
  end
  object edtIdProduto: TEdit
    Left = 14
    Top = 34
    Width = 50
    Height = 24
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnExit = edtIdProdutoExit
  end
  object edtDescricaoProduto: TEdit
    Left = 99
    Top = 34
    Width = 439
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 500
    ParentFont = False
    TabOrder = 1
  end
  object edtVlUnitario: TEdit
    Left = 120
    Top = 90
    Width = 100
    Height = 24
    TabStop = False
    Alignment = taRightJustify
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = '0,00'
    OnChange = edtQtItemChange
  end
  object edtQtItem: TEdit
    Left = 14
    Top = 90
    Width = 100
    Height = 24
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = '1'
    OnChange = edtQtItemChange
  end
  object edtVlDesconto: TEdit
    Left = 249
    Top = 90
    Width = 100
    Height = 24
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '0,00'
    OnChange = edtQtItemChange
  end
  object edtVlAcrescimo: TEdit
    Left = 355
    Top = 91
    Width = 100
    Height = 24
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = '0,00'
    OnChange = edtQtItemChange
  end
  object edtVlTotalItem: TEdit
    Left = 468
    Top = 91
    Width = 100
    Height = 24
    Alignment = taRightJustify
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = '0,00'
    OnChange = edtQtItemChange
  end
  object btnOK: TButton
    Left = 405
    Top = 136
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnOKClick
  end
  object btnCancelar: TButton
    Left = 493
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 8
    OnClick = btnCancelarClick
  end
end
