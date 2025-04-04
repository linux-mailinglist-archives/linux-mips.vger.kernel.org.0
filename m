Return-Path: <linux-mips+bounces-8439-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFDEA7B423
	for <lists+linux-mips@lfdr.de>; Fri,  4 Apr 2025 02:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D8127A8FD0
	for <lists+linux-mips@lfdr.de>; Fri,  4 Apr 2025 00:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BDF19D09C;
	Fri,  4 Apr 2025 00:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYv//QHj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A8D19D07C;
	Fri,  4 Apr 2025 00:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725294; cv=none; b=k6Eg6S8jBCpeG4A3YJssK+SsWpLuS71GrsKarl5lyPFrd1tQub9oMntuheqsUZQgrLyGlPFE8ZTC2Qoeubv1Af845qZb74ZN4NBjavVFlmh/0S/dj5IfQ1dazsXzx8GWcp88aicDglRMqnG5fE8Wucl1OUWz3hl8Ne0ZOdI2iSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725294; c=relaxed/simple;
	bh=lUA8vM9tBV4MG0sxT8IeCLiocZpMZjkb3aDRq0kXYeI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CIvPKyG/rBd8+UcT7rtigsEcMrpTXwiWAkvOoxLFQ7JQseChAo8SoosZGRu1wsMlmBCqHTpi2oBbq52Fh5c0YCe5I3inUdi7vgxlERdQ8WMrBv/X9uKOKycxsR9W4tZx0NZyiLLcrexq4380OOVS9lHWEvfS+NFVY+RvqfQP/H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYv//QHj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7097BC4CEE3;
	Fri,  4 Apr 2025 00:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725294;
	bh=lUA8vM9tBV4MG0sxT8IeCLiocZpMZjkb3aDRq0kXYeI=;
	h=From:To:Cc:Subject:Date:From;
	b=iYv//QHjg2u6sAi6pUikFGUgB7sM9iXdsjiEN+hQVGwzKXK7D7n5YVDxaNYarpV6e
	 Rc52X89of5CcWvQD+e9wEJr8V8kbPCeik7mF8p96e8YR1G9fSNhBJ3rsTWfOw1zyYp
	 CoBtTL058jKC1J910LqPPMNkviMkm2AMRjNyo7Zegfw1zRiTyyCbzJUHL5iEArpJZ1
	 H5BnSueQWn4GBQ+dx/2OkAsVIU0KTc07GpwwJHV90lNpWxoDXMLo/JU8dPyQqqr0ni
	 yuZxPj+KKVq5KP+N3gsIxrtBJz2crwmfxpgj9p16FxzQ4THRGCQcABQqda/hpIM5E8
	 8RkUbYZXnT7nA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	paulburton@kernel.org,
	cfu@wavecomp.com,
	jiaxun.yang@flygoat.com,
	arikalo@gmail.com,
	dragan.mladjenovic@syrmia.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 1/6] MIPS: cm: Detect CM quirks from device tree
Date: Thu,  3 Apr 2025 20:08:02 -0400
Message-Id: <20250404000809.2689525-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.291
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
index 611ef512c0b81..159354ac9335b 100644
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
@@ -196,6 +198,18 @@ static void mips_cm_probe_l2sync(void)
 	mips_cm_l2sync_base = ioremap_nocache(addr, MIPS_CM_L2SYNC_SIZE);
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


