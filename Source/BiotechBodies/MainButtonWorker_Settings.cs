using RimWorld;
using Verse;

namespace BiotechBodies
{
    // Optional shortcut to the same dialog as Mod options. The def hides it by default (MOD_SETTINGS.md, section 2).
    public class MainButtonWorker_Settings : MainButtonWorker
    {
        public override void Activate()
        {
            Find.WindowStack.Add(new Dialog_ModSettings(BiBMod.Instance));
        }
    }
}
