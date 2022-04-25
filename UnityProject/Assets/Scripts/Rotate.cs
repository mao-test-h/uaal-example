using System.Runtime.InteropServices;
using UnityEngine.UI;
using UnityEngine;

public sealed class Rotate : MonoBehaviour
{
    void Update()
    {
        transform.Rotate(0, Time.deltaTime * 10, 0);
    }
}
