object TelaCadastroVendaDetalhe: TTelaCadastroVendaDetalhe
  Left = 0
  Top = 0
  Caption = 'Venda'
  ClientHeight = 662
  ClientWidth = 984
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    984
    662)
  PixelsPerInch = 96
  TextHeight = 17
  object btnFinalizar: TSpeedButton
    Left = 711
    Top = 621
    Width = 80
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = 'Finalizar'
  end
  object btnOk: TSpeedButton
    Left = 797
    Top = 621
    Width = 80
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    OnClick = btnOkClick
  end
  object btnCancelar: TSpeedButton
    Left = 883
    Top = 621
    Width = 80
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    OnClick = btnCancelarClick
  end
  object lblDtVenda: TLabel
    Left = 755
    Top = 6
    Width = 101
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Data de cadastro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblDtEntrega: TLabel
    Left = 871
    Top = 6
    Width = 95
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Data de entrega'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblTipoVenda: TLabel
    Left = 118
    Top = 6
    Width = 26
    Height = 17
    Caption = 'Tipo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblStatusVenda: TLabel
    Left = 231
    Top = 6
    Width = 35
    Height = 17
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblCodigoVenda: TLabel
    Left = 10
    Top = 6
    Width = 43
    Height = 17
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnLocalizarPessoaVenda: TSpeedButton
    Left = 84
    Top = 75
    Width = 23
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    OnClick = btnLocalizarPessoaVendaClick
  end
  object lblCodigoPessoa: TLabel
    Left = 9
    Top = 57
    Width = 43
    Height = 17
    Caption = 'C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblNomePessoa: TLabel
    Left = 114
    Top = 57
    Width = 41
    Height = 17
    Caption = 'Pessoa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblItens: TLabel
    Left = 20
    Top = 411
    Width = 30
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Itens:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblQtItens: TLabel
    Left = 55
    Top = 411
    Width = 7
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblValorTotalProduto: TLabel
    Left = 782
    Top = 411
    Width = 94
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Valor total itens:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblVlTotalProduto: TLabel
    Left = 908
    Top = 411
    Width = 43
    Height = 17
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 94
    Top = 411
    Width = 71
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Quantidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblQuantidadeTotal: TLabel
    Left = 179
    Top = 411
    Width = 7
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblAcrescimo: TLabel
    Left = 17
    Top = 567
    Width = 59
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'Acr'#233'scimo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 482
  end
  object lblDesconto: TLabel
    Left = 93
    Top = 567
    Width = 52
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'Desconto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 482
  end
  object lblValorTotal: TLabel
    Left = 169
    Top = 567
    Width = 59
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'Valor total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 482
  end
  object lblTotalRecebimento: TLabel
    Left = 783
    Top = 568
    Width = 109
    Height = 16
    Anchors = [akRight, akBottom]
    Caption = 'Total recebimento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblVlTotalRecebimento: TLabel
    Left = 919
    Top = 568
    Width = 44
    Height = 16
    Anchors = [akRight, akBottom]
    BiDiMode = bdRightToLeft
    Caption = 'R$ 0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
  end
  object dtpCadastroVenda: TDateTimePicker
    Left = 755
    Top = 24
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Date = 44220.000000000000000000
    Time = 0.552138541665044600
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object dtpEntregaVenda: TDateTimePicker
    Left = 871
    Top = 24
    Width = 100
    Height = 25
    Anchors = [akTop, akRight]
    Date = 44220.000000000000000000
    Time = 0.552138541665044600
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object cbbTipoVenda: TComboBox
    Left = 118
    Top = 24
    Width = 99
    Height = 25
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 2
    Text = 'Or'#231'amento'
    Items.Strings = (
      'Or'#231'amento'
      'Encomenda'
      'Venda')
  end
  object cbbStatusVenda: TComboBox
    Left = 228
    Top = 24
    Width = 112
    Height = 25
    Style = csDropDownList
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 0
    ParentFont = False
    TabOrder = 3
    Text = 'Aberto'
    Items.Strings = (
      'Aberto'
      'Finalizado')
  end
  object edtIdVenda: TEdit
    Left = 10
    Top = 24
    Width = 95
    Height = 25
    TabStop = False
    Alignment = taRightJustify
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object edtIdPessoa: TEdit
    Left = 8
    Top = 75
    Width = 70
    Height = 25
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnExit = edtIdPessoaExit
  end
  object edtNomePessoa: TEdit
    Left = 114
    Top = 75
    Width = 853
    Height = 25
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object dbgProduto: TDBGrid
    Left = 10
    Top = 135
    Width = 958
    Height = 275
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = dbgProdutoCellClick
    OnDblClick = dbgProdutoDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'IdProduto'
        Title.Caption = 'C'#243'digo'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescricaoProduto'
        Title.Caption = 'Produto'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtItem'
        Title.Caption = 'Quantidade'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlUnitario'
        Title.Caption = 'Vl. Unit'#225'rio'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlDesconto'
        Title.Caption = 'Vl. Desconto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VlAcrescimo'
        Title.Caption = 'Vl. Acr'#233'scimo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VlItem'
        Title.Caption = 'Vl. Total'
        Width = 84
        Visible = True
      end>
  end
  object pnlProduto: TPanel
    Left = 10
    Top = 111
    Width = 958
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object btnAdicionarProduto: TBitBtn
      Left = 1
      Top = 1
      Width = 23
      Height = 23
      Align = alLeft
      Caption = '+'
      TabOrder = 0
      OnClick = btnAdicionarProdutoClick
    end
    object btnEditarProduto: TBitBtn
      Left = 24
      Top = 1
      Width = 23
      Height = 23
      Align = alLeft
      Caption = 'E'
      Enabled = False
      TabOrder = 1
      OnClick = dbgProdutoDblClick
    end
    object btnRemoverProduto: TBitBtn
      Left = 47
      Top = 1
      Width = 23
      Height = 23
      Align = alLeft
      Caption = '-'
      Enabled = False
      TabOrder = 2
      OnClick = btnRemoverProdutoClick
    end
    object btnRelatorio: TBitBtn
      Left = 934
      Top = 1
      Width = 23
      Height = 23
      Align = alRight
      Caption = 'R'
      TabOrder = 3
    end
  end
  object pcVenda: TPageControl
    Left = 8
    Top = 434
    Width = 959
    Height = 128
    ActivePage = tsRecebimento
    Anchors = [akLeft, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    object tsRecebimento: TTabSheet
      Caption = 'Recebimento'
      DesignSize = (
        951
        96)
      object dbgRecebimento: TDBGrid
        Left = 0
        Top = 28
        Width = 950
        Height = 69
        Margins.Top = 0
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsRecebimento
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = dbgRecebimentoCellClick
        OnDblClick = dbgRecebimentoDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'DsFormaPagamento'
            Title.Caption = 'Descri'#231#227'o'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorRecebimento'
            Title.Caption = 'Valor'
            Width = 70
            Visible = True
          end>
      end
      object pnlFormaPagamento: TPanel
        Left = 0
        Top = 3
        Width = 950
        Height = 25
        Margins.Bottom = 0
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object btnRemoverRecebimento: TBitBtn
          Left = 47
          Top = 1
          Width = 23
          Height = 23
          Align = alLeft
          Caption = '-'
          Enabled = False
          TabOrder = 0
          OnClick = btnRemoverRecebimentoClick
        end
        object btnEditarRecebimento: TBitBtn
          Left = 24
          Top = 1
          Width = 23
          Height = 23
          Align = alLeft
          Caption = 'E'
          Enabled = False
          TabOrder = 1
          OnClick = btnEditarRecebimentoClick
          ExplicitLeft = 18
          ExplicitTop = -1
        end
        object btnAdicionarRecebimento: TBitBtn
          Left = 1
          Top = 1
          Width = 23
          Height = 23
          Align = alLeft
          Caption = '+'
          TabOrder = 2
          OnClick = btnAdicionarRecebimentoClick
        end
      end
    end
    object tsObservacao: TTabSheet
      Caption = 'Observa'#231#227'o'
      ImageIndex = 1
      object dsObservacao: TRichEdit
        Left = 0
        Top = 0
        Width = 951
        Height = 96
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Zoom = 100
      end
    end
    object tsValores: TTabSheet
      Caption = 'Valores'
      ImageIndex = 2
      object lblSalario: TLabel
        Left = 33
        Top = 16
        Width = 43
        Height = 17
        Caption = 'Sal'#225'rio:'
      end
      object lblVlSalario: TLabel
        Left = 34
        Top = 38
        Width = 43
        Height = 17
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        Caption = 'R$ 0,00'
        ParentBiDiMode = False
      end
      object lblLucro: TLabel
        Left = 156
        Top = 16
        Width = 35
        Height = 17
        Caption = 'Lucro:'
      end
      object lblVlLucro: TLabel
        Left = 148
        Top = 38
        Width = 43
        Height = 17
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        Caption = 'R$ 0,00'
        ParentBiDiMode = False
      end
      object lblTotalInsumo: TLabel
        Left = 243
        Top = 16
        Width = 77
        Height = 17
        Caption = 'Total insumo:'
      end
      object lblVlTotalInsumo: TLabel
        Left = 279
        Top = 38
        Width = 43
        Height = 17
        Alignment = taRightJustify
        BiDiMode = bdLeftToRight
        Caption = 'R$ 0,00'
        ParentBiDiMode = False
      end
    end
  end
  object edtVlAcrescimoVenda: TEdit
    Left = 17
    Top = 585
    Width = 70
    Height = 24
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    Text = '0,00'
  end
  object edtVlDescontoVenda: TEdit
    Left = 93
    Top = 585
    Width = 70
    Height = 24
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    Text = '0,00'
  end
  object edtVlTotalVenda: TEdit
    Left = 169
    Top = 585
    Width = 70
    Height = 24
    TabStop = False
    Alignment = taRightJustify
    Anchors = [akLeft, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 12
    Text = '0,00'
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 552
    Top = 280
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = cdsProdutoAfterPost
    AfterDelete = cdsProdutoAfterDelete
    Left = 616
    Top = 280
    object cdsProdutoid: TIntegerField
      FieldName = 'id'
    end
    object cdsProdutoIdDocumento: TIntegerField
      FieldName = 'IdDocumento'
    end
    object cdsProdutoIdProduto: TIntegerField
      FieldName = 'IdProduto'
    end
    object cdsProdutoDescricaoProduto: TStringField
      FieldName = 'DescricaoProduto'
      Size = 500
    end
    object cdsProdutoQtItem: TFloatField
      FieldName = 'QtItem'
    end
    object cdsProdutoVlUnitario: TFloatField
      FieldName = 'VlUnitario'
      DisplayFormat = 'R$ #,##0.00'
      currency = True
    end
    object cdsProdutoVlItem: TFloatField
      FieldName = 'VlItem'
      DisplayFormat = 'R$ #,##0.00'
      currency = True
    end
    object cdsProdutoVlDesconto: TFloatField
      FieldName = 'VlDesconto'
      DisplayFormat = 'R$ #,##0.00'
      currency = True
    end
    object cdsProdutoVlAcrescimo: TFloatField
      FieldName = 'VlAcrescimo'
      DisplayFormat = 'R$ #,##0.00'
      currency = True
    end
    object cdsProdutoVlSalario: TCurrencyField
      FieldName = 'VlSalario'
      Visible = False
      DisplayFormat = 'R$ #,##0.00'
    end
    object cdsProdutoVlLucro: TCurrencyField
      FieldName = 'VlLucro'
      Visible = False
      DisplayFormat = 'R$ #,##0.00'
    end
    object cdsProdutoVlTotalInsumo: TCurrencyField
      FieldName = 'VlTotalInsumo'
      DisplayFormat = 'R$ #,##0.00'
    end
  end
  object dsRecebimento: TDataSource
    DataSet = cdsRecebimento
    Left = 500
    Top = 502
  end
  object cdsRecebimento: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = cdsRecebimentoAfterPost
    AfterDelete = cdsRecebimentoAfterDelete
    Left = 588
    Top = 502
    object cdsRecebimentoid: TIntegerField
      FieldName = 'id'
    end
    object cdsRecebimentoDsFormaPagamento: TStringField
      FieldName = 'DsFormaPagamento'
    end
    object cdsRecebimentoValorRecebimento: TCurrencyField
      FieldName = 'ValorRecebimento'
    end
  end
end
