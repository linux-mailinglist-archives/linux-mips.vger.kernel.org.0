Return-Path: <linux-mips+bounces-8438-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB5A7B3FB
	for <lists+linux-mips@lfdr.de>; Fri,  4 Apr 2025 02:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F2383BA813
	for <lists+linux-mips@lfdr.de>; Fri,  4 Apr 2025 00:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CA04438B;
	Fri,  4 Apr 2025 00:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNqn4YKK"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DCF27702;
	Fri,  4 Apr 2025 00:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725277; cv=none; b=VbrMhaGv5JpvOL1ASvidIWKuP4bPRLyjP2EpZLnZg/5BlGyHPzjj/r+3Az4t1Em5JPgvAdqw1LKL4TjSkVuriVRMWngK9lwVJLOcM4G8/ZrUrvww+qKulu4P0kraSYASLSaSVHn9vGMxG6DK4FnypuZVLpcXMkqPgrg1Euk9sfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725277; c=relaxed/simple;
	bh=oTb/ghaePPjugbB2nSj52nDQE+v65tgCfB294euWeXw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pey7rEeGvmuFMfm3Smg/yqHfBnLN4JJNlw6FYUIoJNR+r4kPsgQCyP0MAZ3GjIfaNKJFu9IjK2qmuKfYJ85CnBWI19cvZDcHOGKcgZWKPTXfib5JPIQS3EkVFWxGgBJqgB4flMAal7DClUP9NemlTr5tHMy75f1cyZf79lWprqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rNqn4YKK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B966DC4CEE3;
	Fri,  4 Apr 2025 00:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725277;
	bh=oTb/ghaePPjugbB2nSj52nDQE+v65tgCfB294euWeXw=;
	h=From:To:Cc:Subject:Date:From;
	b=rNqn4YKKoNzeWNSXi2PBRGlDuNnuPBKkESqrg0qxzIUMdNxOz5amw8KMkBTaPGbY4
	 ZYZh7+t8Gr0EfnlBHCawH2PtV4fWJIXtNB4etgNmy51bl7kDNvU26SPbvzuaprEPvi
	 PncX5/kEpWkV/99NfIFcu1JnMxd6KJGJJxp9FfVeC80QZrP//gpNb9t/FoJqWTbP7I
	 Gyx+Y9j3vWSVoOWRlz2SwH4DnRnxCpR/sfsJiYNAwyAVzaJCr2YHOxc8ExlA67AGIG
	 DotonKyrTOijCdc9n9UpTipMW2hdVF0mZUGNgTWgfjYYPWGqIk8FlN41pblJhT7c+z
	 NE+NK+aaM6tEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	jiaxun.yang@flygoat.com,
	dragan.mladjenovic@syrmia.com,
	paulburton@kernel.org,
	cfu@wavecomp.com,
	arikalo@gmail.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 1/6] MIPS: cm: Detect CM quirks from device tree
Date: Thu,  3 Apr 2025 20:07:44 -0400
Message-Id: <20250404000751.2689430-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.235
Content-Transfer-Encoding: 8bit

From: Gregory CLEMENT <gregory.clement@bootlin.com>

[ Upstream commit e27fbe16af5cfc40639de4ced67d1a866a1953e9 ]

Some information that should be retrieved at runtime for the Coherence
Manager can be either absent or wrong. This patch allows checking if
some of this information is available from the device tree and updates
the internal variable accordingly.

For now, only the compatible string associated with the broken HCI is
being retrieved.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/include/asm/mips-cm.h | 22 ++++++++++++++++++++++
 arch/mips/kernel/mips-cm.c      | 14 ++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 696b40beb774f..0f31324998c0a 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -47,6 +47,16 @@ extern phys_addr_t __mips_cm_phys_base(void);
  */
 extern int mips_cm_is64;
 
+/*
+ * mips_cm_is_l2_hci_broken  - determine if HCI is broken
+ *
+ * Some CM reports show that Hardware Cache Initialization is
+ * complete, but in reality it's not the case. They also incorrectly
+ * indicate that Hardware Cache Initialization is supported. This
+ * flags allows warning about this broken feature.
+ */
+extern bool mips_cm_is_l2_hci_broken;
+
 /**
  * mips_cm_error_report - Report CM cache errors
  */
@@ -85,6 +95,18 @@ static inline bool mips_cm_present(void)
 #endif
 }
 
+/**
+ * mips_cm_update_property - update property from the device tree
+ *
+ * Retrieve the properties from the device tree if a CM node exist and
+ * update the internal variable based on this.
+ */
+#ifdef CONFIG_MIPS_CM
+extern void mips_cm_update_property(void);
+#else
+static void mips_cm_update_property(void) {}
+#endif
+
 /**
  * mips_cm_has_l2sync - determine whether an L2-only sync region is present
  *
diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 72c8374a39002..a0d9cde26dc5b 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/errno.h>
+#include <linux/of.h>
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 
@@ -14,6 +15,7 @@
 void __iomem *mips_gcr_base;
 void __iomem *mips_cm_l2sync_base;
 int mips_cm_is64;
+bool mips_cm_is_l2_hci_broken;
 
 static char *cm2_tr[8] = {
 	"mem",	"gcr",	"gic",	"mmio",
@@ -238,6 +240,18 @@ static void mips_cm_probe_l2sync(void)
 	mips_cm_l2sync_base = ioremap(addr, MIPS_CM_L2SYNC_SIZE);
 }
 
+void mips_cm_update_property(void)
+{
+	struct device_node *cm_node;
+
+	cm_node = of_find_compatible_node(of_root, NULL, "mobileye,eyeq6-cm");
+	if (!cm_node)
+		return;
+	pr_info("HCI (Hardware Cache Init for the L2 cache) in GCR_L2_RAM_CONFIG from the CM3 is broken");
+	mips_cm_is_l2_hci_broken = true;
+	of_node_put(cm_node);
+}
+
 int mips_cm_probe(void)
 {
 	phys_addr_t addr;
-- 
2.39.5


