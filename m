Return-Path: <linux-mips+bounces-10454-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FE8B30824
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 23:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A43EF5A0C0F
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 21:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4C928727C;
	Thu, 21 Aug 2025 21:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQZ01Sr4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F8A2877E0;
	Thu, 21 Aug 2025 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755810955; cv=none; b=nAg+BcYot4Kc5IFCLLUon+46mwrHLmrBGH8vxaf4UAgrZUWvYPf+9Z47NPlNvI4na2++oXx2lC7UyWpjk/zMEeEuCauS5WHAdMFE/UkpZUBSDC7BEo/nvynssYdMzb7ApYdYkF03eB1P4NzzoQakZ1lSTxYKh7i5CiLe0baVEyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755810955; c=relaxed/simple;
	bh=pOQAZPk+siIZkKBpkkHyydqf+iJWdipFSBVhf2HWXnk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fjqipuv3QvM0mXzW4qFfU8EBrZztAk8fS6HeEXNbtzhA55fkAL2jHyJOWQHBoASEJQip0KUNujo/B3lJsgz0B34w+O08oV74u6yOo5F+x241hpn5+qdjuBUUQ/6K3Uv/PlsZ8VweNoGgGPAnGjtI2PnqP0mL+/xIJHCZU7Ox07E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQZ01Sr4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9A8C4CEEB;
	Thu, 21 Aug 2025 21:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755810954;
	bh=pOQAZPk+siIZkKBpkkHyydqf+iJWdipFSBVhf2HWXnk=;
	h=From:Subject:Date:To:Cc:From;
	b=uQZ01Sr4y5UBxZbhDZfvUDEeNvw7RqMPpecFt11yc7bsaW5ovYL0XUfzrWWsiNXzZ
	 c8++tipPQjqwKYp0k0gDhrvljaAd7re4WVkFUF5WrFBqQqEIN8iR74Vee7BNt/CA+g
	 /tG0RI1G9MmS/0WG3vAsp0ldl5sjGRh0EGxzNxVH1Tm0PYZoCyCQqG00dIozdKH/oE
	 pE+AKTCsKwpp5uIo1NEGnmB8ycta84iEl1LU6UXiRm6kopTiphBIqE2wbsbInRJaJl
	 x/kzDSN/k618a3jDJ0BA65cb43YnV0uqrkYoP768loOw8+WrPigrhNPUtuX3uXdZuq
	 W/LW5Ik2tcyqg==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 00/12] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
Date: Thu, 21 Aug 2025 14:15:37 -0700
Message-Id: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHqMp2gC/22NQQ6CMBBFr0Jm7ZhOzSi48h6GhcAAE6GQVhsN4
 e5W3Lp8L/nvLxDEqwQ4Zwt4iRp0cgnsLoO6v7lOUJvEYI1lcyKD1XOccVSHwxBHjOKRGAu2B2p
 JqiMzpOnspdXXlr2WiXsNj8m/t5dIX/sL5pT/D0ZCg3VeUWPaglnM5S7eybCffAfluq4fb81km
 bkAAAA=
X-Change-ID: 20250710-bump-min-llvm-ver-15-95231f1eb655
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Marco Elver <elver@google.com>, 
 "Peter Zijlstra (Intel)" <peterz@infraded.org>, kasan-dev@googlegroups.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3775; i=nathan@kernel.org;
 h=from:subject:message-id; bh=pOQAZPk+siIZkKBpkkHyydqf+iJWdipFSBVhf2HWXnk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnLexp5jt71uLBmLnPYsZJXWxZZ/jvpEC46Jadf9c7Uw
 ETlF/9MO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEbpkw/I9487fgnDGfn0/r
 3M6FSqzXJdY9UrRtFZK/fJjFtn+JsiAjw7+LX1KSfVQYtyp9370iKU3tw4SvX9nUW67uL1go/I+
 LnxkA
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

I plan to carry this via the Kbuild tree with the appropriate acks.

---
Changes in v2:
- Add two new patches for RISC-V to clean up more LLD_VERSION checks
  (Alex)
- Pick up provided tags (thanks all!)
- Link to v1: https://lore.kernel.org/r/20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org

---
Nathan Chancellor (12):
      kbuild: Bump minimum version of LLVM for building the kernel to 15.0.0
      arch/Kconfig: Drop always true condition from RANDOMIZE_KSTACK_OFFSET
      ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
      arm64: Remove tautological LLVM Kconfig conditions
      mips: Unconditionally select ARCH_HAS_CURRENT_STACK_POINTER
      powerpc: Drop unnecessary initializations in __copy_inst_from_kernel_nofault()
      riscv: Remove version check for LTO_CLANG selects
      riscv: Unconditionally use linker relaxation
      riscv: Remove ld.lld version checks from many TOOLCHAIN_HAS configs
      lib/Kconfig.debug: Drop CLANG_VERSION check from DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
      objtool: Drop noinstr hack for KCSAN_WEAK_MEMORY
      KMSAN: Remove tautological checks

 Documentation/process/changes.rst |  2 +-
 arch/Kconfig                      |  1 -
 arch/arm/Kconfig                  | 11 ++++-------
 arch/arm64/Kconfig                |  5 +----
 arch/mips/Kconfig                 |  2 +-
 arch/powerpc/include/asm/inst.h   |  4 ----
 arch/riscv/Kconfig                | 21 +++++++--------------
 arch/riscv/Makefile               |  9 +--------
 lib/Kconfig.debug                 |  2 +-
 lib/Kconfig.kcsan                 |  6 ------
 lib/Kconfig.kmsan                 | 11 +----------
 scripts/min-tool-version.sh       |  6 ++----
 tools/objtool/check.c             | 10 ----------
 13 files changed, 19 insertions(+), 71 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250710-bump-min-llvm-ver-15-95231f1eb655

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


