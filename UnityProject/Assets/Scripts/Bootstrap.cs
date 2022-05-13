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
        WakeUp();

        _button.onClick.AddListener(OnClickTest);
    }

    void Update()
    {
        var pos = Input.mousePosition;
        SendMousePosition(pos.x, pos.y, pos.z);
    }

    [DllImport("__Internal", EntryPoint = "wakeUp")]
    static extern void WakeUp();

    [DllImport("__Internal", EntryPoint = "onClickTest")]
    static extern void OnClickTest();

    [DllImport("__Internal", EntryPoint = "sendMousePosition")]
    static extern void SendMousePosition(float x, float y, float z);
#endif
}
