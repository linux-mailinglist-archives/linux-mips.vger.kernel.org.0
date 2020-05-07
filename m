Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC7D1C931B
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 17:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgEGPAY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 11:00:24 -0400
Received: from mga03.intel.com ([134.134.136.65]:26836 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727918AbgEGPAY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 11:00:24 -0400
IronPort-SDR: jWKKlZaOhNh8TsZSbovm+A5GINMl81f7RwzCgF7d1x6WapZjSDYUJEjG4qzkMy0UHm3x+K/VJf
 trkb7m/OJUwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 08:00:23 -0700
IronPort-SDR: 4+lFW9Yj7kJIdT+ai15CylOphoSR+eOiOGiYQddow4O8kNGA7yeiAoFRFuZTXUusfeunsTY2e1
 /RFOKnjE4+Mw==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; 
   d="scan'208";a="435314561"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 08:00:21 -0700
From:   ira.weiny@intel.com
To:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Ira Weiny <ira.weiny@intel.com>, Al Viro <viro@zeniv.linux.org.uk>,
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
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH V3 14/15] sparc: Remove unnecessary includes
Date:   Thu,  7 May 2020 08:00:02 -0700
Message-Id: <20200507150004.1423069-15-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150004.1423069-1-ira.weiny@intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

linux/highmem.h has not been needed for the pte_offset_map =>
kmap_atomic use in sparc for some time (~2002)

Remove this include.

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V2:
	New Patch for this series
---
 arch/sparc/mm/io-unit.c | 1 -
 arch/sparc/mm/iommu.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
index 289276b99b01..08238d989cfd 100644
--- a/arch/sparc/mm/io-unit.c
+++ b/arch/sparc/mm/io-unit.c
@@ -10,7 +10,6 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/mm.h>
-#include <linux/highmem.h>	/* pte_offset_map => kmap_atomic */
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index b00dde13681b..f1e08e30b64e 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -12,7 +12,6 @@
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
-#include <linux/highmem.h>	/* pte_offset_map => kmap_atomic */
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-- 
2.25.1

