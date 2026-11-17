using NUnit.Framework;
using EmpireBuilder;

public sealed class EmpireSimulationTests
{
    [Test]
    public void BuildingDeductsGoldAndIncreasesProduction()
    {
        var game = new EmpireState();
        Assert.IsTrue(game.BuildFarm());
        Assert.IsTrue(game.BuildMarket());
        Assert.AreEqual(0, game.Gold);
        game.AdvanceTurn();
        Assert.AreEqual(14, game.Food);
        Assert.AreEqual(3, game.Gold);
    }

    [Test]
    public void CannotSpendMoreThanAvailable()
    {
        var game = new EmpireState(gold: 7);
        Assert.IsFalse(game.BuildFarm());
        Assert.AreEqual(7, game.Gold);
        Assert.AreEqual(0, game.Farms);
    }

    [Test]
    public void StarvationNeverProducesNegativeResources()
    {
        var game = new EmpireState(population: 5, food: 2, gold: 0);
        game.AdvanceTurn();
        Assert.AreEqual(2, game.Population);
        Assert.AreEqual(0, game.Food);
        game.AdvanceTurn();
        Assert.IsTrue(game.IsDefeated);
        Assert.AreEqual(0, game.Population);
    }

    [Test]
    public void SnapshotRestorePreservesState()
    {
        var game = new EmpireState();
        game.BuildFarm();
        game.AdvanceTurn();
        var restored = EmpireState.Restore(game.Snapshot());
        Assert.AreEqual(game.Turn, restored.Turn);
        Assert.AreEqual(game.Food, restored.Food);
        Assert.AreEqual(game.Gold, restored.Gold);
        Assert.AreEqual(game.Farms, restored.Farms);
    }

    [Test]
    public void InvalidSnapshotRejected()
    {
        Assert.Throws<System.ArgumentOutOfRangeException>(() =>
            EmpireState.Restore(new EmpireSnapshot(-1, 2, 3, 4, 0, 0)));
    }
}
