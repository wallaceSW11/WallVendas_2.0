inherited TelaCadastroCliente: TTelaCadastroCliente
  Caption = 'Cliente'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnlTop: TPanel
    inherited lblTitulo: TLabel
      Width = 68
      Caption = 'Clientes'
      ExplicitWidth = 68
    end
  end
  inherited pnlMain: TPanel
    object lblCodigoPessoa: TLabel
      Left = 10
      Top = 8
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object lblNomePessoa: TLabel
      Left = 65
      Top = 9
      Width = 36
      Height = 17
      Caption = 'Nome'
    end
    object edtIdPessoa: TEdit
      Left = 10
      Top = 31
      Width = 50
      Height = 25
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 0
    end
    object edtNomePessoa: TEdit
      Left = 65
      Top = 31
      Width = 901
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
end
