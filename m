Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3B81753FA
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 07:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgCBGsA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Mar 2020 01:48:00 -0500
Received: from foss.arm.com ([217.140.110.172]:56678 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbgCBGsA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Mar 2020 01:48:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D730AFEC;
        Sun,  1 Mar 2020 22:47:58 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.1.119])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7EB443F6CF;
        Sun,  1 Mar 2020 22:51:45 -0800 (PST)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-mm@kvack.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: [RFC 0/3] mm/vma: some new flags and helpers
Date:   Mon,  2 Mar 2020 12:17:43 +0530
Message-Id: <1583131666-15531-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The motivation here is to consolidate VMA flag combinations commonly used
across platforms and reduce code duplication while making it uncluttered
in general.

This first introduces a default VM_DATA_DEFAULT_FLAGS which platforms can
easily fall back on without requiring to define any similar data flag
combinations as they currently do. This also adds some more common data
flag combinations which are generally used when the platforms decide to
override the default.

The second patch consolidates VM_READ, VM_WRITE, VM_EXEC as VM_ACCESS_FLAGS
extending the existing VMA accessibility concept via vma_is_accessibility().
VM_ACCESS_FLAGS replaces many other instances which used check all three
VMA access flags simultaneously.

While here, this also adds some more special VMA flag based helpers which
wraps around similar checks at various places thus improving readability.
This series intentionally limits these new helpers which are applicable 
only for special purpose VM flags than the more common ones like VM_READ,
VM_WRITE, VM_EXEC, VM_SHARED etc just to limit code churn. But if there is
common agreement that every flag should have it's own wrapper here, we can
do that as well. Otherwise if this patch seems really unnecessary with much
code churn, will be happy to drop it.

Reviews, comments, suggestions and concerns welcome. Thank you.

This series is based on v5.6-r4 after applying these patches.

1. https://patchwork.kernel.org/cover/11399319/
2. https://patchwork.kernel.org/patch/11399379/

This series is build tested across multiple architectures but boot tested
only on arm64 and x86 platforms.

Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-c6x-dev@linux-c6x.org
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: linux-hexagon@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: nios2-dev@lists.rocketboards.org
Cc: openrisc@lists.librecores.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linux-mm@kvack.org

Anshuman Khandual (3):
  mm/vma: Define a default value for VM_DATA_DEFAULT_FLAGS
  mm/vma: Introduce VM_ACCESS_FLAGS
  mm/vma: Introduce some more VMA flag wrappers

 arch/alpha/include/asm/page.h        |  3 --
 arch/arc/include/asm/page.h          |  2 +-
 arch/arm/include/asm/page.h          |  4 +-
 arch/arm/mm/fault.c                  |  2 +-
 arch/arm64/include/asm/page.h        |  4 +-
 arch/arm64/mm/fault.c                |  2 +-
 arch/c6x/include/asm/page.h          |  5 +--
 arch/c6x/include/asm/processor.h     |  2 +-
 arch/csky/include/asm/page.h         |  3 --
 arch/h8300/include/asm/page.h        |  2 -
 arch/hexagon/include/asm/page.h      |  3 +-
 arch/ia64/include/asm/page.h         |  5 +--
 arch/m68k/include/asm/page.h         |  3 --
 arch/microblaze/include/asm/page.h   |  2 -
 arch/mips/include/asm/page.h         |  5 +--
 arch/nds32/include/asm/page.h        |  3 --
 arch/nds32/mm/fault.c                |  2 +-
 arch/nios2/include/asm/page.h        |  3 +-
 arch/nios2/include/asm/processor.h   |  2 +-
 arch/openrisc/include/asm/page.h     |  5 ---
 arch/parisc/include/asm/page.h       |  3 --
 arch/powerpc/include/asm/page.h      |  9 +----
 arch/powerpc/include/asm/page_64.h   |  7 +---
 arch/powerpc/mm/book3s64/pkeys.c     |  2 +-
 arch/riscv/include/asm/page.h        |  3 +-
 arch/s390/include/asm/page.h         |  3 +-
 arch/s390/mm/fault.c                 |  2 +-
 arch/sh/include/asm/page.h           |  3 --
 arch/sh/include/asm/processor_64.h   |  2 +-
 arch/sparc/include/asm/mman.h        |  2 +-
 arch/sparc/include/asm/page_32.h     |  3 --
 arch/sparc/include/asm/page_64.h     |  3 --
 arch/unicore32/include/asm/page.h    |  3 --
 arch/unicore32/mm/fault.c            |  2 +-
 arch/x86/include/asm/page_types.h    |  4 +-
 arch/x86/mm/pkeys.c                  |  2 +-
 arch/x86/um/asm/vm-flags.h           | 10 +----
 arch/xtensa/include/asm/page.h       |  3 --
 drivers/staging/gasket/gasket_core.c |  2 +-
 fs/binfmt_elf.c                      |  2 +-
 fs/proc/task_mmu.c                   | 14 +++----
 include/linux/huge_mm.h              |  4 +-
 include/linux/mm.h                   | 58 +++++++++++++++++++++++++++-
 kernel/events/core.c                 |  2 +-
 kernel/events/uprobes.c              |  2 +-
 mm/gup.c                             |  2 +-
 mm/huge_memory.c                     |  6 +--
 mm/hugetlb.c                         |  4 +-
 mm/ksm.c                             |  8 ++--
 mm/madvise.c                         |  4 +-
 mm/memory.c                          |  4 +-
 mm/migrate.c                         |  4 +-
 mm/mlock.c                           |  4 +-
 mm/mmap.c                            | 20 +++++-----
 mm/mprotect.c                        |  9 ++---
 mm/mremap.c                          |  4 +-
 mm/msync.c                           |  3 +-
 mm/rmap.c                            |  6 +--
 mm/shmem.c                           |  8 ++--
 59 files changed, 140 insertions(+), 158 deletions(-)

-- 
2.20.1

