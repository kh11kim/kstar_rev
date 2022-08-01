#ifndef PDBS_PATTERN_COLLECTION_GENERATOR_SYSTEMATIC_H
#define PDBS_PATTERN_COLLECTION_GENERATOR_SYSTEMATIC_H

#include "pattern_generator.h"
#include "types.h"

#include "../utils/hash.h"

#include <cstdlib>
#include <memory>
#include <unordered_set>
#include <vector>

class CausalGraph;
class TaskProxy;

namespace options {
class Options;
}

namespace pdbs {
class CanonicalPDBsHeuristic;

// Invariant: patterns are always sorted.
class PatternCollectionGeneratorSystematic : public PatternCollectionGenerator {
    using PatternSet = std::unordered_set<Pattern>;

    const size_t max_pattern_size;
    const bool only_interesting_patterns;
    std::shared_ptr<PatternCollection> patterns;
    PatternSet pattern_set;  // Cleared after pattern computation.

    void enqueue_pattern_if_new(const Pattern &pattern);
    void compute_eff_pre_neighbors(const CausalGraph &cg,
                                   const Pattern &pattern,
                                   std::vector<int> &result) const;
    void compute_connection_points(const CausalGraph &cg,
                                   const Pattern &pattern,
                                   std::vector<int> &result) const;

    void build_sga_patterns(const TaskProxy &task_proxy, const CausalGraph &cg);
    void build_patterns(const TaskProxy &task_proxy);
    void build_patterns_naive(const TaskProxy &task_proxy);
public:
    explicit PatternCollectionGeneratorSystematic(const options::Options &opts);
    virtual ~PatternCollectionGeneratorSystematic() = default;

    virtual PatternCollectionInformation generate(
        const std::shared_ptr<AbstractTask> &task) override;
};
}

#endif