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
      object tsProdutoCusto: TTabSheet
        Caption = 'Custo'
        object lblQtEmbalagemCompra: TLabel
          Left = 165
          Top = 7
          Width = 90
          Height = 17
          Caption = 'Qt. Embalagem'
        end
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
          Left = 327
          Top = 112
          Width = 98
          Height = 17
          Caption = 'Custo Reposi'#231#227'o'
        end
        object lblCustoReposicaoUnitario: TLabel
          Left = 489
          Top = 112
          Width = 148
          Height = 17
          Caption = 'Custo Reposi'#231#227'o Unit'#225'rio'
        end
        object lblAcrescimoDesconto: TLabel
          Left = 165
          Top = 112
          Width = 128
          Height = 17
          Caption = 'Acr'#233'scimo / Desconto'
        end
        object lblDataCompra: TLabel
          Left = 489
          Top = 7
          Width = 95
          Height = 17
          Caption = 'Data de compra'
        end
        object lblTempoTrabalho: TLabel
          Left = 165
          Top = 59
          Width = 159
          Height = 17
          Caption = 'Tempo montagem (minuto)'
        end
        object lblCustoMinuto: TLabel
          Left = 327
          Top = 59
          Width = 77
          Height = 17
          Caption = 'Custo minuto'
        end
        object lblValorCustoMontagem: TLabel
          Left = 489
          Top = 59
          Width = 132
          Height = 17
          Caption = 'Valor custo montagem'
        end
        object btnMetroQuadrado: TSpeedButton
          Left = 327
          Top = 28
          Width = 122
          Height = 22
          Caption = 'Calcular m'#178
          Enabled = False
        end
        object cbUnidadeCompra: TComboBox
          Left = 3
          Top = 28
          Width = 120
          Height = 25
          Style = csDropDownList
          TabOrder = 0
          Items.Strings = (
            'Unidade'
            'Pacote'
            'Quilo'
            'Pe'#231'a'
            'Metro'
            'Metro Quadrado')
        end
        object edtQtEmbalagemCompra: TEdit
          Left = 165
          Top = 28
          Width = 129
          Height = 25
          Alignment = taRightJustify
          TabOrder = 1
        end
        object edtCustoProduto: TEdit
          Left = 3
          Top = 80
          Width = 121
          Height = 25
          Alignment = taRightJustify
          TabOrder = 2
        end
        object edtVlFreteCompra: TEdit
          Left = 3
          Top = 131
          Width = 121
          Height = 25
          Alignment = taRightJustify
          TabOrder = 3
        end
        object edtAcrescimoDesconto: TEdit
          Left = 165
          Top = 131
          Width = 127
          Height = 25
          Alignment = taRightJustify
          TabOrder = 4
        end
        object edtCustoReposicao: TEdit
          Left = 327
          Top = 131
          Width = 121
          Height = 25
          Alignment = taRightJustify
          TabOrder = 5
        end
        object edtCustoReposicaoUnitario: TEdit
          Left = 489
          Top = 131
          Width = 121
          Height = 25
          Alignment = taRightJustify
          TabOrder = 6
        end
        object dtDataCompra: TDateTimePicker
          Left = 489
          Top = 28
          Width = 121
          Height = 24
          Date = 44038.000000000000000000
          Time = 0.756530706021294500
          TabOrder = 7
        end
        object edtTempoMontagem: TEdit
          Left = 165
          Top = 80
          Width = 127
          Height = 25
          Alignment = taRightJustify
          TabOrder = 8
        end
        object edtCustoMinuto: TEdit
          Left = 327
          Top = 80
          Width = 121
          Height = 25
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 9
        end
        object edtCustoMontagem: TEdit
          Left = 489
          Top = 80
          Width = 121
          Height = 25
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 10
        end
      end
      object tsProdutoComposicao: TTabSheet
        Caption = 'Composi'#231#227'o'
        ImageIndex = 1
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
          Left = 884
          Top = 5
          Width = 68
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Quantidade'
          ExplicitLeft = 639
        end
        object lblVlTotalInsumo: TLabel
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
          Left = 674
          Top = 402
          Width = 60
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Acr'#233'scimo'
          ExplicitLeft = 429
          ExplicitTop = 306
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
        end
        object lblCustoReposicaoComposicao: TLabel
          Left = 276
          Top = 402
          Width = 95
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Custo reposi'#231#227'o'
          ExplicitLeft = 31
          ExplicitTop = 306
        end
        object lblCustoComp: TLabel
          Left = 821
          Top = 5
          Width = 33
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Custo'
          ExplicitLeft = 576
        end
        object lblMargemLucro: TLabel
          Left = 409
          Top = 402
          Width = 125
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Margem de lucro (%)'
          ExplicitLeft = 164
          ExplicitTop = 306
        end
        object lblValorMargemLucro: TLabel
          Left = 543
          Top = 402
          Width = 125
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = 'Margem de lucro (Vl)'
          ExplicitLeft = 298
          ExplicitTop = 306
        end
        object grdProdutoComposicao: TDBGrid
          Left = 3
          Top = 54
          Width = 943
          Height = 321
          Anchors = [akLeft, akTop, akRight, akBottom]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 4
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'idProdutoComposicao'
              Title.Caption = 'C'#243'digo'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 303
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlCusto'
              Title.Caption = 'Custo'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QtComposicao'
              Title.Caption = 'Quantidade'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VlItem'
              Title.Caption = 'Total'
              Width = 66
              Visible = True
            end>
        end
        object edtAcrescimoDescontoVenda: TEdit
          Left = 674
          Top = 423
          Width = 121
          Height = 25
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          TabOrder = 7
        end
        object edtVlPrecoVenda: TEdit
          Left = 806
          Top = 423
          Width = 121
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
        end
        object edtDescricaoProdutoComposicao: TEdit
          Left = 85
          Top = 24
          Width = 730
          Height = 25
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          ReadOnly = True
          TabOrder = 1
        end
        object edtQuantidadeComposicao: TEdit
          Left = 884
          Top = 24
          Width = 62
          Height = 25
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          TabOrder = 3
          Text = '1'
        end
        object edtCustoResposicaoProduto: TEdit
          Left = 276
          Top = 423
          Width = 121
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          BiDiMode = bdLeftToRight
          Enabled = False
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 5
        end
        object edtVlCustoComposicao: TEdit
          Left = 821
          Top = 24
          Width = 57
          Height = 25
          TabStop = False
          Anchors = [akTop, akRight]
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          ReadOnly = True
          TabOrder = 2
        end
        object edtMargemLucro: TEdit
          Left = 409
          Top = 423
          Width = 121
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          TabOrder = 6
        end
        object edtValorMagemLucro: TEdit
          Left = 543
          Top = 423
          Width = 121
          Height = 25
          TabStop = False
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Enabled = False
          TabOrder = 9
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
    object chkPossuiComposicao: TCheckBox
      Left = 837
      Top = 65
      Width = 129
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Possui composi'#231#227'o'
      TabOrder = 3
    end
  end
end
