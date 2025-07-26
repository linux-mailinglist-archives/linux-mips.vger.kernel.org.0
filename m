Return-Path: <linux-mips+bounces-9923-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C1B12CAA
	for <lists+linux-mips@lfdr.de>; Sat, 26 Jul 2025 23:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3DE2189A69F
	for <lists+linux-mips@lfdr.de>; Sat, 26 Jul 2025 21:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E7621E094;
	Sat, 26 Jul 2025 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHrb3axi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81EC19F135;
	Sat, 26 Jul 2025 21:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753565961; cv=none; b=AYW6DX/jJbWAa/YeYROeslCdtVtKC3bgtd7uXQOAV/TeuLZEybb7ml7pBNz3Jpfqr+bcUW/UtU7YuFe2L3V1WM+a+JvLXfXM/ADNXnE3TNkUWfng9gNC6LBWexsCRrMADEvgeSy/qpIAc7jcauOFOaaza4km8rODsW5RVxyPuTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753565961; c=relaxed/simple;
	bh=bE8gOgUvTZi4vI0lg9qUYLnf/GEXOkxooNHihx3vuJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sBGjGdkGKPUtN645G7k253uakuUi42RnGpsHMRz2Y/seKy898lgIfL+Xit52iEESYEqlo3cryRrQI5O7taXO8jUkJWHOmH7aKWnib+Kug1OKvwSxjrS6c829qpIFbi/ydI3HdKw0bBQEFkWaW04FtVU3Js1b6qmrRm9DgZP1UYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHrb3axi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85239C4CEF4;
	Sat, 26 Jul 2025 21:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753565960;
	bh=bE8gOgUvTZi4vI0lg9qUYLnf/GEXOkxooNHihx3vuJw=;
	h=Date:From:To:Cc:Subject:From;
	b=XHrb3axiSsGzIoF2z2Ix7pQjSMf1Hy42ar894fKLOABDtiMSiJhU7EOw7iJrgd6tB
	 IbaRdb5qeWEpZin3fRvADFhKWu6rwXZK251hn0vmJbDMaGw9ALbzwGt5jlO4g1Ev/5
	 38kyT5jk9ILeJA/C732uod/apU+rxyQj7EYgW1D/FfLwRv3xciKcU+EEYDtA1K1HQw
	 89qGLSJb5I1UF5EVZNysHbVA4poyaagUpDWiSn+7w1Wkxrul3aS8xbgWpQmDVmq97o
	 1XX7DFiDUydJ2ZJduymhDp4XdKL9MxP2XYT1rwFJYEc0IFFTjUHBVSjh8qB39SdIcg
	 FmVRs5hgMDysg==
Date: Sat, 26 Jul 2025 14:39:20 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andreas Larsson <andreas@gaisler.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Chris Zankel <chris@zankel.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Dishank Jogi <dishank.jogi@siqol.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>, Kees Cook <kees@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org, loongarch@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>,
	Russell King <linux@armlinux.org.uk>, sparclinux@vger.kernel.org,
	Stafford Horne <shorne@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
	x86@kernel.org, Yin Fengwei <fengwei_yin@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [GIT PULL] execve updates for v6.17
Message-ID: <202507261437.F2079B3B7@keescook>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these execve updates for v6.17. Note that while the REGSET
macro changes touch all the architectures, they are fairly mechanical
and have been in linux-next for almost the entire development window.

Thanks!

-Kees

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.17

for you to fetch changes up to 7f71195c15dcf5f34c4c7f056603659374e3a525:

  fork: reorder function qualifiers for copy_clone_args_from_user (2025-07-17 16:37:05 -0700)

----------------------------------------------------------------
execve updates for v6.17

- Introduce regular REGSET note macros arch-wide (Dave Martin)

- Remove arbitrary 4K limitation of program header size (Yin Fengwei)

- Reorder function qualifiers for copy_clone_args_from_user() (Dishank Jogi)

----------------------------------------------------------------
Dave Martin (23):
      regset: Fix kerneldoc for struct regset_get() in user_regset
      regset: Add explicit core note name in struct user_regset
      binfmt_elf: Dump non-arch notes with strictly matching name and type
      ARC: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      ARM: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      arm64: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      csky: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      hexagon: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      LoongArch: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      m68k: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      MIPS: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      nios2: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      openrisc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      parisc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      powerpc/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      riscv: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      s390/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      sh: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      sparc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      x86/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      um: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      xtensa: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      binfmt_elf: Warn on missing or suspicious regset note names

Dishank Jogi (1):
      fork: reorder function qualifiers for copy_clone_args_from_user

Yin Fengwei (1):
      binfmt_elf: remove the 4k limitation of program header size

 include/linux/regset.h                   | 12 +++++-
 arch/arc/kernel/ptrace.c                 |  4 +-
 arch/arm/kernel/ptrace.c                 |  6 +--
 arch/arm64/kernel/ptrace.c               | 52 +++++++++++-----------
 arch/csky/kernel/ptrace.c                |  4 +-
 arch/hexagon/kernel/ptrace.c             |  2 +-
 arch/loongarch/kernel/ptrace.c           | 16 +++----
 arch/m68k/kernel/ptrace.c                |  4 +-
 arch/mips/kernel/ptrace.c                | 20 ++++-----
 arch/nios2/kernel/ptrace.c               |  2 +-
 arch/openrisc/kernel/ptrace.c            |  4 +-
 arch/parisc/kernel/ptrace.c              |  8 ++--
 arch/powerpc/kernel/ptrace/ptrace-view.c | 74 ++++++++++++++++----------------
 arch/riscv/kernel/ptrace.c               | 12 +++---
 arch/s390/kernel/ptrace.c                | 42 +++++++++---------
 arch/sh/kernel/ptrace_32.c               |  4 +-
 arch/sparc/kernel/ptrace_32.c            |  4 +-
 arch/sparc/kernel/ptrace_64.c            |  8 ++--
 arch/x86/kernel/ptrace.c                 | 22 +++++-----
 arch/x86/um/ptrace.c                     | 10 ++---
 arch/xtensa/kernel/ptrace.c              |  4 +-
 fs/binfmt_elf.c                          | 38 ++++++++++------
 fs/binfmt_elf_fdpic.c                    | 17 ++++----
 kernel/fork.c                            |  2 +-
 24 files changed, 196 insertions(+), 175 deletions(-)

-- 
Kees Cook

