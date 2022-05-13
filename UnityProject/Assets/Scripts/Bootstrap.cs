using System.Runtime.InteropServices;
using UnityEngine;

sealed class Bootstrap : MonoBehaviour
{
    void Start()
    {
#if UNITY_IOS || UNITY_TVOS
        WakeUp();
#endif
    }

    [DllImport("__Internal", EntryPoint = "wakeUp")]
    static extern void WakeUp();
}