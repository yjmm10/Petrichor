---
title: windows编程命令
tags:
  - Windows API
comments: ture
date: 2019-10-31 16:16:05
categories: Windows
---

# 指令

## 常用类型

```c++   
CHAR  = char //8位字符
WCHAR = wchar_t //16位字符
DWORD = unsigned long

TCHAR = WCHAR
TBYTE = WCHAR


//8位指针
PCHAR = *CHAR   //P = POINT指针
PSTR  = *CHAR   
PTBYTE = *CHAR
PCSTR = CONST CHAR* //C =CONST常量

//16位指针
PTSTR   = *WCHAR;
PWCHAR  = *WCHAR   //P = POINT指针
PWSTR   = *WCHAR   
PCWSTR  = CONST WCHAR* //C =CONST常量

//封装后
_tcslen 返回Unicode长度
```
<details>
<summary>更多常见</summary>

```c++ 

typedef char CHAR;   
typedef short SHORT;
typedef long LONG;
typedef int INT;

typedef WCHAR *PWCHAR, *LPWCH, *PWCH;
typedef CONST WCHAR *LPCWCH, *PCWCH;

typedef _Null_terminated_ WCHAR *NWPSTR, *LPWSTR, *PWSTR;
typedef _Null_terminated_ PWSTR *PZPWSTR;
typedef _Null_terminated_ CONST PWSTR *PCZPWSTR;
typedef _Null_terminated_ WCHAR UNALIGNED *LPUWSTR, *PUWSTR;
typedef _Null_terminated_ CONST WCHAR *LPCWSTR, *PCWSTR;
typedef _Null_terminated_ PCWSTR *PZPCWSTR;
typedef _Null_terminated_ CONST PCWSTR *PCZPCWSTR;
typedef _Null_terminated_ CONST WCHAR UNALIGNED *LPCUWSTR, *PCUWSTR;

typedef _NullNull_terminated_ WCHAR *PZZWSTR;
typedef _NullNull_terminated_ CONST WCHAR *PCZZWSTR;
typedef _NullNull_terminated_ WCHAR UNALIGNED *PUZZWSTR;
typedef _NullNull_terminated_ CONST WCHAR UNALIGNED *PCUZZWSTR;

typedef  WCHAR *PNZWCH;
typedef  CONST WCHAR *PCNZWCH;
typedef  WCHAR UNALIGNED *PUNZWCH;
typedef  CONST WCHAR UNALIGNED *PCUNZWCH;

typedef CONST WCHAR *LPCWCHAR, *PCWCHAR;
typedef CONST WCHAR UNALIGNED *LPCUWCHAR, *PCUWCHAR;

typedef unsigned long UCSCHAR;

typedef UCSCHAR *PUCSCHAR;
typedef const UCSCHAR *PCUCSCHAR;

typedef UCSCHAR *PUCSSTR;
typedef UCSCHAR UNALIGNED *PUUCSSTR;

typedef const UCSCHAR *PCUCSSTR;
typedef const UCSCHAR UNALIGNED *PCUUCSSTR;

typedef UCSCHAR UNALIGNED *PUUCSCHAR;
typedef const UCSCHAR UNALIGNED *PCUUCSCHAR;
```

</details>


## 小细节
> - typedef **__nullterminated** WCHAR *NWPSTR, *LPWSTR, *PWSTR;   
    **__nullterminated：** 头部注释。 更多信息，查阅[Header Annotations](http://msdn2.microsoft.com/En-US/library/aa383701.aspx)   
> -  尽量用Unicode开发，效率高，ANSI的慢慢弱化
> - dll开发，尽量有ANSI版本（函数带A）以及Unicode版本（函数带W）

> - 将文本字符串当作是字符数组
> - 用TCHAR/PTSTR表示字符，字符串
> - 用BYTE/PBYTE表示字节、字节指针、数据缓冲区
> - TEXT/_T表示常量字符和字符串
> - 缓冲区大小_countof(szBuffer)代替sizeof(szBuffer)
> - 内存以字节分配，malloc(nCharacters * sizeof(TCHAR))  
>  **易错**：用宏定义避免-> #define chmalloc(nCharacters) (TCHAR*)malloc(nCharacters * sizeof(TCHAR))
> - 利用 `in`和`out` 识别输入输出参数，具体参考定义




 ## 文件处理函数
 
 - CreateFileMapping：创建一个文件映射内核对象   
  
    ```c++
    HANDLE CreateFileMapping(
    HANDLE hFile,                       //物理文件句柄
    LPSECURITY_ATTRIBUTES lpAttributes, //安全设置
    DWORD flProtect,                    //保护设置
    DWORD dwMaximumSizeHigh,            //高位文件大小
    DWORD dwMaximumSizeLow,             //低位文件大小
    LPCTSTR lpName                      //共享内存名称
    );
    ```

- MapViewOfFile: 映射到当前进程的虚拟地址上
  
    ```c++
    LPVOID MapViewOfFile(
    HANDLE hFileMappingObject,  // file-mapping object to map into 
                                // address space
    DWORD dwDesiredAccess,      // access mode
    DWORD dwFileOffsetHigh,     // high-order 32 bits of file offset
    DWORD dwFileOffsetLow,      // low-order 32 bits of file offset
    DWORD dwNumberOfBytesToMap  // number of bytes to map
    );
    ```

- GetModuleFileName:获取当前进程已加载模块的文件的完整路径，该模块必须由当前进程加载。
  
    ```c++
    DWORD WINAPI GetModuleFileName(
        _In_opt_  HMODULE hModule,   //应用程序或DLL实例句柄,NULL则为获取当前程序可执行文件路径名
        _Out_     LPTSTR lpFilename, //接收路径的字符串缓冲区
        _In_      DWORD nSize);        //接收路径的字符缓冲区的大小
    ```

- GetCurrentProcessId:获取当前进程id
    ```
    GetCurrentProcessId();
    ```

----------------------
- **dllhook相关函数**

- GetModuleHandleA: 获取应用程序或dll的模块句柄
    ```c++
    HMODULE WINAPI GetModuleHandle(
    _In_opt_LPCTSTR lpModuleName    //模块名称
    );
    ```
- GetProcAddress: 检索指定的动态链接库(DLL)中的输出库函数地址
    ```c++
    FARPROC GetProcAddress(
    HMODULE hModule, // DLL模块句柄
    LPCSTR lpProcName // 函数名
    );
    ```
--------------------------

- InitializeCriticalSection: 初始化临界资源对象
    ```c++
    VOID InitializeCriticalSection(
    LPCRITICAL_SECTION lpCriticalSection // 临界资源对象指针
    );
    ```
- GetSystemDirectory: 获取系统完整目录
    ```c++
    UINT WINAPI GetSystemDirectory(
    __out LPTSTR lpBuffer,  //路径缓冲区
    __in UINT uSize         //缓冲区大小
    );
    ```
  
## 章节学习
### 文件系统
**2. 磁盘和驱动器管理**
- 遍历卷并获取属性API
  - 获取主机所有逻辑驱动器
    ```c++ 
    GetLogicalDriveStrings(
        _In_ DWORD nBufferLength,//内存大小
        _Out_writes_to_opt_(nBufferLength,return + 1) LPWSTR lpBuffer //内存空间
        );//返回路径字符串
    ```
  - 获取驱动器类型
    ```c++
    WINBASEAPI
    UINT
    WINAPI
    GetDriveTypeW(
        _In_opt_ LPCWSTR lpRootPathName//驱动器根路径“c:\”
        );//驱动器类型
    ```
  - 获取逻辑驱动器信息
    ```c++
    WINBASEAPI
    BOOL
    WINAPI
    GetVolumeInformation(
        _In_opt_ LPCWSTR lpRootPathName,//索要获取驱动器根路径
        _Out_writes_opt_(nVolumeNameSize) LPWSTR lpVolumeNameBuffer,//驱动器名
        _In_ DWORD nVolumeNameSize,//缓冲区大小
        _Out_opt_ LPDWORD lpVolumeSerialNumber,//驱动器序列号
        _Out_opt_ LPDWORD lpMaximumComponentLength,//文件名最大长度
        _Out_opt_ LPDWORD lpFileSystemFlags,//驱动器属性，用于判断
        _Out_writes_opt_(nFileSystemNameSize) LPWSTR lpFileSystemNameBuffer,//文件系统类型缓冲区
        _In_ DWORD nFileSystemNameSize//文件系统类型大小
        );//是否获取成功
    ```
  - 查找主机第一个逻辑驱动器
    ```c++
    WINBASEAPI
    HANDLE
    WINAPI
    FindFirstVolume(
        _Out_writes_(cchBufferLength) LPWSTR lpszVolumeName,
        _In_ DWORD cchBufferLength
        );//查找句柄
    ```
  - 查找主机后继逻辑驱动器
    ```c++ 
    WINBASEAPI
    BOOL
    WINAPI
    FindNextVolume(
        _Inout_ HANDLE hFindVolume, //查找句柄
        _Out_writes_(cchBufferLength) LPWSTR lpszVolumeName, //驱动器名内存缓冲区
        _In_ DWORD cchBufferLength //缓冲区带下
        );//查完：false
    ```
  - 关闭查找句柄
    ```c++
    WINBASEAPI
    BOOL
    WINAPI
    FindVolumeClose(
        _In_ HANDLE hFindVolume //查找句柄
        );//是否关闭成功
    ```
- 操作驱动器挂载点
  - 获取指定卷的第一个挂载点
    ```c++
    WINBASEAPI
    HANDLE
    WINAPI
    FindFirstVolumeMountPointW(
        _In_ LPCWSTR lpszRootPathName,//要查找的卷名，以\结束
        _Out_writes_(cchBufferLength) LPWSTR lpszVolumeMountPoint,//第一个挂载点缓存
        _In_ DWORD cchBufferLength //挂载点缓存大小
        );//查找句柄
    ```
    *注：返回值为INVALID_HANDLE_VALUE,可以用GetLastError获取更多错误信息*
  - 获取指定卷的后续挂载点
    ```c++
    WINBASEAPI
    HANDLE
    WINAPI
    FindNextVolumeMountPointW(
        _In_ HANDLE hFindVolumeMountPoint, //查找句柄，由FindFirstVolumeMountPoint返回值提供
        _Out_writes_(cchBufferLength) LPWSTR lpszVolumeMountPoint,//第一个挂载点缓存
        _In_ DWORD cchBufferLength //挂载点缓存大小
        );//查找句柄
    ```
  - 关闭打开卷句柄
    ```c++
    WINBASEAPI
    BOOL
    WINAPI
    FindVolumeMountPointClose(
        _In_ HANDLE hFindVolumeMountPoint//挂载点的查找句柄
        );//是否关闭
    ```
  - 获取挂载点相应的卷设备名
    ```c++
    WINBASEAPI
    BOOL
    WINAPI
    GetVolumeNameForVolumeMountPointW(
        _In_ LPCWSTR lpszVolumeMountPoint, //需要查找的挂载点或根目录
        _Out_writes_(cchBufferLength) LPWSTR lpszVolumeName, //挂载点的卷设备缓冲区
        _In_ DWORD cchBufferLength //设备缓冲区大小
        );//是否成功
    ```
    *注：GetLastError获取更多错误信息*
  - 将指定卷挂载到指定挂载点处
    ```c++
    WINBASEAPI
    BOOL
    WINAPI
    SetVolumeMountPointW(
        _In_ LPCWSTR lpszVolumeMountPoint, //指定挂载点
        _In_ LPCWSTR lpszVolumeName // 卷设备名
        );//是否成功
    ```
    *注：GetLastError获取更多错误信息*

