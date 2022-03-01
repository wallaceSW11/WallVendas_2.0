inherited TelaCadastroVenda: TTelaCadastroVenda
  Caption = 'Venda'
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnlTop: TPanel
    inherited lblTitulo: TLabel
      Width = 54
      Caption = 'Venda'
      ExplicitWidth = 54
    end
    inherited pnlBotoes: TPanel
      inherited pnlPesquisar: TPanel
        inherited btnPesquisar: TSpeedButton
          OnClick = btnPesquisarClick
        end
      end
      inherited pnlEditar: TPanel
        inherited btnEditar: TSpeedButton
          ExplicitLeft = -4
        end
      end
    end
  end
  inherited pnlMain: TPanel
    object btnFiltarVendas: TButton
      Left = 891
      Top = 22
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Filtrar'
      TabOrder = 0
      OnClick = btnFiltarVendasClick
    end
    object grpPeriodo: TGroupBox
      Left = 10
      Top = 6
      Width = 239
      Height = 49
      Caption = 'Per'#237'odo de cadastro'
      TabOrder = 1
      object lblPeriodoAte: TLabel
        Left = 109
        Top = 22
        Width = 21
        Height = 17
        Caption = 'at'#233':'
      end
      object dtpVendaInicial: TDateTimePicker
        Left = 8
        Top = 22
        Width = 95
        Height = 24
        Date = 44218.000000000000000000
        Time = 0.993741423611936600
        TabOrder = 0
      end
      object dtpVendaFinal: TDateTimePicker
        Left = 138
        Top = 22
        Width = 95
        Height = 24
        Date = 44218.000000000000000000
        Time = 0.993741423611936600
        TabOrder = 1
      end
    end
    object grpTipoVenda: TGroupBox
      Left = 254
      Top = 6
      Width = 251
      Height = 49
      Caption = 'Tipo'
      TabOrder = 2
      object chkTipoOrcamento: TCheckBox
        Left = 6
        Top = 21
        Width = 89
        Height = 17
        Caption = 'Or'#231'amento'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
      end
      object chkTipoEncomenda: TCheckBox
        Left = 94
        Top = 21
        Width = 97
        Height = 17
        Caption = 'Encomenda'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkTipoVenda: TCheckBox
        Left = 189
        Top = 21
        Width = 68
        Height = 17
        Caption = 'Venda'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object grpStatusVenda: TGroupBox
      Left = 509
      Top = 6
      Width = 159
      Height = 49
      Caption = 'Status'
      TabOrder = 3
      object chkStatusAberto: TCheckBox
        Left = 6
        Top = 21
        Width = 75
        Height = 17
        Caption = 'Aberto'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkStatusFinalizado: TCheckBox
        Left = 76
        Top = 21
        Width = 97
        Height = 17
        Caption = 'Finalizado'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object dbgVenda: TDBGrid
      Left = 10
      Top = 61
      Width = 958
      Height = 519
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsVenda
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = dbgVendaDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'C'#243'digo'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IdPessoa'
          Title.Caption = 'C'#243'd. Pessoa'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomePessoa'
          Title.Caption = 'Pessoa'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tipo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Status'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DataCadastro'
          Title.Caption = 'Dt. Cadastro'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DataEntrega'
          Title.Caption = 'Dt. Entrega'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlTotalVenda'
          Title.Caption = 'Valor total'
          Width = 85
          Visible = True
        end>
    end
    object chkFechamento: TCheckBox
      Left = 688
      Top = 26
      Width = 97
      Height = 17
      Caption = 'Fechamento'
      TabOrder = 5
    end
  end
  object dsVenda: TDataSource
    Left = 64
    Top = 217
  end
end
