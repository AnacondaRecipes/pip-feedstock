if "%BOOTSTRAP_FROM_WHL%"=="yes" (
    set PYTHONPATH=".\pip-%PKG_VERSION%-py3-none-any.whl"
    %PYTHON% -m pip install --no-cache-dir --no-index --no-index --find-links . pip
) else (
    set PYTHONPATH=".\src"
    %PYTHON% -m pip install . --no-deps --no-build-isolation -vv
)
if errorlevel 1 exit 1

cd %SCRIPTS%
del *.exe
del *.exe.manifest
del pip2*
del pip3*

:: del %SP_DIR%\__pycache__\pkg_res*
