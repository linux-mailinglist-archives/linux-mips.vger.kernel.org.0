Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574091B8C9D
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 07:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgDZFyV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 01:54:21 -0400
Received: from mga05.intel.com ([192.55.52.43]:34948 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbgDZFyV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 01:54:21 -0400
IronPort-SDR: mhbP6M0vOROTf19G/v4XotjAsT4ouLrU2kIiSnOHMqit70Y+/7WaUpLvABrkzh/MUw5yK8jjAK
 2dcdVo/YkC0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 22:54:21 -0700
IronPort-SDR: /cZ3umTa8B8PLh9tjA9EP3+bxl80qczghY2Si7yQnbojuyuxqol2zAYPUansPdHYwpezKRfg9s
 EcpTlSW8XTMQ==
X-IronPort-AV: E=Sophos;i="5.73,319,1583222400"; 
   d="scan'208";a="281313737"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 22:54:20 -0700
From:   ira.weiny@intel.com
To:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
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
        linux-xtensa@linux-xtensa.org
Subject: [PATCH 0/5] Remove duplicated kmap code
Date:   Sat, 25 Apr 2020 22:54:01 -0700
Message-Id: <20200426055406.134198-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

The kmap infrastructure has been copied almost verbatim to every architecture.
This series consolidates obvious duplicated code.  (k[un]map_atmoic has some
additional duplication between some of the architectures but the differences
were such to not warrant further changes.)

0day built successfully to cover all the architectures I can't readily build.

Ira Weiny (5):
  arch/kmap: Remove BUG_ON()
  arch/kmap: Remove redundant arch specific kmaps
  arch/kunmap: Remove duplicate kunmap implementations
  arch/kmap_atomic: Consolidate duplicate code
  arch/kunmap_atomic: Consolidate duplicate code

 arch/arc/include/asm/highmem.h        | 11 -------
 arch/arc/mm/highmem.c                 | 20 ++-----------
 arch/arm/include/asm/highmem.h        |  3 --
 arch/arm/mm/highmem.c                 | 28 ++----------------
 arch/csky/include/asm/highmem.h       |  3 +-
 arch/csky/mm/highmem.c                | 28 ++++--------------
 arch/microblaze/include/asm/highmem.h | 17 -----------
 arch/microblaze/mm/highmem.c          | 10 ++-----
 arch/mips/include/asm/highmem.h       |  3 +-
 arch/mips/mm/highmem.c                | 25 +++-------------
 arch/nds32/include/asm/highmem.h      |  3 --
 arch/nds32/mm/highmem.c               | 31 ++------------------
 arch/parisc/include/asm/cacheflush.h  |  2 --
 arch/powerpc/include/asm/highmem.h    | 17 -----------
 arch/powerpc/mm/highmem.c             |  9 ++----
 arch/sparc/include/asm/highmem.h      | 17 -----------
 arch/sparc/mm/highmem.c               |  9 ++----
 arch/x86/include/asm/highmem.h        |  4 ---
 arch/x86/mm/highmem_32.c              | 30 ++------------------
 arch/xtensa/include/asm/highmem.h     | 14 +--------
 arch/xtensa/mm/highmem.c              | 10 ++-----
 include/linux/highmem.h               | 41 +++++++++++++++++++++++++--
 22 files changed, 75 insertions(+), 260 deletions(-)

-- 
2.25.1

