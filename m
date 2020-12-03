Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502612CE107
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 22:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbgLCVqR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 16:46:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgLCVqQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 16:46:16 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1B7C061A4F;
        Thu,  3 Dec 2020 13:45:36 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkwPp-00GJPP-Nl; Thu, 03 Dec 2020 21:45:29 +0000
Date:   Thu, 3 Dec 2020 21:45:29 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCHSET] saner elf compat
Message-ID: <20201203214529.GB3579531@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

	This series deals with the warts in ELF compat on triarch
architectures (x86_64 and mips64, that is).

	x86_64 at least does use compat_binfmt_elf.c for both
32bit ABIs; the way it is done is ugly as hell, though, and more
than slightly brittle (see asm/compat.h for PRSTATUS_SIZE and SET_PR_FPVALID
definitions - IMO that kind of magic is too ugly to live).

	mips64, OTOH, does not use compat_binfmt_elf.c for either of its
32bit ABIs.  It has a couple of analogues (each with include of
../../../fs/binfmt_elf.c, BTW), with quite a bit of ancient cruft
accumulated in those.

	Fortunately, cleanup of i386/x32 mess (first 3 commits in
the series) provides a fairly straightforward way for mips64 to use
fs/compat_binfmt_elf.c for both n32 and o32.

	That stuff had been sitting around since June; lately rdd has
spotted Kconfig problems around COMPAT_BINFMT_ELF selects.  All of them
had been on configs that had COMPAT_BINFMT_ELF != COMPAT && BINFMT_ELF.
For most of the architectures that's impossible to achieve, but some
(sparc, e.g.) can end up with that.  Randy posted a patch adding
if BINFMT_ELF to selects that lacked it, but that looked wrong to me -
why not centralize that logics into fs/Kconfig.binfmt?  IOW, what's
the point of having any such selects in arch/*/Kconfig?

	The answer (for mainline) is that mips compat does *NOT* want
COMPAT_BINFMT_ELF.  Not a problem with that series, though, so I'd
retested it (seems to work, both for x86_64 and mips64, execs and
coredumps for all ABIs alike), with centralization of Kconfig logics
thrown in.

	It's based at 5.10-rc1 and lives in
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git#work.elf-compat
I'll post the individual patches in followups.

Shortlog:
      binfmt_elf: partially sanitize PRSTATUS_SIZE and SET_PR_FPVALID
      elf_prstatus: collect the common part (everything before pr_reg) into a struct
      [elfcore-compat][amd64] clean PRSTATUS_SIZE/SET_PR_FPVALID up properly
      mips binfmt_elf*32.c: use elfcore-compat.h
      mips: kill unused definitions in binfmt_elf[on]32.c
      mips: KVM_GUEST makes no sense for 64bit builds...
      mips compat: don't bother with ELF_ET_DYN_BASE
      mips: don't bother with ELF_CORE_EFLAGS
      mips compat: switch to compat_binfmt_elf.c
      Kconfig: regularize selection of CONFIG_BINFMT_ELF

Diffstat:
 arch/Kconfig                               |   3 +
 arch/arm64/Kconfig                         |   1 -
 arch/ia64/kernel/crash.c                   |   2 +-
 arch/mips/Kconfig                          |   8 +--
 arch/mips/include/asm/elf.h                |  56 +++++----------
 arch/mips/include/asm/elfcore-compat.h     |  29 ++++++++
 arch/mips/kernel/Makefile                  |   4 +-
 arch/mips/kernel/binfmt_elfn32.c           | 106 ----------------------------
 arch/mips/kernel/binfmt_elfo32.c           | 109 -----------------------------
 arch/mips/kernel/scall64-n64.S             |   2 +-
 arch/parisc/Kconfig                        |   1 -
 arch/powerpc/Kconfig                       |   1 -
 arch/powerpc/platforms/powernv/opal-core.c |   6 +-
 arch/s390/Kconfig                          |   1 -
 arch/s390/kernel/crash_dump.c              |   2 +-
 arch/sparc/Kconfig                         |   1 -
 arch/x86/Kconfig                           |   2 +-
 arch/x86/include/asm/compat.h              |  11 ---
 arch/x86/include/asm/elfcore-compat.h      |  31 ++++++++
 fs/Kconfig.binfmt                          |   2 +-
 fs/binfmt_elf.c                            |  19 +++--
 fs/binfmt_elf_fdpic.c                      |  22 ++----
 fs/compat_binfmt_elf.c                     |   1 +
 include/linux/elfcore-compat.h             |  15 +++-
 include/linux/elfcore.h                    |   7 +-
 kernel/kexec_core.c                        |   2 +-
 26 files changed, 127 insertions(+), 317 deletions(-)
 create mode 100644 arch/mips/include/asm/elfcore-compat.h
 delete mode 100644 arch/mips/kernel/binfmt_elfn32.c
 delete mode 100644 arch/mips/kernel/binfmt_elfo32.c
 create mode 100644 arch/x86/include/asm/elfcore-compat.h
