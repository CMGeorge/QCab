windows{
    CONFIG += build_all
    CONFIG += debug_and_release
    headers.path=$$PREFIX/include/$$LIB_NAME
    headers.files=$$HEADERS
    target.path=$$PREFIX/lib
    INSTALLS += headers target
    # workaround for qdatetime.h macro bug
    DEFINES += NOMINMAX
}
