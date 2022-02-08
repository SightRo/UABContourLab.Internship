using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

BenchmarkRunner.Run<FindDuplicates>();

[MemoryDiagnoser]
public class FindDuplicates
{
    public int[] RandomNumbers { get; set; }

    [GlobalSetup]
    public void Setup()
    {
        RandomNumbers =
            Enumerable.Repeat(0, 10_000_000).Select(_ => Random.Shared.Next(0, 10000)).ToArray();
    }

    [Benchmark]
    public int[] LinqWay()
    {
        return RandomNumbers.Distinct().ToArray();
    }

    [Benchmark]
    public int[] HashSet()
    {
        return new HashSet<int>(RandomNumbers).ToArray();
    }
}