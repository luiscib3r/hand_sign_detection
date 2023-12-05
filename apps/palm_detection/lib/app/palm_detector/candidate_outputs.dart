class CandidateOutputs {
  CandidateOutputs({
    required this.candidateDetect,
    required this.candidateProbabilities,
    required this.candidateAnchors,
  });

  final List<List<double>> candidateDetect;
  final List<double> candidateProbabilities;
  final List<List<double>> candidateAnchors;
}
