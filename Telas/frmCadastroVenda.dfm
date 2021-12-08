inherited TelaCadastroVenda: TTelaCadastroVenda
  Caption = 'Venda'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnlTop: TPanel
    inherited lblTitulo: TLabel
      Width = 54
      Caption = 'Venda'
      ExplicitWidth = 54
    end
    inherited pnlBotoes: TPanel
      inherited pnlNovo: TPanel
        ExplicitLeft = 91
      end
      inherited Panel6: TPanel
        ExplicitLeft = 81
      end
      inherited Panel8: TPanel
        ExplicitLeft = 166
      end
      inherited Panel10: TPanel
        ExplicitLeft = 260
      end
    end
  end
  inherited pnlMain: TPanel
    ExplicitTop = 65
    object btnFiltarVendas: TButton
      Left = 891
      Top = 22
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Filtrar'
      TabOrder = 0
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
      Top = 58
      Width = 958
      Height = 519
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
          FieldName = 'id'
          Title.Caption = 'C'#243'digo'
          Width = 47
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
          FieldName = 'TipoVenda'
          Title.Caption = 'Tipo'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StatusVenda'
          Title.Caption = 'Status'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DataEntregaVenda'
          Title.Caption = 'Dt. Entrega'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorTotalVenda'
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
end
