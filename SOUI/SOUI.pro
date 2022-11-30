######################################################################
# Automatically generated by qmake (3.0) ?? 5? 7 17:15:06 2020
######################################################################

TEMPLATE = lib
TARGET = soui4
CONFIG(x64){
TARGET = $$TARGET"64"
}
!LIB_ALL:!LIB_CORE{
    DEFINES += SOUI_EXPORTS
	RC_FILE += soui.rc
	CONFIG += dll
}
else{
    CONFIG += staticlib
}

dir = ..
include($$dir/common.pri)

CONFIG(debug,debug|release){
	LIBS += utilities4d.lib
}
else{
	LIBS += utilities4.lib
}

PRECOMPILED_HEADER = include/souistd.h

DEPENDPATH += . \
              include \

INCLUDEPATH += . \
              include \
              ../utilities/include \


# Input
HEADERS += include/SApp.h \
           include/SouiFactory.h \
           include/soui-version.h \
           include/soui_exp.h \
           include/stdint.h \
           include/interface/sacchelper-i.h \
           include/interface/saccproxy-i.h \
           include/interface/SAdapter-i.h \
           include/interface/SAnimation-i.h \
           include/interface/SAttrStorage-i.h \
           include/interface/scaret-i.h \
           include/interface/SHostMsgHandler-i.h \
           include/interface/SImgDecoder-i.h \
           include/interface/sinterpolator-i.h \
           include/interface/sipcobj-i.h \
           include/interface/slayout-i.h \
           include/interface/SListViewItemLocator-i.h \
           include/interface/STreeViewItemLocator-i.h \
           include/interface/STileViewItemLocator-i.h \
           include/interface/slog-i.h \
           include/interface/SobjectApi.h \
           include/interface/sobject-i.h \
           include/interface/SPathEffect-i.h \
           include/interface/SRender-i.h \
           include/interface/SResProvider-i.h \
           include/interface/SScriptModule-i.h \
           include/interface/SSkinobj-i.h \
           include/interface/STaskLoop-i.h \
           include/interface/STimelineHandler-i.h \
           include/interface/stooltip-i.h \
           include/interface/STranslator-i.h \
           include/interface/SValueAnimator-i.h \
           include/interface/SRealWndHandler-i.h \
           include/interface/SAccelerator-i.h \
           include/interface/SEvtArgs-i.h \
           include/interface/shostwnd-i.h \
           include/interface/sapp-i.h \
           include/interface/smsgloop-i.h \
           include/interface/SResProviderMgr-i.h \
           include/interface/SWindow-i.h \
           include/interface/SWndContainer-i.h \
           include/interface/SCtrl-i.h \
           include/interface/SMatrix-i.h \
           include/interface/STransform-i.h \
           include/interface/SFactory-i.h \
           include/interface/SNativeWnd-i.h \
           include/interface/SNcPainter-i.h \
           include/interface/smenu-i.h \
           include/interface/smenuex-i.h \
           include/interface/stimer-i.h \
           include/interface/SMessageBox-i.h \
           include/interface/SNotifyCenter-i.h \
           include/interface/SObjFactory-i.h \
           include/interface/SHostPresenter-i.h \
           include/interface/SHttpClient-i.h \
           include/proxy/SNativeWndProxy.h \
           include/proxy/SHostWndProxy.h \
           include/proxy/SPanelProxy.h \
           include/proxy/SWindowProxy.h \
           include/proxy/SCtrlProxy.h \
           include/activex/SBStr.h \
           include/animation/SAlphaAnimation.h \
           include/animation/SAnimation.h \
           include/animation/SAnimationSet.h \
           include/animation/ScaleAnimation.h \
           include/animation/SInterpolatorImpl.h \
           include/animation/SRotateAnimation.h \
           include/animation/STransformation.h \
           include/animation/STranslateAnimation.h \
           include/control/SActiveX.h \
           include/control/SCalendar.h \
           include/control/SCaption.h \
           include/control/SCmnCtrl.h \
           include/control/SComboBase.h \
           include/control/SComboBox.h \
           include/control/SComboView.h \
           include/control/SDateTimePicker.h \
           include/control/SDropDown.h \
           include/control/SHeaderCtrl.h \
           include/control/SHotKeyCtrl.h \
           include/control/SListbox.h \
           include/control/SListCtrl.h \
           include/control/SListView.h \
           include/control/SMCListView.h \
           include/control/SMenuBar.h \
           include/control/SMessageBox.h \
           include/control/SouiCtrls.h \
           include/control/SRealWnd.h \
           include/control/SRichEdit.h \
           include/control/SScrollbar.h \
           include/control/SSliderBar.h \
           include/control/SSpinButtonCtrl.h \
           include/control/SSplitWnd.h \
           include/control/STabCtrl.h \
           include/control/STileView.h \
           include/control/STree.h \
           include/control/STreeCtrl.h \
           include/control/STreeView.h \
           include/core/SAccelerator.h \
           include/core/SCaret.h \
           include/core/SDefine.h \
           include/core/SDropTargetDispatcher.h \
           include/core/SFocusManager.h \
           include/core/SHostDialog.h \
           include/core/SHostMsgDef.h \
           include/core/SHostWnd.h \
           include/core/SItemPanel.h \
           include/core/SMsgLoop.h \
           include/core/SNativeWnd.h \
           include/core/SObjectFactory.h \
           include/core/SPanel.h \
           include/core/SScrollBarHandler.h \
           include/core/SSingleton.h \
           include/core/SSingleton2.h \
           include/core/SCmnMap.h \
           include/core/SSingletonMap.h \
           include/core/SSkin.h \
           include/core/SSkinObjBase.h \
           include/core/STimerlineHandlerMgr.h \
           include/core/SWindowMgr.h \
           include/core/SWnd.h \
           include/core/SWndAccessible.h \
           include/core/SWndContainer-i.h \
           include/core/SWndContainerImpl.h \
           include/core/SWndStyle.h \
           include/core/SNcPainter.h \
           include/core/SHostPresenter.h \
           include/event/SEventCrack.h \
           include/event/SEvents.h \
           include/event/SEventSet.h \
           include/event/SEventSlot.h \
           include/event/SNotifyCenter.h \
           include/helper/SAdapterBase.h \
           include/helper/SAppDir.h \
           include/helper/SAssertFmt.h \
           include/helper/SAttrCracker.h \
           include/helper/SColor.h \
           include/helper/SDIBHelper.h \
           include/helper/SDpiHelper.hpp \
           include/helper/SDpiScale.h \
           include/helper/SDragWnd.h \
           include/helper/SFunctor.hpp \
           include/helper/SHostMgr.h \
           include/helper/SIpcParamHelper.hpp \
           include/helper/SListViewItemLocator.h \
           include/helper/slog.h \
           include/helper/SMemDC.h \
           include/helper/SMenu.h \
           include/helper/SMenuEx.h \
           include/helper/SMenuWndHook.h \
           include/helper/SplitString.h \
           include/helper/SResID.h \
           include/helper/STimer.h \
           include/helper/STimerGenerator.h \
           include/helper/STaskHandler.h \
           include/helper/STileViewItemLocator.h \
           include/helper/STime.h \
           include/helper/SToolTip.h \
           include/helper/SUnknown.h \
           include/helper/SwndFinder.h \
           include/helper/SwndMsgCracker.h \
           include/helper/swndspy.h \
           include/layout/SGridLayout.h \
           include/layout/SGridLayoutParamStruct.h \
           include/layout/SLayoutSize.h \
           include/layout/SLinearLayout.h \
           include/layout/SLinearLayoutParamStruct.h \
           include/layout/SouiLayout.h \
           include/layout/SouiLayoutParamStruct.h \
           include/matrix/SCamera.h \
           include/matrix/SFloat.h \
           include/matrix/SFloatBits.h \
           include/matrix/SMatrix.h \
           include/matrix/SPoint.h \
           include/matrix/SRect.h \
           include/msaa/SAccProxyCmnCtrl.h \
           include/msaa/SAccProxyWindow.h \
           include/res.mgr/SDpiAwareFont.h \
           include/res.mgr/SFontInfo.h \
           include/res.mgr/SFontPool.h \
           include/res.mgr/SNamedValue.h \
           include/res.mgr/SObjDefAttr.h \
           include/res.mgr/SResProvider.h \
           include/res.mgr/SResProviderMgr.h \
           include/res.mgr/SSkinPool.h \
           include/res.mgr/SStylePool.h \
           include/res.mgr/SUiDef.h \
           include/sobject/Sobject.hpp \
           include/unknown/obj-ref-i.h \
           include/unknown/obj-ref-impl.hpp \
           include/valueAnimator/SValueAnimator.h \
           include/valueAnimator/TypeEvaluator.h \
           src/activex/SAxContainer.h \
           src/activex/SAxUtil.h \
           src/updatelayeredwindow/SUpdateLayeredWindow.h \

SOURCES += src/SApp.cpp \
           src/SouiFactory.cpp \
           src/activex/SAxContainer.cpp \
           src/activex/SBStr.cpp \
           src/animation/SAlphaAnimation.cpp \
           src/animation/SAnimation.cpp \
           src/animation/SAnimationSet.cpp \
           src/animation/ScaleAnimation.cpp \
           src/animation/SInterpolatorImpl.cpp \
           src/animation/SRotateAnimation.cpp \
           src/animation/STransformation.cpp \
           src/animation/STranslateAnimation.cpp \
           src/control/SActiveX.cpp \
           src/control/SCalendar.cpp \
           src/control/SCaption.cpp \
           src/control/SCmnCtrl.cpp \
           src/control/SComboBase.cpp \
           src/control/SComboBox.cpp \
           src/control/SComboView.cpp \
           src/control/SDateTimePicker.cpp \
           src/control/SDropDown.cpp \
           src/control/SHeaderCtrl.cpp \
           src/control/SHotKeyCtrl.cpp \
           src/control/SListbox.cpp \
           src/control/SListCtrl.cpp \
           src/control/SListView.cpp \
           src/control/SMCListView.cpp \
           src/control/SMenuBar.cpp \
           src/control/SMessageBox.cpp \
           src/control/SRealWnd.cpp \
           src/control/SRichEdit.cpp \
           src/control/SScrollbar.cpp \
           src/control/SSliderBar.cpp \
           src/control/SSpinButtonCtrl.cpp \
           src/control/SSplitWnd.cpp \
           src/control/STabCtrl.cpp \
           src/control/STileView.cpp \
           src/control/STreeCtrl.cpp \
           src/control/STreeView.cpp \
           src/core/SAccelerator.cpp \
           src/core/SCaret.cpp \
           src/core/SDropTargetDispatcher.cpp \
           src/core/SFocusManager.cpp \
           src/core/SHostDialog.cpp \
           src/core/shostwnd.cpp \
           src/core/SItemPanel.cpp \
           src/core/SMsgLoop.cpp \
           src/core/SNativeWnd.cpp \
           src/core/SObjectFactory.cpp \
           src/core/SPanel.cpp \
           src/core/SScrollBarHandler.cpp \
           src/core/SSkin.cpp \
           src/core/SSkinObjBase.cpp \
           src/core/STimerlineHandlerMgr.cpp \
           src/core/SWindowMgr.cpp \
           src/core/Swnd.cpp \
           src/core/SwndAccessible.cpp \
           src/core/SwndContainerImpl.cpp \
           src/core/SwndStyle.cpp \
           src/core/SNcPainter.cpp \
           src/core/SHostPresenter.cpp \
           src/event/SEventSet.cpp \
           src/event/SNotifyCenter.cpp \
           src/helper/SAppDir.cpp \
           src/helper/SDIBHelper.cpp \
           src/helper/SDpiScale.cpp \
           src/helper/SDragWnd.cpp \
           src/helper/SHostMgr.cpp \
           src/helper/SListViewItemLocator.cpp \
           src/helper/SMemDC.cpp \
           src/helper/slog.cpp \
           src/helper/SMenu.cpp \
           src/helper/SMenuEx.cpp \
           src/helper/SMenuWndHook.cpp \
           src/helper/STimer.cpp \
           src/helper/STimerGenerator.cpp \
           src/helper/STaskHandler.cpp \
           src/helper/STileViewItemLocator.cpp \
           src/helper/stime.cpp \
           src/helper/SToolTip.cpp \
           src/helper/SwndFinder.cpp \
           src/layout/SGridLayout.cpp \
           src/layout/SLayoutSize.cpp \
           src/layout/SLinearLayout.cpp \
           src/layout/SouiLayout.cpp \
           src/matrix/SCamera.cpp \
           src/matrix/SMatrix.cpp \
           src/matrix/SPoint.cpp \
           src/matrix/SRect.cpp \
           src/msaa/SAccProxyCmnCtrl.cpp \
           src/msaa/SAccProxyWindow.cpp \
           src/res.mgr/SDpiAwareFont.cpp \
           src/res.mgr/SFontPool.cpp \
           src/res.mgr/SNamedValue.cpp \
           src/res.mgr/SObjDefAttr.cpp \
           src/res.mgr/SResProvider.cpp \
           src/res.mgr/SResProviderMgr.cpp \
           src/res.mgr/SSkinPool.cpp \
           src/res.mgr/SStylePool.cpp \
           src/res.mgr/SUiDef.cpp \
           src/updatelayeredwindow/SUpdateLayeredWindow.cpp \
           src/valueAnimator/SValueAnimator.cpp
