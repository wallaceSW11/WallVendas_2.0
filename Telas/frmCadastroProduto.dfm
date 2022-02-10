inherited TelaCadastroProduto: TTelaCadastroProduto
  Caption = 'Produto'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnlTop: TPanel
    inherited lblTitulo: TLabel
      Width = 72
      Caption = 'Produto'
      ExplicitWidth = 72
    end
    inherited pnlBotoes: TPanel
      inherited pnlPesquisar: TPanel
        inherited btnPesquisar: TSpeedButton
          OnClick = btnPesquisarClick
        end
      end
    end
  end
  inherited pnlMain: TPanel
    object lblIdProduto: TLabel
      Left = 9
      Top = 5
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object lblDescricaoProduto: TLabel
      Left = 63
      Top = 5
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
    end
    object lblPrecoCusto: TLabel
      Left = 9
      Top = 64
      Width = 104
      Height = 17
      Caption = 'Pre'#231'o de compra:'
    end
    object lblVlPrecoCompra: TLabel
      Tag = 6
      Left = 139
      Top = 64
      Width = 43
      Height = 17
      Caption = 'R$ 0,00'
    end
    object lblPrecoVenda: TLabel
      Left = 218
      Top = 64
      Width = 94
      Height = 17
      Caption = 'Pre'#231'o de venda:'
    end
    object lblVlPrecoVenda: TLabel
      Tag = 6
      Left = 340
      Top = 64
      Width = 43
      Height = 17
      Caption = 'R$ 0,00'
    end
    object pcProdutoComplemento: TPageControl
      Left = 9
      Top = 96
      Width = 959
      Height = 481
      ActivePage = tsProdutoCusto
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnChange = AtualizarValoresDoProduto
      object tsProdutoCusto: TTabSheet
        Caption = 'Custo'
        OnShow = tsProdutoCustoShow
        object lblUnidadeCompra: TLabel
          Left = 3
          Top = 7
          Width = 49
          Height = 17
          Caption = 'Unidade'
        end
        object lblCusto: TLabel
          Left = 3
          Top = 59
          Width = 33
          Height = 17
          Caption = 'Custo'
        end
        object lblFreteCompra: TLabel
          Left = 3
          Top = 112
          Width = 29
          Height = 17
          Caption = 'Frete'
        end
        object lblCustoReposicao: TLabel
          Left = 350
          Top = 112
          Width = 98
          Height = 17
          Caption = 'Custo Reposi'#231#227'o'
        end
        object lblCustoReposicaoUnitario: TLabel
          Left = 525
          Top = 112
          Width = 148
          Height = 17
          Caption = 'Custo Reposi'#231#227'o Unit'#225'rio'
        end
        object lblAcrescimoDesconto: TLabel
          Left = 177
          Top = 112
          Width = 128
          Height = 17
          Caption = 'Acr'#233'scimo / Desconto'
        end
        object lblDataCompra: TLabel
          Left = 697
          Top = 6
          Width = 95
          Height = 17
          Caption = 'Data de compra'
        end
        object lblTempoTrabalho: TLabel
          Left = 177
          Top = 59
          Width = 159
          Height = 17
          Caption = 'Tempo montagem (minuto)'
        end
        object lblCustoMinuto: TLabel
          Left = 350
          Top = 59
          Width = 77
          Height = 17
          Caption = 'Custo minuto'
        end
        object lblValorCustoMontagem: TLabel
          Left = 525
          Top = 59
          Width = 132
          Height = 17
          Caption = 'Valor custo montagem'
        end
        object lblAltura: TLabel
          Left = 351
          Top = 7
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
          Left = 434
          Top = 7
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
          Left = 525
          Top = 7
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
        object lblQtEmbalagemCompra: TLabel
          Left = 175
          Top = 7
          Width = 90
          Height = 17
          Caption = 'Qt. Embalagem'
        end
        object cbUnidadeCompra: TComboBox
          Left = 3
          Top = 28
          Width = 160
          Height = 25
          Style = csDropDownList
          TabOrder = 0
          OnChange = cbUnidadeCompraChange
          Items.Strings = (
            'Unidade'
            'Pacote'
            'Quilo'
            'Pe'#231'a'
            'Metro'
            'Metro Quadrado'
            'Litro')
        end
        object dtDataCompra: TDateTimePicker
          Left = 697
          Top = 29
          Width = 160
          Height = 24
          Date = 44038.000000000000000000
          Time = 0.756530706021294500
          TabOrder = 5
        end
        object edtCustoProduto: TEditCurrency
          Tag = 3
          Left = 3
          Top = 81
          Width = 160
          Height = 25
          Alignment = taRightJustify
          TabOrder = 8
          Text = '0,00'
          OnChange = AtualizarValoresDoProduto
          ExibirCifrao = False
        end
        object edtVlFreteCompra: TEditCurrency
          Tag = 3
          Left = 3
          Top = 135
          Width = 160
          Height = 25
          Alignment = taRightJustify
          TabOrder = 10
          Text = '0,00'
          OnChange = AtualizarValoresDoProduto
          ExibirCifrao = False
        end
        object edtAcrescimoDesconto: TEditCurrency
          Tag = 3
          Left = 177
          Top = 135
          Width = 160
          Height = 25
          Alignment = taRightJustify
          TabOrder = 11
          Text = '0,00'
          OnChange = AtualizarValoresDoProduto
          ExibirCifrao = False
        end
        object edtCustoReposicao: TEditCurrency
          Tag = 7
          Left = 351
          Top = 135
          Width = 160
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          TabOrder = 12
          Text = '0,00'
          ExibirCifrao = False
        end
        object edtCustoReposicaoUnitario: TEditCurrency
          Tag = 7
          Left = 525
          Top = 135
          Width = 160
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          TabOrder = 13
          Text = '0,00'
          ExibirCifrao = False
        end
        object edtCustoMinuto: TEditCurrency
          Tag = 7
          Left = 350
          Top = 80
          Width = 160
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          TabOrder = 6
          Text = '0,00'
          ExibirCifrao = False
        end
        object edtCustoMontagem: TEditCurrency
          Tag = 7
          Left = 525
          Top = 80
          Width = 160
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          TabOrder = 7
          Text = '0,00'
          ExibirCifrao = False
        end
        object edtTempoMontagem: TEditNumber
          Tag = 2
          Left = 177
          Top = 81
          Width = 160
          Height = 25
          Alignment = taRightJustify
          TabOrder = 9
          Text = '0'
          OnChange = AtualizarValoresDoProduto
          AceitaVirgula = False
        end
        object edtAltura: TEditNumber
          Tag = 8
          Left = 351
          Top = 28
          Width = 79
          Height = 25
          Alignment = taRightJustify
          TabOrder = 2
          Text = '0'
          OnChange = CalcularPreco
          AceitaVirgula = True
        end
        object edtLargura: TEditNumber
          Tag = 8
          Left = 434
          Top = 28
          Width = 77
          Height = 25
          Alignment = taRightJustify
          TabOrder = 3
          Text = '0'
          OnChange = CalcularPreco
          AceitaVirgula = True
        end
        object edtPreco: TEditCurrency
          Tag = 7
          Left = 525
          Top = 28
          Width = 160
          Height = 25
          Alignment = taRightJustify
          TabOrder = 4
          Text = '0,00'
          OnChange = CalcularPreco
          ExibirCifrao = False
        end
        object edtQtEmbalagemCompra: TEditNumber
          Tag = 4
          Left = 177
          Top = 28
          Width = 160
          Height = 25
          Alignment = taRightJustify
          TabOrder = 1
          Text = '0'
          OnChange = AtualizarValoresDoProduto
          AceitaVirgula = True
        end
      end
      object tsProdutoComposicao: TTabSheet
        Caption = 'Composi'#231#227'o'
        ImageIndex = 1
        OnShow = tsProdutoComposicaoShow
        DesignSize = (
          951
          449)
        object lblIdProdutoComposicao: TLabel
          Left = 5
          Top = 5
          Width = 43
          Height = 17
          Caption = 'C'#243'digo'
        end
        object lblDescricaoProdutoComposicao: TLabel
          Left = 85
          Top = 5
          Width = 57
          Height = 17
          Caption = 'Descri'#231#227'o'
        end
        object lblQtComposicao: TLabel
          Left = 871
          Top = 5
          Width = 68
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Quantidade'
        end
        object lblVlTotalInsumo: TLabel
          Tag = 6
          Left = 901
          Top = 377
          Width = 43
          Height = 17
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'R$ 0,00'
          ExplicitLeft = 656
          ExplicitTop = 281
        end
        object lblTotalInsumo: TLabel
          Left = 820
          Top = 377
          Width = 53
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'SubTotal:'
          ExplicitLeft = 575
          ExplicitTop = 281
        end
        object lblAcrescimoComposicao: TLabel
          Left = 672
          Top = 402
          Width = 60
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Acr'#233'scimo'
        end
        object lblPrecoVendaFinal: TLabel
          Left = 806
          Top = 400
          Width = 100
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Pre'#231'o final venda'
          ExplicitLeft = 561
          ExplicitTop = 304
        end
        object btnLocalizarProdutoComposicao: TSpeedButton
          Left = 57
          Top = 25
          Width = 23
          Height = 22
          Caption = 'F2'
          OnClick = btnLocalizarProdutoComposicaoClick
        end
        object lblCustoReposicaoComposicao: TLabel
          Left = 267
          Top = 402
          Width = 95
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Custo reposi'#231#227'o'
        end
        object lblCustoComp: TLabel
          Left = 787
          Top = 5
          Width = 33
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Custo'
        end
        object lblMargemLucro: TLabel
          Left = 402
          Top = 402
          Width = 125
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Margem de lucro (%)'
        end
        object lblValorMargemLucro: TLabel
          Left = 539
          Top = 402
          Width = 125
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Margem de lucro (Vl)'
        end
        object lblAlturaComposicao: TLabel
          Left = 619
          Top = 5
          Width = 63
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Altura (cm)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblLarguraComposicao: TLabel
          Left = 704
          Top = 5
          Width = 74
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Largura (cm)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object dbgProdutoComposicao: TDBGrid
          Left = 3
          Top = 54
          Width = 943
          Height = 321
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsComposicao
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDblClick = dbgProdutoComposicaoDblClick
          OnKeyDown = dbgProdutoComposicaoKeyDown
          Columns = <
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'Codigo'
              Title.Caption = 'C'#243'digo'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Custo'
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'Altura'
              Width = 87
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'Largura'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quantidade'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ValorItem'
              Title.Caption = 'Vl. Item'
              Visible = True
            end>
        end
        object edtVlPrecoVenda: TEdit
          Tag = 3
          Left = 806
          Top = 423
          Width = 126
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 8
        end
        object edtIdProdutoComposicao: TEdit
          Left = 3
          Top = 24
          Width = 50
          Height = 25
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 0
          OnExit = edtIdProdutoComposicaoExit
        end
        object edtDescricaoProdutoComposicao: TEdit
          Tag = 1
          Left = 85
          Top = 24
          Width = 528
          Height = 25
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          ReadOnly = True
          TabOrder = 1
        end
        object edtQuantidadeComposicao: TEdit
          Tag = 4
          Left = 871
          Top = 24
          Width = 75
          Height = 25
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          TabOrder = 5
          Text = '1'
          OnExit = edtQuantidadeComposicaoExit
        end
        object edtCustoResposicaoProduto: TEdit
          Tag = 7
          Left = 267
          Top = 423
          Width = 126
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          BiDiMode = bdLeftToRight
          Enabled = False
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 7
        end
        object edtVlCustoComposicao: TEdit
          Tag = 1
          Left = 787
          Top = 24
          Width = 78
          Height = 25
          TabStop = False
          Anchors = [akTop, akRight]
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 4
        end
        object edtValorMagemLucro: TEdit
          Tag = 7
          Left = 539
          Top = 423
          Width = 126
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Enabled = False
          TabOrder = 9
        end
        object edtMargemLucro: TEditNumber
          Left = 402
          Top = 423
          Width = 121
          Height = 25
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          TabOrder = 10
          Text = '0'
          OnChange = AtualizarValoresDoProduto
          AceitaVirgula = True
        end
        object edtAcrescimoDescontoVenda: TEditCurrency
          Tag = 3
          Left = 672
          Top = 423
          Width = 121
          Height = 25
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          TabOrder = 11
          Text = '0,00'
          OnChange = AtualizarValoresDoProduto
          ExibirCifrao = False
        end
        object edtAlturaComposicao: TEditNumber
          Tag = 8
          Left = 619
          Top = 24
          Width = 79
          Height = 25
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          TabOrder = 2
          Text = '0'
          OnChange = CalcularQuantidadeMetroQuadrado
          AceitaVirgula = True
        end
        object edtLarguraComposicao: TEditNumber
          Tag = 8
          Left = 704
          Top = 23
          Width = 77
          Height = 25
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          TabOrder = 3
          Text = '0'
          OnChange = CalcularQuantidadeMetroQuadrado
          AceitaVirgula = True
        end
      end
    end
    object edtIdProduto: TEdit
      Left = 9
      Top = 24
      Width = 50
      Height = 25
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 1
    end
    object edtDescricaoProduto: TEdit
      Left = 64
      Top = 24
      Width = 902
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
  end
  object cdsComposicao: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = cdsComposicaoAfterPost
    AfterDelete = cdsComposicaoAfterDelete
    Left = 125
    Top = 413
    object cdsComposicaoCodigo: TStringField
      FieldName = 'Codigo'
    end
    object cdsComposicaoDescricao: TStringField
      DisplayWidth = 200
      FieldName = 'Descricao'
      Size = 200
    end
    object cdsComposicaoCusto: TCurrencyField
      FieldName = 'Custo'
    end
    object cdsComposicaoAltura: TStringField
      FieldName = 'Altura'
    end
    object cdsComposicaoLargura: TStringField
      FieldName = 'Largura'
    end
    object cdsComposicaoQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object cdsComposicaoValorItem: TCurrencyField
      FieldName = 'ValorItem'
    end
  end
  object dsComposicao: TDataSource
    DataSet = cdsComposicao
    Left = 213
    Top = 413
  end
end
