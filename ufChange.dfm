object fChange: TfChange
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102
  ClientHeight = 161
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 16
  object lNameFix: TLabel
    Left = 8
    Top = 8
    Width = 38
    Height = 21
    Caption = 'None'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 44
    Width = 67
    Height = 24
    Caption = #1057#1090#1072#1090#1091#1089':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 86
    Width = 75
    Height = 24
    Caption = #1054#1094#1077#1085#1082#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 254
    Top = 8
    Width = 78
    Height = 16
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
  end
  object cbStatusChanged: TComboBox
    Left = 81
    Top = 47
    Width = 153
    Height = 24
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = #1055#1088#1086#1081#1076#1077#1085#1072
    Items.Strings = (
      #1055#1088#1086#1081#1076#1077#1085#1072
      #1047#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1072
      #1054#1090#1083#1086#1078#1077#1085#1072
      #1041#1088#1086#1096#1077#1085#1072)
  end
  object cbRateChanged: TComboBox
    Left = 86
    Top = 89
    Width = 47
    Height = 24
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 1
    Text = '10'
    Items.Strings = (
      '10'
      '9'
      '8'
      '7'
      '6'
      '5'
      '4'
      '3'
      '2'
      '1'
      '0')
  end
  object mCommentsChanged: TMemo
    Left = 254
    Top = 24
    Width = 257
    Height = 89
    TabOrder = 2
  end
  object bAddGame: TBitBtn
    Left = 328
    Top = 120
    Width = 88
    Height = 33
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    ModalResult = 1
    TabOrder = 3
    OnClick = bAddGameClick
  end
  object BitBtn1: TBitBtn
    Left = 422
    Top = 120
    Width = 88
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
end
