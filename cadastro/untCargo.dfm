object frmCargo: TfrmCargo
  Left = 0
  Top = 0
  Caption = 'frmCargo'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 80
    Top = 176
    Width = 217
    Height = 41
    Caption = 'Salvar'
    OnClick = SpeedButton1Click
  end
  object Label1: TLabel
    Left = 72
    Top = 32
    Width = 33
    Height = 17
    Caption = 'Codigo'
  end
  object Label2: TLabel
    Left = 72
    Top = 72
    Width = 34
    Height = 13
    Caption = 'Nome: '
  end
  object edtCodigo: TEdit
    Left = 160
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 160
    Top = 69
    Width = 121
    Height = 21
    TabOrder = 1
  end
end
