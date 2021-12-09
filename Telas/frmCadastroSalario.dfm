inherited TelaCadastroSalario: TTelaCadastroSalario
  Caption = 'Salario'
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnlTop: TPanel
    inherited lblTitulo: TLabel
      Width = 60
      Caption = 'Sal'#225'rio'
      ExplicitWidth = 60
    end
    inherited pnlBotoes: TPanel
      inherited pnlDuplicar: TPanel
        Visible = False
      end
      inherited pnlPesquisar: TPanel
        Visible = False
      end
      inherited pnlNovo: TPanel
        Visible = False
      end
      inherited Panel8: TPanel
        Left = 260
        ExplicitLeft = 260
      end
      inherited Panel10: TPanel
        Left = 166
        ExplicitLeft = 166
      end
      inherited pnlExcluir: TPanel
        Visible = False
      end
    end
  end
  inherited pnlMain: TPanel
    Tag = 1
    object lblValorSalario: TLabel
      Left = 15
      Top = 8
      Width = 151
      Height = 17
      Caption = 'Valor do sal'#225'rio desejado'
    end
    object lblTotalHorasPorDia: TLabel
      Left = 179
      Top = 8
      Width = 131
      Height = 17
      Caption = 'Total de horas por dia'
    end
    object lblTotalDiasSemana: TLabel
      Left = 345
      Top = 8
      Width = 142
      Height = 17
      Caption = 'Total de dias na semana'
    end
    object lblTotalHorasPorSemana: TLabel
      Left = 345
      Top = 150
      Width = 158
      Height = 17
      Caption = 'Total de horas por semana'
    end
    object lblTotalHoraMes: TLabel
      Left = 511
      Top = 150
      Width = 137
      Height = 17
      Caption = 'Total de horas por m'#234's'
    end
    object lblValorCustoPorHora: TLabel
      Left = 180
      Top = 150
      Width = 141
      Height = 17
      Caption = 'Valor do custo por hora'
    end
    object lblValorCustoPorMinuto: TLabel
      Left = 15
      Top = 150
      Width = 154
      Height = 17
      Caption = 'Valor do custo por minuto'
    end
    object lblTotalDespesas: TLabel
      Left = 15
      Top = 80
      Width = 144
      Height = 17
      Caption = 'Valor total das despesas'
    end
    object lblSalarioDespesa: TLabel
      Left = 15
      Top = 217
      Width = 113
      Height = 17
      Caption = 'Sal'#225'rio + Despesas'
    end
    object lblQuantidadeSemanasNoMes: TLabel
      Left = 511
      Top = 8
      Width = 189
      Height = 17
      Caption = 'Quantidade de semanas no m'#234's'
    end
    object edtTotalHorasPorSemana: TEdit
      Tag = 1
      Left = 345
      Top = 172
      Width = 155
      Height = 25
      TabStop = False
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 4
      Text = '0'
    end
    object edtTotalHorasMes: TEdit
      Tag = 1
      Left = 511
      Top = 172
      Width = 155
      Height = 25
      TabStop = False
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 5
      Text = '0'
    end
    object edtVlCustoPorHora: TEdit
      Tag = 1
      Left = 180
      Top = 172
      Width = 155
      Height = 25
      TabStop = False
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 6
      Text = '0,00'
    end
    object edtVlCustoPorMinuto: TEdit
      Tag = 1
      Left = 15
      Top = 172
      Width = 155
      Height = 25
      TabStop = False
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 7
      Text = '0,00'
    end
    object edtVlTotalDespesas: TEdit
      Tag = 1
      Left = 15
      Top = 102
      Width = 155
      Height = 25
      TabStop = False
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 8
      Text = '0,00'
    end
    object edtVlSalarioSomandoDespesas: TEdit
      Tag = 1
      Left = 15
      Top = 240
      Width = 155
      Height = 25
      TabStop = False
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 9
      Text = '0,00'
    end
    object edtQuantidadeSemanasMes: TEditNumber
      Left = 511
      Top = 31
      Width = 155
      Height = 25
      Alignment = taRightJustify
      TabOrder = 3
      Text = '0'
      OnChange = edtVlSalarioChange
    end
    object edtVlSalario: TEditCurrency
      Left = 15
      Top = 31
      Width = 155
      Height = 25
      Alignment = taRightJustify
      TabOrder = 0
      Text = '0,00'
      OnChange = edtVlSalarioChange
    end
    object edtTotalDiasSemana: TEditNumber
      Left = 345
      Top = 30
      Width = 155
      Height = 25
      Alignment = taRightJustify
      TabOrder = 2
      Text = '0'
      OnChange = edtVlSalarioChange
    end
    object edtTotalHorasPorDia: TEditNumber
      Left = 180
      Top = 30
      Width = 155
      Height = 25
      Alignment = taRightJustify
      TabOrder = 1
      Text = '0'
      OnChange = edtVlSalarioChange
    end
    object pnlDespesas: TPanel
      Left = 180
      Top = 102
      Width = 75
      Height = 25
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 10
      object btnDespesas: TSpeedButton
        Left = 0
        Top = 0
        Width = 71
        Height = 21
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Caption = 'Despesas'
        Flat = True
        OnClick = btnDespesasClick
        ExplicitLeft = -6
        ExplicitHeight = 29
      end
    end
  end
end
