using System;
using System.Runtime.InteropServices;
using UnityEngine;
using UnityEngine.UI;

sealed class Bootstrap : MonoBehaviour
{
    [SerializeField] Button _button = default;

#if UNITY_IOS || UNITY_TVOS
    void Start()
    {
        RegisterSampleCallback(OnCallback);
        Ready();

        _button.onClick.AddListener(() => { NativeAPI.showHostMainWindow("test"); });
    }

    delegate void CallbackDelegate(int num);

    [AOT.MonoPInvokeCallbackAttribute(typeof(CallbackDelegate))]
    static void OnCallback(int num)
    {
        Debug.Log($"ネイティブコードから呼び出された : {num}");
    }

    [DllImport("__Internal", EntryPoint = "ready")]
    static extern void Ready();

    [DllImport("__Internal", EntryPoint = "registerSampleCallback")]
    static extern void RegisterSampleCallback(CallbackDelegate callback);
#endif
}