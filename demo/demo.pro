######################################################################
# Automatically generated by qmake (2.01a) ?? ?? 23 19:29:41 2014
######################################################################

TEMPLATE = app
TARGET = demo
CONFIG(x64){
TARGET = $$TARGET"64"
}
DEPENDPATH += .
INCLUDEPATH += . \
			   ../utilities/include \
			   ../soui/include \
			   ../third-part/wke/include \
			   ../third-part/mhook/mhook-lib \
			   ../third-part/nanosvg/src \
			   ../components
			   
dir = ..
include($$dir/common.pri)
#demo中使用了#import，不支持MP编译
QMAKE_CXXFLAGS -= /MP

CONFIG(debug,debug|release){
	LIBS += utilitiesd.lib soui3d.lib
}
else{
	LIBS += utilities.lib soui3.lib
}
CONFIG(debug,debug|release){
	LIBS += mhookd.lib smileyd.lib
}
else{
	LIBS += mhook.lib smiley.lib
}


PRECOMPILED_HEADER = stdafx.h

# Input
HEADERS += MainDlg.h \
          FormatMsgDlg.h \
          resource.h \
          adapter.h\
          wtlhelper/whwindow.h \
          ../controls.extend/SMcListViewEx/SHeaderCtrlEx.h\
          ../controls.extend/SMcListViewEx/SMcListViewEx.h\
          ../controls.extend/SWkeWebkit.h \
          ../controls.extend/gif/SGifPlayer.h \
          ../controls.extend/gif/SSkinGif.h \
          ../controls.extend/gif/SSkinAPNG.h \
          ../controls.extend/SSkinImgFrame3.h \
          ../controls.extend/SVscrollbar.h \
          ../controls.extend/SSkinNewScrollbar.h \
          ../controls.extend/FileHelper.h \
          ../controls.extend/sipaddressctrl.h \
          ../controls.extend/propgrid/spropertygrid.h \
          ../controls.extend/propgrid/spropertyitembase.h \
          ../controls.extend/propgrid/propitem/spropertyitem-text.h \
          ../controls.extend/propgrid/propitem/spropertyitem-option.h \
          ../controls.extend/propgrid/propitem/spropertyitem-color.h \
          ../controls.extend/propgrid/propitem/spropertyitem-size.h \
          ../controls.extend/propgrid/propitem/spropertyitem-rect.h \
          ../controls.extend/propgrid/propitem/spropertyitem-group.h \
          ../controls.extend/propgrid/colorpicker/ColourPopup.h \
          ../controls.extend/propgrid/colorpicker/SColorPicker.h \
          ../controls.extend/sfadeframe.h \
          ../controls.extend/sradiobox2.h \
          ../controls.extend/SChromeTabCtrl.h \
          ../controls.extend/siectrl.h \
          ../controls.extend/SDocHostUIHandler.h \
          ../controls.extend/schatedit.h \
          ../controls.extend/reole/richeditole.h \
          ../controls.extend/reole/dataobject.h \
          ../controls.extend/sscrolltext.h \
          ../controls.extend/scalendar2.h \
          ../controls.extend/slistctrlex.h \
          ../controls.extend/simagemaskwnd.h \
          ../controls.extend/SRatingBar.h \
          ../controls.extend/SFreeMoveWindow.h \
          ../controls.extend/smiley/SSmileyCtrl.h \
          ../controls.extend/tipwnd.h \
          ../controls.extend/sprogressring.h \
          ../controls.extend/saniwindow.h \
          ../controls.extend/sgrouplist.h \
          ../controls.extend/SMcListViewEx/STabCtrlHeaderBinder.h \
          magnet/magnetframe.h \
          smatrixwindow.h \
          sroundimage.h \
          threadObject.h \
          SmileyCreateHook.h \
          uianimation/uianimation.h \
          uianimation/uianimationwnd.h\
          appledock/sdesktopdock.h \
          clock/sclock.h \
          skin/SDemoSkin.h \
          skin/SetSkinWnd2.h \
          skin/SSkinLoader.h \
          trayicon/SShellNotifyIcon.h \
          trayicon/SShellNofityHwnd2.h \
          SInterpolatorView.h \
          qrcode/SQrCtrl.h \
          qrcode/QR_Encode.h \
          SPathView.h \
          SCheckBox2.h \

SOURCES += demo.cpp \
          MainDlg.cpp \
          FormatMsgDlg.cpp \
          ../controls.extend/SWkeWebkit.cpp \
          ../controls.extend/SMcListViewEx/SMCListViewEx.cpp \
          ../controls.extend/SMcListViewEx/SHeaderCtrlEx.cpp \
          ../controls.extend/SMcListViewEx/STabCtrlHeaderBinder.cpp \
          ../controls.extend/gif/SGifPlayer.cpp \
          ../controls.extend/gif/SSkinGif.cpp \
          ../controls.extend/gif/SSkinAPNG.cpp \
          ../controls.extend/SSkinImgFrame3.cpp \
          ../controls.extend/sipaddressctrl.cpp \
          ../controls.extend/propgrid/spropertygrid.cpp \
          ../controls.extend/propgrid/spropertyitembase.cpp \
          ../controls.extend/propgrid/propitem/spropertyitem-text.cpp \
          ../controls.extend/propgrid/propitem/spropertyitem-option.cpp \
          ../controls.extend/propgrid/propitem/spropertyitem-color.cpp \
          ../controls.extend/propgrid/propitem/spropertyitem-size.cpp \
          ../controls.extend/propgrid/propitem/spropertyitem-rect.cpp \
          ../controls.extend/propgrid/propitem/spropertyitem-group.cpp \
          ../controls.extend/propgrid/colorpicker/ColourPopup.cpp \
          ../controls.extend/propgrid/colorpicker/SColorPicker.cpp \
          ../controls.extend/sfadeframe.cpp \
          ../controls.extend/sradiobox2.cpp \
          ../controls.extend/SChromeTabCtrl.cpp \
          ../controls.extend/siectrl.cpp \
          ../controls.extend/SDocHostUIHandler.cpp \
          ../controls.extend/schatedit.cpp \
          ../controls.extend/reole/richeditole.cpp \
          ../controls.extend/reole/dataobject.cpp \
          ../controls.extend/sscrolltext.cpp \
          ../controls.extend/scalendar2.cpp \
          ../controls.extend/slistctrlex.cpp \
          ../controls.extend/simagemaskwnd.cpp \
          ../controls.extend/SRatingBar.cpp \
          ../controls.extend/SFreeMoveWindow.cpp \
          ../controls.extend/tipwnd.cpp \
          ../controls.extend/sprogressring.cpp \
          ../controls.extend/saniwindow.cpp \
          ../controls.extend/sgrouplist.cpp \
          magnet/magnetframe.cpp \
          smatrixwindow.cpp \ 
          sroundimage.cpp \          
          threadObject.cpp \
          SmileyCreateHook.cpp \
          uianimation/uianimationwnd.cpp \
          appledock/sdesktopdock.cpp \
          clock/sclock.cpp \
          skin/SDemoSkin.cpp \
          skin/SetSkinWnd2.cpp \
          skin/SSkinLoader.cpp \
          trayicon/SShellNotifyIcon.cpp \
          trayicon/SShellNofityHwnd2.cpp \
          SInterpolatorView.cpp \
          qrcode/SQrCtrl.cpp \
          qrcode/QR_Encode.cpp \
          SPathView.cpp \
          SCheckBox2.cpp \

RC_FILE += demo.rc

RC_INCLUDEPATH += ..\soui-sys-resource
