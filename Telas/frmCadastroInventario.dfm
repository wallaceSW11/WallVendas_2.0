inherited TelaCadastroInventario: TTelaCadastroInventario
  Caption = 'Inventario'
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnlTop: TPanel
    inherited lblTitulo: TLabel
      Left = 10
      Width = 88
      Caption = 'Invent'#225'rio'
      ExplicitLeft = 10
      ExplicitWidth = 88
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
    object Label2: TLabel
      Left = 20
      Top = 117
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
    object Label3: TLabel
      Left = 105
      Top = 117
      Width = 44
      Height = 16
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnPesquisarProdutoInventario: TSpeedButton
      Left = 77
      Top = 139
      Width = 23
      Height = 22
      Caption = 'F2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 901
      Top = 117
      Width = 65
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 21
      Top = 28
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
    object Label6: TLabel
      Left = 76
      Top = 28
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
    object lbl1: TLabel
      Left = 860
      Top = 28
      Width = 26
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 775
      Top = 117
      Width = 46
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 10
      Top = 6
      Width = 35
      Height = 16
      Caption = 'Dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 48
      Top = 20
      Width = 918
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object Bevel2: TBevel
      Left = 60
      Top = 104
      Width = 906
      Height = 2
      Anchors = [akLeft, akTop, akRight]
    end
    object Label8: TLabel
      Left = 10
      Top = 90
      Width = 44
      Height = 16
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtIdProdutoInventario: TEdit
      Left = 20
      Top = 139
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
    end
    object edtDescricaoProdutoInventario: TEdit
      Tag = 1
      Left = 106
      Top = 139
      Width = 663
      Height = 24
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
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
    object edtQtProdutoInventario: TEdit
      Left = 901
      Top = 139
      Width = 67
      Height = 24
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dbgInventario: TDBGrid
      Left = 20
      Top = 176
      Width = 948
      Height = 401
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsInventarioItem
      Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'IdProduto'
          Title.Caption = 'C'#243'digo'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Unidade'
          Width = 110
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Altura'
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Largura'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantidade'
          Width = 88
          Visible = True
        end>
    end
    object edtIdInventario: TEdit
      Left = 20
      Top = 50
      Width = 50
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
      ReadOnly = True
      TabOrder = 4
    end
    object edtDescricaoInventario: TEdit
      Left = 77
      Top = 50
      Width = 777
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 500
      ParentFont = False
      TabOrder = 5
    end
    object dtInventario: TDateTimePicker
      Left = 860
      Top = 50
      Width = 106
      Height = 24
      Anchors = [akTop, akRight]
      Date = 44509.000000000000000000
      Time = 0.717828263892442900
      TabOrder = 6
    end
    object edtUnidade: TEdit
      Tag = 1
      Left = 775
      Top = 139
      Width = 120
      Height = 24
      TabStop = False
      Anchors = [akTop, akRight]
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 500
      ParentFont = False
      TabOrder = 7
    end
  end
  object dsInventarioItem: TDataSource
    Left = 120
    Top = 353
  end
end
