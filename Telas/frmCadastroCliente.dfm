inherited TelaCadastroCliente: TTelaCadastroCliente
  Caption = 'Cliente'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnlTop: TPanel
    TabOrder = 1
    inherited lblTitulo: TLabel
      Width = 68
      Caption = 'Clientes'
      ExplicitWidth = 68
    end
  end
  inherited pnlMain: TPanel
    TabOrder = 0
    object lblCodigoPessoa: TLabel
      Left = 15
      Top = 8
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object lblNomePessoa: TLabel
      Left = 74
      Top = 9
      Width = 36
      Height = 17
      Caption = 'Nome'
    end
    object edtIdPessoa: TEdit
      Tag = 1
      Left = 15
      Top = 31
      Width = 50
      Height = 25
      TabStop = False
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 1
    end
    object edtNomePessoa: TEdit
      Left = 74
      Top = 31
      Width = 901
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
end
