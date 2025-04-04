Return-Path: <linux-mips+bounces-8433-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B047A7B321
	for <lists+linux-mips@lfdr.de>; Fri,  4 Apr 2025 02:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07EEB3B5FFF
	for <lists+linux-mips@lfdr.de>; Fri,  4 Apr 2025 00:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B6A1ACED5;
	Fri,  4 Apr 2025 00:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKHq+5D8"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD181EEC3;
	Fri,  4 Apr 2025 00:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725107; cv=none; b=cBRid0RG+Ij+KJ+fms+ij9JpcS5tujixKB1VZDP4nrJn/rqaL03gjhrdXL1ub1CWvMWDK4vsJa+e3oipfLKAmYCeJ1u6aDdwvFlEcq/DJ6S/PtmN93kv7dbPvDNCc1D54a70k151sWSEpFc2OgQ2GpoAMH7CmGzfgVY9kYMlwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725107; c=relaxed/simple;
	bh=r7QFhLqGBIbqEB6bTak6YRf5D6NQBdcSnGBFjIBNgCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s2hleIBPn4XG6MUunF15WOqWfCH4ZLv+lc99nIWfeUin7TFau52xiNDb+ProJNI2MdpihXK3MRouGlt7LbmCMpxD/Wurz0CBE+H3Hm4JXlzs9zdMng5hqa9XdUmmrRhvW12TPAGUdaTLkSOc495GMtKxwJXFdMddCuk7HPbjn70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKHq+5D8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDCFC4CEE3;
	Fri,  4 Apr 2025 00:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725106;
	bh=r7QFhLqGBIbqEB6bTak6YRf5D6NQBdcSnGBFjIBNgCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AKHq+5D8czIVFaOVZ+Ww5F5xT7b/XNpyeNEP3AquzhnAxqOZtJ5/WU6Ww6/y0glyR
	 PzgJx1ojdELA5tXv5GgLGbfETSLHDHbco0CePZ469M/932HxIBpYPfX1PjpCK8LXNv
	 PxXi2zRKg+11bt/LdQgaVHDbJlaplC7q9CxLU5JU+HV2h88p+OuB+ngtkcFJjxZrUC
	 TxmXrSBYlKrL3HdZ0IHAd2o1qD1CWEQSaYhCQDLI6T6Sk4qGUFGL5qVsQQ2MwcYu7b
	 qreg0kMlk+zLAntOLJQE8+UUcUzc867RtWpTln2Sq8USRejjGziLUFvhhrtryTVPNl
	 B9m2yqIyta+Cw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	dragan.mladjenovic@syrmia.com,
	cfu@wavecomp.com,
	jiaxun.yang@flygoat.com,
	paulburton@kernel.org,
	arikalo@gmail.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 05/22] MIPS: cm: Detect CM quirks from device tree
Date: Thu,  3 Apr 2025 20:04:34 -0400
Message-Id: <20250404000453.2688371-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404000453.2688371-1-sashal@kernel.org>
References: <20250404000453.2688371-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
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
index 23ce951f445bb..754e96dba256c 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -59,6 +59,16 @@ extern phys_addr_t mips_cm_l2sync_phys_base(void);
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
@@ -97,6 +107,18 @@ static inline bool mips_cm_present(void)
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
index 3eb2cfb893e19..9cfabaa94d010 100644
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
@@ -237,6 +239,18 @@ static void mips_cm_probe_l2sync(void)
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


