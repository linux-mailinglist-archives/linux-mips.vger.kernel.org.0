Return-Path: <linux-mips+bounces-12815-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB9D0E24C
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 09:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A43EC300BBAE
	for <lists+linux-mips@lfdr.de>; Sun, 11 Jan 2026 08:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649FD2459DD;
	Sun, 11 Jan 2026 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqKHBj52"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356951E1A3D;
	Sun, 11 Jan 2026 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768119684; cv=none; b=GBDS1UvKtSgPpzuw9GWIA8S1UvpYHAqjgSxtul93PpyltG2naZr4uJq9y5nzxJNCp5Ru2GG9uPYnFJvoStYD4iq2E34rmbzhtN9EnUvqJaxJprfGQ8xQMECZTdK22vFTmZ/vb6kRfESmj+H7FF/G2vKumyluyRbWVCo0LKtZDsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768119684; c=relaxed/simple;
	bh=15VB+6hE09IpORerfJ9cs3QzayYtdIP5ByWTlGt3qZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJn1wCM04C+lFftk2jBUI8D40CMGaxXqnjA3FdYuqM8bVYGtPI8Y/fIZGpb5FhpZ91nQffsbbzFGiTZKBNw6UPPPk7UXenHrCtB2HLLzee2InAdDtWftUH1zC/0PL4C+gS4Bc50myA+UJJbpj31CVK29SQCjGvXg7FwZOtaRwEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqKHBj52; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1837CC4CEF7;
	Sun, 11 Jan 2026 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119683;
	bh=15VB+6hE09IpORerfJ9cs3QzayYtdIP5ByWTlGt3qZ0=;
	h=From:To:Cc:Subject:Date:From;
	b=fqKHBj520f2MDgk71DmE5pqtB/pBMemGe6ljrad1JZT4TjuKzKTHs3xUpJ0K4Tlv7
	 kS7/A7Qj7f6FHcIqZOCnTKWbxC4liAYLtpcFU2lTPOu6nAiYlDoYoUkFsbagYk4hjx
	 /oeAeIyD4g/6QlmHRXuiPhGuV0z/TfFiVYiZjEtj2+8KVb2ZpA5QnWSqMsk5vvuf9z
	 2zZGEX+f1wmTWFlirbnVw4Z57ZhFPuOpza3yBonfV6hLgXOimHNXs2/zTsLzh0SIA+
	 XoqGttk/l45ZEV1dW3wg6KCyo98ksi4A7G6uUd+LsrXwkQfZV/ycd0xkOa/n8lvRu2
	 u3qAfKtz7b0cw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Klara Modin <klarasmodin@gmail.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
Date: Sun, 11 Jan 2026 10:20:34 +0200
Message-ID: <20260111082105.290734-1-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

Order in which early memory reservation for hugetlb happens depends on
architecture, on configuration options and on command line parameters.

Some architectures rely on the core MM to call hugetlb_bootmem_alloc()
while others call it very early to allow pre-allocation of HVO-style
vmemmap.

When hugetlb_cma is supported by an architecture it is initialized during
setup_arch() and then later hugetlb_init code needs to understand did it
happen or not.

To make everything consistent and unified, both reservation of hugetlb
memory from bootmem and creation of CMA areas for hugetlb must be called
from core MM initialization and it would have been a simple change.
However, HVO-style pre-initialization ordering requirements slightly
complicate things and for HVO pre-init to work sparse and memory map should
be initialized after hugetlb reservations.

This required pulling out the call to free_area_init() out of setup_arch()
path and moving it MM initialization and this is what the first 23 patches
do.

These changes are deliberately split into per-arch patches that change how
the zone limits are calculated for each architecture and the patches 22 and
23 just remove the calls to free_area_init() and sprase_init() from arch/*.

Patch 24 is a simple cleanup for MIPS.

Patches 25 and 26 actually consolidate hugetlb reservations and patches 27
and 28 perform some aftermath cleanups.

I tried to trim the distribution list and although it's still quite long
if you feel that someone was wrongly excluded please add them back.

The changes also available in git:
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=hugetlb-init/v3

v3 changes:
* fix empty_zero_page initialization on arm
* fix ZONE_DMA limit calculation on powerpc
* add Acks

v2: https://lore.kernel.org/all/20260102070005.65328-1-rppt@kernel.org
* move the hugetlb and memory map initializaion to mm_core_init_early()
* add Acks

v1: https://lore.kernel.org/all/20251228124001.3624742-1-rppt@kernel.org


Klara Modin (1):
  arm: make initialization of zero page independent of the memory map

Mike Rapoport (Microsoft) (28):
  alpha: introduce arch_zone_limits_init()
  arc: introduce arch_zone_limits_init()
  arm: introduce arch_zone_limits_init()
  arm64: introduce arch_zone_limits_init()
  csky: introduce arch_zone_limits_init()
  hexagon: introduce arch_zone_limits_init()
  loongarch: introduce arch_zone_limits_init()
  m68k: introduce arch_zone_limits_init()
  microblaze: introduce arch_zone_limits_init()
  mips: introduce arch_zone_limits_init()
  nios2: introduce arch_zone_limits_init()
  openrisc: introduce arch_zone_limits_init()
  parisc: introduce arch_zone_limits_init()
  powerpc: introduce arch_zone_limits_init()
  riscv: introduce arch_zone_limits_init()
  s390: introduce arch_zone_limits_init()
  sh: introduce arch_zone_limits_init()
  sparc: introduce arch_zone_limits_init()
  um: introduce arch_zone_limits_init()
  x86: introduce arch_zone_limits_init()
  xtensa: introduce arch_zone_limits_init()
  arch, mm: consolidate initialization of nodes, zones and memory map
  arch, mm: consolidate initialization of SPARSE memory model
  mips: drop paging_init()
  x86: don't reserve hugetlb memory in setup_arch()
  mm, arch: consolidate hugetlb CMA reservation
  mm/hugetlb: drop hugetlb_cma_check()
  Revert "mm/hugetlb: deal with multiple calls to hugetlb_bootmem_alloc"

 .../driver-api/cxl/linux/early-boot.rst       |  2 +-
 Documentation/mm/memory-model.rst             |  3 --
 .../translations/zh_CN/mm/memory-model.rst    |  2 -
 arch/alpha/kernel/setup.c                     |  1 -
 arch/alpha/mm/init.c                          | 16 ++++----
 arch/arc/mm/init.c                            | 37 +++++++++---------
 arch/arm/include/asm/pgtable.h                |  4 +-
 arch/arm/mm/init.c                            | 25 ++----------
 arch/arm/mm/mmu.c                             | 10 +----
 arch/arm/mm/nommu.c                           | 10 +----
 arch/arm64/include/asm/hugetlb.h              |  2 -
 arch/arm64/mm/hugetlbpage.c                   | 10 ++---
 arch/arm64/mm/init.c                          | 39 ++++++++-----------
 arch/csky/kernel/setup.c                      | 16 ++++----
 arch/hexagon/mm/init.c                        | 19 +++------
 arch/loongarch/include/asm/pgtable.h          |  2 -
 arch/loongarch/kernel/setup.c                 | 10 -----
 arch/loongarch/mm/init.c                      |  6 +--
 arch/m68k/mm/init.c                           |  8 ++--
 arch/m68k/mm/mcfmmu.c                         |  3 --
 arch/m68k/mm/motorola.c                       |  6 +--
 arch/m68k/mm/sun3mmu.c                        |  9 -----
 arch/microblaze/mm/init.c                     | 22 +++++------
 arch/mips/include/asm/pgalloc.h               |  2 -
 arch/mips/include/asm/pgtable.h               |  2 +-
 arch/mips/kernel/setup.c                      | 15 +------
 arch/mips/loongson64/numa.c                   | 10 ++---
 arch/mips/mm/init.c                           |  8 +---
 arch/mips/sgi-ip27/ip27-memory.c              |  8 +---
 arch/nios2/mm/init.c                          | 12 +++---
 arch/openrisc/mm/init.c                       | 10 +----
 arch/parisc/mm/init.c                         | 11 +-----
 arch/powerpc/include/asm/hugetlb.h            |  5 ---
 arch/powerpc/include/asm/setup.h              |  4 ++
 arch/powerpc/kernel/setup-common.c            |  1 -
 arch/powerpc/mm/hugetlbpage.c                 | 11 ++----
 arch/powerpc/mm/mem.c                         | 27 +++++--------
 arch/powerpc/mm/numa.c                        |  2 -
 arch/riscv/mm/hugetlbpage.c                   |  8 ++++
 arch/riscv/mm/init.c                          | 10 +----
 arch/s390/kernel/setup.c                      |  2 -
 arch/s390/mm/hugetlbpage.c                    |  8 ++++
 arch/s390/mm/init.c                           | 13 +++----
 arch/sh/mm/init.c                             | 12 +++---
 arch/sparc/mm/init_64.c                       | 17 +++-----
 arch/sparc/mm/srmmu.c                         | 17 ++++----
 arch/um/kernel/mem.c                          | 10 ++---
 arch/x86/kernel/setup.c                       |  5 ---
 arch/x86/mm/hugetlbpage.c                     |  8 ++++
 arch/x86/mm/init.c                            |  8 +---
 arch/x86/mm/init_32.c                         |  2 -
 arch/x86/mm/init_64.c                         |  4 --
 arch/x86/mm/mm_internal.h                     |  1 -
 arch/xtensa/mm/init.c                         | 14 +++----
 include/linux/hugetlb.h                       | 12 ++----
 include/linux/mm.h                            |  5 ++-
 include/linux/mmzone.h                        |  2 -
 init/main.c                                   |  1 +
 mm/hugetlb.c                                  | 13 -------
 mm/hugetlb_cma.c                              | 33 ++++++++--------
 mm/hugetlb_cma.h                              |  5 ---
 mm/hugetlb_vmemmap.c                          | 11 ------
 mm/internal.h                                 |  6 +++
 mm/mm_init.c                                  | 20 ++++++----
 64 files changed, 223 insertions(+), 414 deletions(-)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.51.0


