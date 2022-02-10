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
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object btnFinalizar: TSpeedButton
    Left = 688
    Top = 600
    Width = 81
    Height = 49
    Caption = 'Finalizar'
  end
  object btnOk: TSpeedButton
    Left = 792
    Top = 600
    Width = 81
    Height = 49
    Caption = 'OK'
    OnClick = btnOkClick
  end
  object btnCancelar: TSpeedButton
    Left = 887
    Top = 600
    Width = 81
    Height = 49
    Caption = 'Cancelar'
    OnClick = btnCancelarClick
  end
end
