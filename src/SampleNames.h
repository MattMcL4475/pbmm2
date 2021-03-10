// Author: Armin Töpfer

#pragma once

#include <map>
#include <string>
#include <vector>

namespace PacBio {
namespace BAM {
class DataSet;
class BamHeader;
}  // namespace BAM
namespace minimap2 {
struct AlignSettings;
struct UserIO;
using MovieToSampleToInfix = std::map<std::string, std::pair<std::string, std::string>>;
class SampleNames
{
public:
    static std::string SanitizeSampleName(const std::string& in);
    static std::string SanitizeFileInfix(const std::string& in);
    static std::string SanitizeCommandLineArgs(const std::string& in)
    static MovieToSampleToInfix DetermineMovieToSampleToInfix(const UserIO& uio);
    static BAM::BamHeader GenerateBamHeader(const AlignSettings& settings, const UserIO& uio,
                                            const MovieToSampleToInfix& mtsti,
                                            std::string& fastxRgId);
};
}  // namespace minimap2
}  // namespace PacBio
