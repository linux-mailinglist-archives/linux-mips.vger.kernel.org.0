Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5AEB1C0817
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 22:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgD3UjC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 16:39:02 -0400
Received: from mga03.intel.com ([134.134.136.65]:22078 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727890AbgD3UjB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 16:39:01 -0400
IronPort-SDR: ZODs9olETWZxq6vIHJIICUyOFs8gHM0Qs2WVKqA6Ct8Lu1+RnD0suwTdffaEOJZIPfXPlRHkQ3
 yZzIR1ejDQSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 13:38:49 -0700
IronPort-SDR: I4KrUIKV1JIB236IcZ/nZ88R5GBVmHR6Cx62c+EO6isHRqV8HMXGZ8LGPtTewSc3X7sQE/xJP4
 Vwm62Pd83kiw==
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; 
   d="scan'208";a="248380175"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 13:38:49 -0700
From:   ira.weiny@intel.com
To:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>
Cc:     Ira Weiny <ira.weiny@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org
Subject: [PATCH V1 00/10] Remove duplicated kmap code
Date:   Thu, 30 Apr 2020 13:38:35 -0700
Message-Id: <20200430203845.582900-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

The kmap infrastructure has been copied almost verbatim to every architecture.
This series consolidates obvious duplicated code by defining core functions
which call into the architectures only when needed.

Some of the k[un]map_atomic() implementations have some similarities but the
similarities were not sufficient to warrant further changes.

In addition we remove a duplicate implementation of kmap() in DRM.

Testing was done by 0day to cover all the architectures I can't readily
build/test.

---
Changes from V0:
	rebase to 5.7-rc4
	Define kmap_flush_tlb() and make kmap() truely arch independent.
	Redefine the k[un]map_atomic_* code to call into the architectures for
		high mem pages
	Ensure all architectures define kmap_prot, use it appropriately, and
		define kmap_atomic_prot()
	Remove drm implementation of kmap_atomic()


Ira Weiny (10):
  arch/kmap: Remove BUG_ON()
  arch/xtensa: Move kmap build bug out of the way
  arch/kmap: Remove redundant arch specific kmaps
  arch/kunmap: Remove duplicate kunmap implementations
  arch/kmap_atomic: Consolidate duplicate code
  arch/kunmap_atomic: Consolidate duplicate code
  arch/kmap: Ensure kmap_prot visibility
  arch/kmap: Don't hard code kmap_prot values
  arch/kmap: Define kmap_atomic_prot() for all arch's
  drm: Remove drm specific kmap_atomic code

 arch/arc/include/asm/highmem.h        | 16 +------
 arch/arc/mm/highmem.c                 | 28 +++----------
 arch/arm/include/asm/highmem.h        |  9 +---
 arch/arm/mm/highmem.c                 | 35 +++-------------
 arch/csky/include/asm/highmem.h       | 11 ++---
 arch/csky/mm/highmem.c                | 43 +++++--------------
 arch/microblaze/include/asm/highmem.h | 29 ++-----------
 arch/microblaze/mm/highmem.c          | 16 ++-----
 arch/microblaze/mm/init.c             |  3 --
 arch/mips/include/asm/highmem.h       | 11 ++---
 arch/mips/mm/cache.c                  |  6 +--
 arch/mips/mm/highmem.c                | 49 ++++------------------
 arch/nds32/include/asm/highmem.h      |  9 +---
 arch/nds32/mm/highmem.c               | 39 +++--------------
 arch/parisc/include/asm/cacheflush.h  |  4 +-
 arch/powerpc/include/asm/highmem.h    | 30 ++------------
 arch/powerpc/mm/highmem.c             | 21 ++--------
 arch/powerpc/mm/mem.c                 |  3 --
 arch/sparc/include/asm/highmem.h      | 23 +---------
 arch/sparc/mm/highmem.c               | 18 +++-----
 arch/x86/include/asm/highmem.h        | 11 +----
 arch/x86/mm/highmem_32.c              | 50 ++--------------------
 arch/xtensa/include/asm/highmem.h     | 28 +------------
 arch/xtensa/mm/highmem.c              | 23 +++++-----
 drivers/gpu/drm/ttm/ttm_bo_util.c     | 56 ++-----------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c  | 16 +++----
 include/drm/ttm/ttm_bo_api.h          |  4 --
 include/linux/highmem.h               | 60 +++++++++++++++++++++++++--
 28 files changed, 159 insertions(+), 492 deletions(-)

-- 
2.25.1

