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
    _In_      DWORD nSize        //接收路径的字符缓冲区的大小
    );
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
  
