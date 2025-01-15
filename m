Return-Path: <linux-mips+bounces-7454-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E36A11CBF
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 10:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2F003A18CD
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 09:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF09246A1C;
	Wed, 15 Jan 2025 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J42W4+3N"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2908246A24
	for <linux-mips@vger.kernel.org>; Wed, 15 Jan 2025 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736931744; cv=none; b=Z3uaO8sK/7IPX99kfr4QmT7RAiX0Wgg8ZUXK7hGZW40QIqCu6Y2emYjCW2vKiJelm2AbNAH2NydhOkHoOTXcdzm31TuBAuTjT/1OKIuUlIh6z5DOyxfMuq5X09FMGA/yv6XUHvkH71WjSh/K4rimYDxQl4w0dJVicLLX4DGzSCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736931744; c=relaxed/simple;
	bh=CQrI4BzikTg7apjUtFiQzuHnpuubBKdUNcE8Tkn+Q2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PO9JUzdHjqfzQDQjsYtNj0eiaReTilrC0LS9rp4cxVs9ojdwQAYry7yCfS2SX/zAgVfbEqDapc501Zynq2BbsRxaH8nDcFPH6cfQAqy+E/75f0VqW7/xQErMveXmKLMyPwCEVaTZJ8lOhilGRg6+sh+aIdBPCzXylm+jJUhV4kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J42W4+3N; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736931724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M4BhGmo3QK3F1Ae9T6Q9NLIvZWbckBEUJUup3x6bghs=;
	b=J42W4+3NS83dulomd6cy+5FVPd5G5im8MxofaQPIl9mI3WzR4tK17ospK5nhrEbkKE7WP2
	+wqulD+LGTcTpcmzLwrul0D2v83JssaobF2iEUBZrMOeJ6/2w6LHlIRAB8p5JbJNZIgKYl
	GqlOYm+xvkEBBL27Jle9ZlqNn1Ab5JI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Loongson64: env: Use str_on_off() helper in prom_lefi_init_env()
Date: Wed, 15 Jan 2025 10:01:35 +0100
Message-ID: <20250115090134.918023-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_on_off() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/loongson64/env.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 09ff05269861..be8d2ad10750 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -17,6 +17,7 @@
 #include <linux/dma-map-ops.h>
 #include <linux/export.h>
 #include <linux/pci_ids.h>
+#include <linux/string_choices.h>
 #include <asm/bootinfo.h>
 #include <loongson.h>
 #include <boot_param.h>
@@ -162,7 +163,7 @@ void __init prom_lefi_init_env(void)
 		dma_default_coherent = !eirq_source->dma_noncoherent;
 	}
 
-	pr_info("Firmware: Coherent DMA: %s\n", dma_default_coherent ? "on" : "off");
+	pr_info("Firmware: Coherent DMA: %s\n", str_on_off(dma_default_coherent));
 
 	loongson_sysconf.restart_addr = boot_p->reset_system.ResetWarm;
 	loongson_sysconf.poweroff_addr = boot_p->reset_system.Shutdown;
-- 
2.47.1


