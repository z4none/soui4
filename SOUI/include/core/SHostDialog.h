﻿/**
* Copyright (C) 2014-2050 
* All rights reserved.
* 
* @file       SHostDialog.h
* @brief      
* @version    v1.0      
* @author     SOUI group   
* @date       2014/08/02
* 
* Describe    SOUI的Dialog模块
*/

#pragma once

#include "shostwnd.h"
#include "smsgloop.h"

namespace SOUI
{
    class SOUI_EXP SHostDialog : public SHostWnd, public IHostDialog
    {
    public:
        SHostDialog(LPCTSTR pszXmlName = NULL);
        ~SHostDialog(void);
        
	public:
		STDMETHOD_(INT_PTR,DoModal)(THIS_ HWND hParent=NULL) OVERRIDE;
		STDMETHOD_(void,EndDialog)(THIS_ INT_PTR nResult) OVERRIDE;
		STDMETHOD_(IHostWnd*,GetHostWnd)(THIS) OVERRIDE;
		//!添加引用
		/*!
		*/
		STDMETHOD_(long,AddRef) (THIS) OVERRIDE
		{
			return SHostWnd::AddRef();
		}

		//!释放引用
		/*!
		*/
		STDMETHOD_(long,Release) (THIS) OVERRIDE
		{
			return SHostWnd::Release();
		}

		//!释放对象
		/*!
		*/
		STDMETHOD_(void,OnFinalRelease) (THIS) OVERRIDE
		{
			delete this;
		}

    protected:
        void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
        void OnOK();
        void OnCancel();
        STDMETHOD_(IMessageLoop *,GetMsgLoop)(){return m_MsgLoop;}
        
        EVENT_MAP_BEGIN()
            EVENT_ID_COMMAND(IDOK,OnOK)
            EVENT_ID_COMMAND(IDCANCEL,OnCancel)
        EVENT_MAP_END()

        BEGIN_MSG_MAP_EX(SHostDialog)
            MSG_WM_CLOSE(OnCancel)
            MSG_WM_KEYDOWN(OnKeyDown)
            CHAIN_MSG_MAP(SHostWnd)
            REFLECT_NOTIFICATIONS_EX()
        END_MSG_MAP()

        INT_PTR m_nRetCode;
        
        SAutoRefPtr<IMessageLoop> m_MsgLoop;
    };

	EXTERN_C HRESULT CreateHostDialog(LPCTSTR pszResID,IHostDialog ** ppRet);

}
