/*
Copyright (c) 2015 - present Advanced Micro Devices, Inc. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

#include "ArgParse.h"
#include "LLVMCompat.h"
#include "llvm/Support/Path.h"
#include "clang/Lex/PreprocessorOptions.h"
#include "clang/Frontend/CompilerInstance.h"

const std::string sHipify = "[HIPIFY] ", sConflict = "conflict: ", sError = "error: ", sWarning = "warning: ";

namespace llcompat {

void PrintStackTraceOnErrorSignal() {
  // The signature of PrintStackTraceOnErrorSignal changed in llvm 3.9. We don't support
  // anything older than 3.8, so let's specifically detect the one old version we support.
#if (LLVM_VERSION_MAJOR == 3) && (LLVM_VERSION_MINOR == 8)
  llvm::sys::PrintStackTraceOnErrorSignal();
#else
  llvm::sys::PrintStackTraceOnErrorSignal(StringRef());
#endif
}

ct::Replacements &getReplacements(ct::RefactoringTool &Tool, StringRef file) {
#if LLVM_VERSION_MAJOR > 3
  // getReplacements() now returns a map from filename to Replacements - so create an entry
  // for this source file and return a reference to it.
  return Tool.getReplacements()[std::string(file)];
#else
  return Tool.getReplacements();
#endif
}

void insertReplacement(ct::Replacements &replacements, const ct::Replacement &rep) {
#if LLVM_VERSION_MAJOR > 3
  // New clang added error checking to Replacements, and *insists* that you explicitly check it.
  llvm::consumeError(replacements.add(rep));
#else
  // In older versions, it's literally an std::set<Replacement>
  replacements.insert(rep);
#endif
}

void EnterPreprocessorTokenStream(clang::Preprocessor &_pp, const clang::Token *start, size_t len, bool DisableMacroExpansion) {
#if (LLVM_VERSION_MAJOR == 3) && (LLVM_VERSION_MINOR == 8)
  _pp.EnterTokenStream(start, len, false, DisableMacroExpansion);
#else
  #if (LLVM_VERSION_MAJOR < 9)
    _pp.EnterTokenStream(clang::ArrayRef<clang::Token>{start, len}, DisableMacroExpansion);
  #else
    _pp.EnterTokenStream(clang::ArrayRef<clang::Token>{start, len}, DisableMacroExpansion, false);
  #endif
#endif
}

clang::SourceLocation getBeginLoc(const clang::Stmt *stmt) {
#if LLVM_VERSION_MAJOR < 8
  return stmt->getLocStart();
#else
  return stmt->getBeginLoc();
#endif
}

clang::SourceLocation getBeginLoc(const clang::TypeLoc &typeLoc) {
#if LLVM_VERSION_MAJOR < 8
  return typeLoc.getLocStart();
#else
  return typeLoc.getBeginLoc();
#endif
}

clang::SourceLocation getEndLoc(const clang::Stmt *stmt) {
#if LLVM_VERSION_MAJOR < 8
  return stmt->getLocEnd();
#else
  return stmt->getEndLoc();
#endif
}

clang::SourceLocation getEndLoc(const clang::TypeLoc &typeLoc) {
#if LLVM_VERSION_MAJOR < 8
  return typeLoc.getLocEnd();
#else
  return typeLoc.getEndLoc();
#endif
}

std::error_code real_path(const Twine &path, SmallVectorImpl<char> &output,
                          bool expand_tilde) {
#if LLVM_VERSION_MAJOR < 5
  output.clear();
  std::string s = path.str();
  output.append(s.begin(), s.end());
  if (sys::path::is_relative(path)) {
    return sys::fs::make_absolute(output);
  }
  return std::error_code();
#else
  return sys::fs::real_path(path, output, expand_tilde);
#endif
}

bool pragma_once_outside_header() {
#if LLVM_VERSION_MAJOR < 4
  return false;
#else
  return true;
#endif
}

void RetainExcludedConditionalBlocks(clang::CompilerInstance &CI) {
#if LLVM_VERSION_MAJOR > 9
  clang::PreprocessorOptions &PPOpts = CI.getPreprocessorOpts();
  if (SkipExcludedPPConditionalBlocks) {
    PPOpts.RetainExcludedConditionalBlocks = !SkipExcludedPPConditionalBlocks;
  } else if (DefaultPreprocessor) {
    PPOpts.RetainExcludedConditionalBlocks = !DefaultPreprocessor;
  } else {
    PPOpts.RetainExcludedConditionalBlocks = !SkipExcludedPPConditionalBlocks;
  }
#endif
}

bool CheckCompatibility() {
#if LLVM_VERSION_MAJOR < 10
  if (SkipExcludedPPConditionalBlocks) {
    llvm::errs() << "\n" << sHipify << sWarning << "Option '" << SkipExcludedPPConditionalBlocks.ArgStr.str() << "' is supported starting from LLVM version 10.0\n";
  }
  if (DefaultPreprocessor) {
    llvm::errs() << "\n" << sHipify << sWarning << "Option '" << DefaultPreprocessor.ArgStr.str() << "' is supported starting from LLVM version 10.0\n";
  }
#endif
  return true;
}

clang::SourceLocation getEndOfExpansionRangeForLoc(const clang::SourceManager &SM, const clang::SourceLocation &loc) {
#if LLVM_VERSION_MAJOR > 6
  return SM.getExpansionRange(loc).getEnd();
#else
  return SM.getExpansionRange(loc).second;
#endif
}

Memory_Buffer getMemoryBuffer(const clang::SourceManager &SM) {
#if LLVM_VERSION_MAJOR >= 12
  return SM.getBufferOrFake(SM.getMainFileID());
#else
  return SM.getBuffer(SM.getMainFileID());
#endif
}

void addTargetIfNeeded(ct::RefactoringTool& Tool) {
#if defined(_WIN32) && LLVM_VERSION_MAJOR >= 16
  std::string sTarget = "--target=x86_64-pc-windows-msvc";
  Tool.appendArgumentsAdjuster(ct::getInsertArgumentAdjuster(sTarget.c_str(), ct::ArgumentInsertPosition::BEGIN));
#endif
}

} // namespace llcompat
