object TelaPesquisaPadrao: TTelaPesquisaPadrao
  Left = 0
  Top = 0
  Caption = 'TelaPesquisaPadrao'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    784
    561)
  PixelsPerInch = 96
  TextHeight = 17
  object lblCampo: TLabel
    Left = 10
    Top = 10
    Width = 42
    Height = 17
    Caption = 'Campo'
  end
  object btnOk: TSpeedButton
    Left = 610
    Top = 531
    Width = 80
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    OnClick = btnOkClick
  end
  object btnCancelar: TSpeedButton
    Left = 696
    Top = 531
    Width = 80
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    OnClick = btnCancelarClick
  end
  object lblTrecho: TLabel
    Left = 161
    Top = 10
    Width = 39
    Height = 17
    Caption = 'Trecho'
  end
  object edtTrecho: TEdit
    Left = 161
    Top = 32
    Width = 615
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    OnChange = edtTrechoChange
    OnKeyDown = edtTrechoKeyDown
    OnKeyPress = edtTrechoKeyPress
  end
  object cbCampo: TComboBox
    Left = 10
    Top = 32
    Width = 145
    Height = 25
    Style = csDropDownList
    TabOrder = 0
    OnChange = cbCampoChange
  end
  object dbgPesquisa: TDBGrid
    Left = 10
    Top = 63
    Width = 766
    Height = 462
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsPesquisa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgPesquisaDblClick
  end
  object dsPesquisa: TDataSource
    Left = 384
    Top = 288
  end
end
