Return-Path: <linux-mips+bounces-4193-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D335692ABFF
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 00:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A37B1F2271E
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2024 22:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAB44778C;
	Mon,  8 Jul 2024 22:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b="ow4JxeAb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401F3CF63
	for <linux-mips@vger.kernel.org>; Mon,  8 Jul 2024 22:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720477397; cv=none; b=GjAYdNuqeIlDZacANyUYl3A0S1SUqnWX/aFVn2fkoPM8XZHS87F0xBbItPXmZDH156CM4h2lsPUD/pLvndARBIHqiQrJ9hf2lwN7Vz+ENEvCI23iryK4EwJLrvc/HbqDPyeGyttt7AeDk50UUDi21SyJ4h8UdSTdCz9iUZpta6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720477397; c=relaxed/simple;
	bh=w7GVU3jQtPWn54kfYlBwHvTgn8HBxzw9q+dWqc+KuGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DyHL0jGpoCNekgZkrTbrAwgNK4EF1CbSgGGOVQOowwyGncFc/TsWgMO2Sl0fOQ7sgAyQlba8/XRGKSaIfdA4cy8BRCprdeRVbqIFWiosOembTcPbnwFJFDFc1GrtvNtQrkn3c5vIRJ8xFw0z/qemNvizwuV0bCL5q084BDdMXLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de; spf=pass smtp.mailfrom=hauke-m.de; dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b=ow4JxeAb; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hauke-m.de
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4WHzCf323mz9sZh;
	Tue,  9 Jul 2024 00:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1720477390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EILI7mEluGNyoj/hN2Yk9vAClY8q2rkGMUNtshQSy6I=;
	b=ow4JxeAbpT67xkV9T+LlDsiZrkg0j1gciX6l4hsD7eAtql6/bx1NwdjTPqaoiovzZY9n5k
	YB+QDBOo1fDABA4KuRNNgjMBCZiIOyWQNZ+3y0/P0wf10Q0PKP9RBMR+Ga+LIC1NM7i4mC
	nswO4n2Qh7tmQw7LrYjjB8Eg3ACsBgXL6R7gflRRxYAkZA5b+rLTwo4/2sLRYIoyXUHbNk
	9vRrPBmAx8W+v+4xLwSniZYB1Gv5rfCQUXu7qVsCqMYvBd8yeUCBB7xDsr3Foj+WnBLqDN
	Z+BxIpeiDSJABWQ3FomyHrz504ZL7s4ueObGoWRD8/uq5e5iVF9LSON3C48JEQ==
From: Hauke Mehrtens <hauke@hauke-m.de>
To: john@phrozen.org,
	tsbogend@alpha.franken.de
Cc: robh@kernel.org,
	linux-mips@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH] MIPS: lantiq: improve USB initialization
Date: Tue,  9 Jul 2024 00:23:04 +0200
Message-ID: <20240708222304.2728412-1-hauke@hauke-m.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds code to initialize the USB controller and PHY also on Danube,
Amazon SE and AR10. This code is based on the Vendor driver from
different UGW versions and compared to the hardware documentation.

This patch is included in OpenWrt for many years.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 arch/mips/lantiq/xway/sysctrl.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
index 3ed078225222..5a75283d17f1 100644
--- a/arch/mips/lantiq/xway/sysctrl.c
+++ b/arch/mips/lantiq/xway/sysctrl.c
@@ -247,6 +247,25 @@ static void pmu_disable(struct clk *clk)
 		pr_warn("deactivating PMU module failed!");
 }
 
+static void usb_set_clock(void)
+{
+	unsigned int val = ltq_cgu_r32(ifccr);
+
+	if (of_machine_is_compatible("lantiq,ar10") ||
+	    of_machine_is_compatible("lantiq,grx390")) {
+		val &= ~0x03; /* XTAL divided by 3 */
+	} else if (of_machine_is_compatible("lantiq,ar9") ||
+		   of_machine_is_compatible("lantiq,vr9")) {
+		/* TODO: this depends on the XTAL frequency */
+		val |= 0x03; /* XTAL divided by 3 */
+	} else if (of_machine_is_compatible("lantiq,ase")) {
+		val |= 0x20; /* from XTAL */
+	} else if (of_machine_is_compatible("lantiq,danube")) {
+		val |= 0x30; /* 12 MHz, generated from 36 MHz */
+	}
+	ltq_cgu_w32(val, ifccr);
+}
+
 /* the pci enable helper */
 static int pci_enable(struct clk *clk)
 {
@@ -588,4 +607,5 @@ void __init ltq_soc_init(void)
 		clkdev_add_pmu("1e116000.mei", "dfe", 1, 0, PMU_DFE);
 		clkdev_add_pmu("1e100400.serial", NULL, 1, 0, PMU_ASC0);
 	}
+	usb_set_clock();
 }
-- 
2.45.2


