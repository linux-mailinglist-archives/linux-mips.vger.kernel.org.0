Return-Path: <linux-mips+bounces-10363-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E1AB2B102
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 20:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1052B206199
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 18:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE89272E48;
	Mon, 18 Aug 2025 18:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TO8hGFu9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A31257854;
	Mon, 18 Aug 2025 18:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755543466; cv=none; b=ura9X89rT5SZFddx3IO4kIcHQ9troSY/Fuf3IiAV9r3O153z6W4/M9UmYwrYOzkB5UnJFn0mZoq5G8OBeDl+P65T5E+2hvzWNomzNByiI06Xc8LgteDQrRHb/+Ep//0iyf0+xcDy/w0JvaArKjyIWt0vXoEgH6Nx2h0pYvUmTwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755543466; c=relaxed/simple;
	bh=qBGPy4AI12NWfHAvs72tXhhLkggZ76cCh4aJ0zfhg4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hoTU0u6VbsBAGG/hgRPvd5QPu4GlMMdkLFLMaGlPdGvC83B/kAxKifs4QzMNIrnXpa5Lbrt4brOikAMlK4Pgbg62ziQv5eqcIwE0dNlsEgNdqbPEcS/UllSFA+I+dMLIEjAn7jitccMM5RNYjUjRkpq/Y5brhhLy2AeOjsMZIG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TO8hGFu9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7007FC4CEEB;
	Mon, 18 Aug 2025 18:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755543466;
	bh=qBGPy4AI12NWfHAvs72tXhhLkggZ76cCh4aJ0zfhg4o=;
	h=From:Subject:Date:To:Cc:From;
	b=TO8hGFu9iuv4h970cI0P8DaQE+EJjCFUuIpmSaDSZc3jEdTo9PJkV2ZjkGkU8yAyz
	 hA6uFbfmOGnWNaUYGLBL+njTod03yGzU0n3WtfoyFctsEwXUmB+b+ektMo1uhkUEt0
	 x+B2tuvrWWSXUizIVwqIgYX1trm2mhHkeSrWJzCgOaoVdF3TOEIEatnQLchQ6bouVN
	 bqR50c9Og2MFxhXY+8T0CJouc/vuM+CLdC6liY23Lilx/TBdkUhSccNoOPjp8E2qEG
	 KDRyquCnMeMv42skmZrHiH02/P7YKlkxqYQSYkfrbDYOmhiwgZm559AXS4YzQzJBoT
	 JHTROUXnhA26w==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 00/10] Bump minimum supported version of LLVM for building
 the kernel to 15.0.0
Date: Mon, 18 Aug 2025 11:57:16 -0700
Message-Id: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIx3o2gC/x3MwQoCIRCA4VeROe+AY0zRvkrsoa2xBtRESQLx3
 Vc6fof/71ClqFRYTYciTat+0gQtBh7ve3oJ6nManHVsL2Rx/8aMUROG0CI2KUiMV3Yn8iT7mRl
 mmot4/f23t22MA23HpyFmAAAA
X-Change-ID: 20250710-bump-min-llvm-ver-15-95231f1eb655
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 kasan-dev@googlegroups.com, Alexander Potapenko <glider@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3422; i=nathan@kernel.org;
 h=from:subject:message-id; bh=qBGPy4AI12NWfHAvs72tXhhLkggZ76cCh4aJ0zfhg4o=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmLyxfkKs9J3XvmTW/HPLXzb2LV/ble9105em3NlZSrK
 rcn6luu7yhlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQAT2WLNyLDcY1peR8tewSkT
 F3NPCHvlGPr7vt3zpq/7/opaMwrfUPdmZDjG+/9Q5BeZLcKLVm0XPXCDawGDjEHkhrzAGu39rXt
 Z47gA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

s390 and x86 have required LLVM 15 since

  30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
  7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")

respectively. This series bumps the rest of the kernel to 15.0.0 to
match, which allows for a decent number of clean ups.

On the distros front, we will only leave behind Debian Bookworm and
Ubuntu Jammy. In both of those cases, builders / developers can either
use the kernel.org toolchains or https://apt.llvm.org to get newer
versions that will run on those distributions, if they cannot upgrade.

  archlinux:latest              clang version 20.1.8
  debian:oldoldstable-slim      Debian clang version 11.0.1-2
  debian:oldstable-slim         Debian clang version 14.0.6
  debian:stable-slim            Debian clang version 19.1.7 (3+b1)
  debian:testing-slim           Debian clang version 19.1.7 (3+b1)
  debian:unstable-slim          Debian clang version 19.1.7 (3+b2)
  fedora:41                     clang version 19.1.7 (Fedora 19.1.7-4.fc41)
  fedora:latest                 clang version 20.1.8 (Fedora 20.1.8-3.fc42)
  fedora:rawhide                clang version 20.1.8 (Fedora 20.1.8-3.fc43)
  opensuse/leap:latest          clang version 17.0.6
  opensuse/tumbleweed:latest    clang version 20.1.8
  ubuntu:focal                  clang version 10.0.0-4ubuntu1
  ubuntu:jammy                  Ubuntu clang version 14.0.0-1ubuntu1.1
  ubuntu:noble                  Ubuntu clang version 18.1.3 (1ubuntu1)
  ubuntu:latest                 Ubuntu clang version 18.1.3 (1ubuntu1)
  ubuntu:rolling                Ubuntu clang version 20.1.2 (0ubuntu1)
  ubuntu:devel                  Ubuntu clang version 20.1.8 (0ubuntu1)

I think it makes sense for either Andrew to carry this via -mm on a
nonmm branch or me to carry this via the Kbuild tree, with the
appropriate acks.

---
Nathan Chancellor (10):
      kbuild: Bump minimum version of LLVM for building the kernel to 15.0.0
      arch/Kconfig: Drop always true condition from RANDOMIZE_KSTACK_OFFSET
      ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
      arm64: Remove tautological LLVM Kconfig conditions
      mips: Unconditionally select ARCH_HAS_CURRENT_STACK_POINTER
      powerpc: Drop unnecessary initializations in __copy_inst_from_kernel_nofault()
      riscv: Remove version check for LTO_CLANG selects
      lib/Kconfig.debug: Drop CLANG_VERSION check from DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
      objtool: Drop noinstr hack for KCSAN_WEAK_MEMORY
      KMSAN: Remove tautological checks

 Documentation/process/changes.rst |  2 +-
 arch/Kconfig                      |  1 -
 arch/arm/Kconfig                  | 11 ++++-------
 arch/arm64/Kconfig                |  5 +----
 arch/mips/Kconfig                 |  2 +-
 arch/powerpc/include/asm/inst.h   |  4 ----
 arch/riscv/Kconfig                |  5 ++---
 lib/Kconfig.debug                 |  2 +-
 lib/Kconfig.kcsan                 |  6 ------
 lib/Kconfig.kmsan                 | 11 +----------
 scripts/min-tool-version.sh       |  6 ++----
 tools/objtool/check.c             | 10 ----------
 12 files changed, 13 insertions(+), 52 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250710-bump-min-llvm-ver-15-95231f1eb655

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


