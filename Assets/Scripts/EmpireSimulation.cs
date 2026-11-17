using System;
using System.Collections.Generic;

namespace EmpireBuilder
{
    // Pure C# simulation; Unity scene and persistence adapters are separate.
    [Serializable]
    public sealed class EmpireState
    {
        public int Turn { get; private set; }
        public int Population { get; private set; }
        public int Food { get; private set; }
        public int Gold { get; private set; }
        public int Farms { get; private set; }
        public int Markets { get; private set; }
        public bool IsDefeated { get { return Population == 0; } }

        public EmpireState(int population = 5, int food = 15, int gold = 20)
        {
            if (population < 0 || food < 0 || gold < 0)
                throw new ArgumentOutOfRangeException("Resources must be nonnegative");
            Population = population;
            Food = food;
            Gold = gold;
        }

        public bool BuildFarm()
        {
            if (IsDefeated || Gold < 8) return false;
            Gold -= 8;
            Farms++;
            return true;
        }

        public bool BuildMarket()
        {
            if (IsDefeated || Gold < 12) return false;
            Gold -= 12;
            Markets++;
            return true;
        }

        public void AdvanceTurn()
        {
            if (IsDefeated) return;
            Turn++;
            Food += Farms * 4;
            Gold += Markets * 3;
            int fed = Math.Min(Population, Food);
            Food -= fed;
            Population = fed; // Each unfed citizen is lost; no negative inventory.
        }

        public EmpireSnapshot Snapshot()
        {
            return new EmpireSnapshot(Turn, Population, Food, Gold, Farms, Markets);
        }

        public static EmpireState Restore(EmpireSnapshot snapshot)
        {
            if (snapshot == null) throw new ArgumentNullException(nameof(snapshot));
            if (snapshot.Turn < 0 || snapshot.Population < 0 || snapshot.Food < 0 ||
                snapshot.Gold < 0 || snapshot.Farms < 0 || snapshot.Markets < 0)
                throw new ArgumentOutOfRangeException(nameof(snapshot));
            var state = new EmpireState(snapshot.Population, snapshot.Food, snapshot.Gold);
            state.Turn = snapshot.Turn;
            state.Farms = snapshot.Farms;
            state.Markets = snapshot.Markets;
            return state;
        }
    }

    [Serializable]
    public sealed class EmpireSnapshot
    {
        public int Turn, Population, Food, Gold, Farms, Markets;
        public EmpireSnapshot(int turn, int population, int food, int gold, int farms, int markets)
        {
            Turn = turn; Population = population; Food = food; Gold = gold;
            Farms = farms; Markets = markets;
        }
    }
}
