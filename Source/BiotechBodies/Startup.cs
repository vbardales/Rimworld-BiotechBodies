using HarmonyLib;
using Verse;

namespace BiotechBodies
{
    [StaticConstructorOnStartup]
    public static class Startup
    {
        static Startup()
        {
            new Harmony("nelim.biotechbodies").PatchAll();
            FaceLooks.Register();
        }
    }
}
