using HarmonyLib;
using Verse;

namespace BiotechBodies
{
    [StaticConstructorOnStartup]
    public static class Startup
    {
        static Startup()
        {
            var harmony = new Harmony("nelim.biotechbodies");
            harmony.PatchAll();
            FaceLooks.Register();
            FaceDefaults.Patch(harmony);
        }
    }
}
