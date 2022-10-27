// dui-demo.cpp : main source file
//

#include "stdafx.h"
#include "MainDlg.h"
//从PE文件加载，注意从文件加载路径位置
#define RES_TYPE [!output ResLoaderType]
//#define SYSRES_TYPE [!output ResLoaderType]
// #define RES_TYPE 0   //PE
// #define RES_TYPE 1   //ZIP
// #define RES_TYPE 2   //7z
// #define RES_TYPE 2   //文件
//去掉多项支持，以免代码显得混乱
#if (RES_TYPE==1)
#include "resprovider-zip\zipresprovider-param.h"
#else 
#if (RES_TYPE==2)
#include "resprovider-7zip\zip7resprovider-param.h"
#endif
#endif
#ifdef _DEBUG
#define SYS_NAMED_RESOURCE _T("soui-sys-resourced.dll")
#else
#define SYS_NAMED_RESOURCE _T("soui-sys-resource.dll")
#endif
[!if CHECKBOX_USE_LUA]
#ifdef _DEBUG
#pragma comment(lib,"lua-53d")
#pragma comment(lib,"scriptmodule-luad")
#else
#pragma comment(lib,"lua-53")
#pragma comment(lib,"scriptmodule-lua")
#endif
[!endif]

#define INIT_R_DATA
#include "res/resource.h"

using namespace SOUI;


class SOUIEngine
{
private:
	SComMgr m_ComMgr;
	SApplication *m_theApp;
	SouiFactory m_souiFac;
public:
	SOUIEngine():m_theApp(NULL){}
		
	BOOL Init(HINSTANCE hInstance){
		SAutoRefPtr<IRenderFactory> pRenderFactory;
		BOOL bLoaded = TRUE;
		do{
[!if RADIO_RANDER_GDI]
		//使用GDI渲染界面
		bLoaded = m_ComMgr.CreateRender_GDI((IObjRef * *)& pRenderFactory);
[!else]
		//使用SKIA渲染界面
		bLoaded = m_ComMgr.CreateRender_Skia((IObjRef * *)& pRenderFactory);
[!endif]
		SASSERT_FMT(bLoaded, _T("load interface [render] failed!"));
		if(!bLoaded) break;
		//设置图像解码引擎。默认为GDIP。基本主流图片都能解码。系统自带，无需其它库
		SAutoRefPtr<IImgDecoderFactory> pImgDecoderFactory;
		bLoaded = m_ComMgr.CreateImgDecoder((IObjRef * *)& pImgDecoderFactory);
		SASSERT_FMT(bLoaded, _T("load interface [%s] failed!"), _T("imgdecoder"));
		if(!bLoaded) break;

		pRenderFactory->SetImgDecoderFactory(pImgDecoderFactory);
		m_theApp = new SApplication(pRenderFactory, hInstance);	
		}while(false);
		return bLoaded;
	};
	//加载系统资源
	BOOL LoadSystemRes()
	{
		BOOL bLoaded = TRUE;
		do{
[!if CHECKBOX_SYSRES_BUILTIN]
[!if CHECKBOX_RES_PACK_ONLAY_RELEASE]
#ifdef _DEBUG
		//选择了仅在Release版本打包资源则系统资源在DEBUG下始终使用DLL加载
		{
			HMODULE hModSysResource = LoadLibrary(SYS_NAMED_RESOURCE);
			if (hModSysResource)
			{
				SAutoRefPtr<IResProvider> sysResProvider;
				sysResProvider.Attach(m_souiFac.CreateResProvider(RES_PE));
				sysResProvider->Init((WPARAM)hModSysResource, 0);
                bLoaded = (0 == m_theApp->LoadSystemNamedResource(sysResProvider));
				FreeLibrary(hModSysResource);				
			}
			else
			{
				bLoaded = FALSE;
			}
			SASSERT(bLoaded);
			if(!bLoaded) break;
		}
#else
		//钩选了复制系统资源选项
		{
			SAutoRefPtr<IResProvider> pSysResProvider;
[!if ResLoaderType == 0]
			pSysResProvider.Attach(m_souiFac.CreateResProvider(RES_PE));
			bLoaded = pSysResProvider->Init((WPARAM)m_theApp->GetModule(), 0);
			SASSERT(bLoaded);
			m_theApp->LoadSystemNamedResource(pSysResProvider);
			if(!bLoaded) break;
[!endif]
[!if ResLoaderType == 1]
			bLoaded = m_ComMgr.CreateResProvider_ZIP((IObjRef * *)& pSysResProvider);
			SASSERT_FMT(bLoaded, _T("load interface [%s] failed!"), _T("resprovider_zip"));
			ZIPRES_PARAM param;
			param.ZipFile(m_theApp->GetRenderFactory(), _T("uires.zip"), "[!output ZIP_PSW]",_T("theme_sys_res"));
			bLoaded = pSysResProvider->Init((WPARAM)& param, 0);
			SASSERT(bLoaded);
			m_theApp->LoadSystemNamedResource(pSysResProvider);
			if(!bLoaded) break;
[!endif]
[!if ResLoaderType == 2]
			bLoaded = m_ComMgr.CreateResProvider_7ZIP((IObjRef * *)& pSysResProvider);
			SASSERT_FMT(bLoaded, _T("load interface [%s] failed!"), _T("resprovider_zip"));
			ZIP7RES_PARAM param;
			param.ZipFile(m_theApp->GetRenderFactory(), _T("uires.7z"), "[!output ZIP_PSW]", _T("theme_sys_res"));
			bLoaded = pSysResProvider->Init((WPARAM)& param, 0);
			SASSERT(bLoaded);
			m_theApp->LoadSystemNamedResource(pSysResProvider);
			if(!bLoaded) break;
[!endif]
[!if ResLoaderType == 3]
			pSysResProvider.Attach(m_souiFac.CreateResProvider(RES_FILE));
			bLoaded = pSysResProvider->Init((LPARAM)_T("uires\\theme_sys_res"), 0);
			SASSERT(bLoaded);
			m_theApp->LoadSystemNamedResource(pSysResProvider);
			if(!bLoaded) break;
[!endif]
		}
#endif
[!endif]
[!else]
		//从DLL加载系统资源
		{
			HMODULE hModSysResource = LoadLibrary(SYS_NAMED_RESOURCE);
			if (hModSysResource)
			{
				SAutoRefPtr<IResProvider> sysResProvider;
				sysResProvider.Attach(m_souiFac.CreateResProvider(RES_PE));
				sysResProvider->Init((WPARAM)hModSysResource, 0);
				m_theApp->LoadSystemNamedResource(sysResProvider);
				FreeLibrary(hModSysResource);
			}
			else
			{
				bLoaded = FALSE;
			}
			SASSERT(bLoaded);
			if(!bLoaded) break;
		}
[!endif]
		}while(false);
		return bLoaded;
	}
	//加载用户资源
	BOOL LoadUserRes()
	{
		SAutoRefPtr<IResProvider>   pResProvider;
		BOOL bLoaded = FALSE;
		do{
[!if CHECKBOX_RES_PACK_ONLAY_RELEASE]
[!if ResLoaderType != 3]
#ifdef _DEBUG		
		//选择了仅在Release版本打包资源则在DEBUG下始终使用文件加载
		{
			pResProvider.Attach(m_souiFac.CreateResProvider(RES_FILE));
			bLoaded = pResProvider->Init((LPARAM)_T("uires"), 0);
			SASSERT(bLoaded);
			if(!bLoaded) break;
		}
#else
[!endif]
		{
[!if ResLoaderType == 0]
			pResProvider.Attach(m_souiFac.CreateResProvider(RES_PE));
			bLoaded = pResProvider->Init((WPARAM)m_theApp->GetModule(), 0);
			SASSERT(bLoaded);
			if(!bLoaded) break;
[!endif]
[!if ResLoaderType == 1]
			bLoaded = m_ComMgr.CreateResProvider_ZIP((IObjRef * *)& pResProvider);
			SASSERT_FMT(bLoaded, _T("load interface [%s] failed!"), _T("resprovider_zip"));
			ZIPRES_PARAM param;
			param.ZipFile(m_theApp->GetRenderFactory(), _T("uires.zip"), "[!output ZIP_PSW]");
			bLoaded = pResProvider->Init((WPARAM)& param, 0);
			SASSERT(bLoaded);
			if(!bLoaded) break;
[!endif]
[!if ResLoaderType == 2]
			bLoaded = m_ComMgr.CreateResProvider_7ZIP((IObjRef * *)& pResProvider);
			SASSERT_FMT(bLoaded, _T("load interface [%s] failed!"), _T("resprovider_zip"));
			ZIP7RES_PARAM param;
			param.ZipFile(m_theApp->GetRenderFactory(), _T("uires.7z"), "[!output ZIP_PSW]");
			bLoaded = pResProvider->Init((WPARAM)& param, 0);
			SASSERT(bLoaded);
			if(!bLoaded) break;
[!endif]
[!if ResLoaderType == 3]
			pResProvider.Attach(m_souiFac.CreateResProvider(RES_FILE));
			bLoaded = pResProvider->Init((LPARAM)_T("uires"), 0);
			SASSERT(bLoaded);
			if(!bLoaded) break;
[!endif]
		}
[!if ResLoaderType != 3]
#endif
[!endif]
[!endif]
			//如果需要在代码中使用R::id::namedid这种方式来使用控件必须要这一行代码：2016年2月2日，R::id,R.name是由uiresbuilder 增加-h .\res\resource.h 这2个参数后生成的。
			m_theApp->InitXmlNamedID((const LPCWSTR*)&R.name,(const int*)&R.id,sizeof(R.id)/sizeof(int));
			m_theApp->AddResProvider(pResProvider);
		}while(false);
		return bLoaded;
	}
	//加载LUA支持
	BOOL LoadLUAModule()
	{
		BOOL bLoaded =FALSE;
		SAutoRefPtr<IScriptFactory> pScriptLuaFactory;
		bLoaded = m_ComMgr.CreateScrpit_Lua((IObjRef * *)& pScriptLuaFactory);
		SASSERT_FMT(bLoaded, _T("load interface [%s] failed!"), _T("scirpt_lua"));
		m_theApp->SetScriptFactory(pScriptLuaFactory);
		return bLoaded;
	}
	//加载多语言支持
	BOOL LoadMultiLangsModule()
	{
		BOOL bLoaded = FALSE;
		SAutoRefPtr<ITranslatorMgr> trans;
		bLoaded = m_ComMgr.CreateTranslator((IObjRef * *)& trans);
		SASSERT_FMT(bLoaded, _T("load interface [%s] failed!"), _T("translator"));
		if (trans)
		{//加载语言翻译包
			m_theApp->SetTranslator(trans);
			SXmlDoc xmlLang;
			if (m_theApp->LoadXmlDocment(xmlLang,  _T("translator:lang_cn")))
			{
				SAutoRefPtr<ITranslator> langCN;
				trans->CreateTranslator(&langCN);
				langCN->Load(&xmlLang.root().child(L"language"), 1);//1=LD_XML
				trans->InstallTranslator(langCN);
			}
		}
		return bLoaded;
	}
	//注册用户自定义皮肤和控件
	void Regitercustom()
	{
[!if CHECKBOX_SHELLNOTIFYICON]
		m_theApp->RegisterWindowClass<SShellTray>();
[!endif]
	}

	~SOUIEngine()
	{
		if (m_theApp)
		{
			delete m_theApp;
			m_theApp = NULL;
		}
	}

	SApplication* GetApp()
	{
		return m_theApp;
	}
};
//debug时方便调试设置当前目录以便从文件加载资源
void SetDefaultDir()
{
	TCHAR szCurrentDir[MAX_PATH] = { 0 };
	GetModuleFileName(NULL, szCurrentDir, sizeof(szCurrentDir));

	LPTSTR lpInsertPos = _tcsrchr(szCurrentDir, _T('\\'));
#ifdef _DEBUG
	_tcscpy(lpInsertPos + 1, _T("..\\[!output PROJECT_NAME]"));
#else
	_tcscpy(lpInsertPos + 1, _T("\0"));
#endif
	SetCurrentDirectory(szCurrentDir);
}

int WINAPI _tWinMain(HINSTANCE hInstance, HINSTANCE /*hPrevInstance*/, LPTSTR lpstrCmdLine, int /*nCmdShow*/)
{
	HRESULT hRes = OleInitialize(NULL);
	SASSERT(SUCCEEDED(hRes));
	SetDefaultDir();
	int nRet = 0;
	{
		SOUIEngine souiEngine;
		if (souiEngine.Init(hInstance))
		{
			//加载系统资源
			souiEngine.LoadSystemRes();
			//注册用户自定义皮肤/控件/布局/其它自定义
			souiEngine.Regitercustom();
			//加载用户资源
			souiEngine.LoadUserRes();
[!if CHECKBOX_USE_LUA]
			//加载LUA脚本支持
			souiEngine.LoadLUAModule();
[!endif]
[!if CHECKBOX_TRANSLATOR_SUPPORT]
			//加载多语言翻译模块。
			souiEngine.LoadMultiLangsModule();
[!endif]
			CMainDlg dlgMain;
			dlgMain.Create(GetActiveWindow());
			dlgMain.SendMessage(WM_INITDIALOG);
			dlgMain.CenterWindow(dlgMain.m_hWnd);
[!if CHECKBOX_MAXIMIZED]
			dlgMain.ShowWindow(SW_SHOWMAXIMIZED);
[!else]
			dlgMain.ShowWindow(SW_SHOWNORMAL);
[!endif]
			nRet = souiEngine.GetApp()->Run(dlgMain.m_hWnd);
		}
		else
		{
			MessageBox(NULL, _T("无法正常初使化SOUI"), _T("错误"), MB_OK | MB_ICONERROR);
		}
	}
	OleUninitialize();
	return nRet;
}
