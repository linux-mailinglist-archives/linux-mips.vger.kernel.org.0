Return-Path: <linux-mips+bounces-3569-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B262B903A2E
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53DC72810D5
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA33617C216;
	Tue, 11 Jun 2024 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXoVRNs6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F367517BB34;
	Tue, 11 Jun 2024 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105542; cv=none; b=bfMPski6dbTzP7eEcB0zdGjWI6o+rvtu8oLDLp/naPqW1aIGJoaT8hROqMf+o5I4UiOXAR7V843bGtesdbV8fum5oH4XEK6ZhXsxvhG5gXSKwyFJmt3sqScy4Vcm1vAhp0cpxRnzwjj+9zDH0DOWleoGREfb0qy6/eF4V8mTIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105542; c=relaxed/simple;
	bh=gjN79ppeuDgEdXtGgZv95JiQxwKZq+yKjWg+0of9O4I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptGsXcBKtz3nXEI30l1ZZGhrUzV/IuiZLI01x9uzvLy+97h3hae4cGvYn9Toq5UCllya05u2d8IeEHWNAbscBnSml+3rodsCFY9ozV17AcO6SE6trodHelFuhBZ3/ZSl79Q0EScStlH/laear/BADWJ0K8RQ9YhV7/iYLCmnMTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXoVRNs6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42172ab4b60so30495685e9.0;
        Tue, 11 Jun 2024 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105539; x=1718710339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNOjp4zLTWeiYUMIKl1XAdQRfTNfHRMQuegu2k2+92k=;
        b=SXoVRNs6Ndenbr4QklfC5dJRSIxeBvLyih70b8wUjFIV8wbJfyG0+i/0yE47yf8Uyo
         0AHQF08v7zafgKpfw7n9/RTCpQEhd/84CorVNaSElQvwM3033gDqzCpuByB1xViYfezi
         hbxy/aW32VyRKJVaBYa0q6WrFEIZOb3NqH8Z+m8wSRL6vCVjdBKDNr7/U/mIpLFhc/NZ
         wgbI3mS4mVhT885FU3amydck3SzJ7sVZ/CHwz/BetSV54vDkCM8NnDxkvQN3PIVCxlgu
         rGGkhCCl/TZh7jukxxx7A41ZIcdSl6kEVOA/bwWBFIoQ8UPOB5x+v2jcKYiP3JqMKxU7
         zntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105539; x=1718710339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNOjp4zLTWeiYUMIKl1XAdQRfTNfHRMQuegu2k2+92k=;
        b=ABgixQtLzuXZARgdGUisZj7VuCMOMlaytYoxY7vwaGQika18O6mcdEsetILqHZzDzz
         K/S2gvLJ/PkbeYYo6K31aLBzMN+/wm3L0u4ZEgo/DeRH24JrEUrqO8/leCVDZGySw8pS
         LiSaNp5bPC4wVE2exGT8kBNjbewbpCf4BHWbUIvCFFDWKuqxRVJr2vTG9EO/2jiLTuQU
         VbpTckwRugalMgYsD3IYnoPYIG/69Yz4YM2lhneuMsRXgZLK1+423CRT1mWyN/0ZZI2C
         vzvvj+HQCv8ST/sDdgvf0+9URjc6AIzmqzQ+UyTjQgfJmNBuTS4vA4OgmSz6B8EOGIQv
         tqYA==
X-Forwarded-Encrypted: i=1; AJvYcCV0xxRKsgXX0zmDLtMyYJxFWMsVibwxvezsODTlUtrqlPwMZ2rWVz3Us2/tG64NYzKDOWrgB9Na8LgjvhHVQ2UIKug/BQfJMDWO/RL40ZqGK99ekP+szpal47siREPoL0laPy1wOQA2xcHAlKMvxegQW8Fiz1w3UFLlBz2u12XY1AMPfRo=
X-Gm-Message-State: AOJu0YyebQpRuwATpILW5dQjx3MiY0vWCebqqIkJ6+Kj+KIlH99tzAV8
	fIiisirFqZbKuXnJlgpYPV1x8NNzkZX3KRljg7ngzpwiZnOBVGN4
X-Google-Smtp-Source: AGHT+IGoEpHx30CljJ4XSzkjcNVYajHcqgxCLQW9MSOTWpsGTqC3JX/Dv4Hfrfx08attDnLhrbMgmg==
X-Received: by 2002:a05:600c:19d2:b0:421:8045:6221 with SMTP id 5b1f17b1804b1-42180456a56mr60233545e9.30.1718105539345;
        Tue, 11 Jun 2024 04:32:19 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4227467990csm2473505e9.1.2024.06.11.04.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:32:18 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/5] mips: bmips: setup: make CBR address configurable
Date: Tue, 11 Jun 2024 13:32:07 +0200
Message-ID: <20240611113209.8142-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611113209.8142-1-ansuelsmth@gmail.com>
References: <20240611113209.8142-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to provide CBR address from DT to handle broken
SoC/Bootloader that doesn't correctly init it. This permits to use the
RAC flush even in these condition.

To provide a CBR address from DT, the property "brcm,bmips-cbr-reg"
needs to be set in the "cpus" node. On DT init, this property presence
will be checked and will set the bmips_cbr_addr value accordingly. Also
bmips_rac_flush_disable will be set to false as RAC flush can be
correctly supported.

The CBR address from DT will overwrite the cached one and the
one set in the CBR register will be ignored.

Also the DT CBR address is validated on being outside DRAM window.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/mips/bmips/setup.c      | 24 +++++++++++++++++++++++-
 arch/mips/kernel/smp-bmips.c |  6 +++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index dba789ec75b3..c7d83f0c7b05 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -205,13 +205,35 @@ void __init plat_mem_setup(void)
 void __init device_tree_init(void)
 {
 	struct device_node *np;
+	u32 addr;
 
 	unflatten_and_copy_device_tree();
 
 	/* Disable SMP boot unless both CPUs are listed in DT and !disabled */
 	np = of_find_node_by_name(NULL, "cpus");
-	if (np && of_get_available_child_count(np) <= 1)
+	if (!np)
+		return;
+
+	if (of_get_available_child_count(np) <= 1)
 		bmips_smp_enabled = 0;
+
+	/* Check if DT provide a CBR address */
+	if (of_property_read_u32(np, "brcm,bmips-cbr-reg", &addr))
+		goto exit;
+
+	/* Make sure CBR address is outside DRAM window */
+	if (addr >= (u32)memblock_start_of_DRAM() &&
+	    addr < (u32)memblock_end_of_DRAM()) {
+		WARN(1, "DT CBR %x inside DRAM window. Ignoring DT CBR.\n",
+		     addr);
+		goto exit;
+	}
+
+	bmips_cbr_addr = (void __iomem *)addr;
+	/* Since CBR is provided by DT, enable RAC flush */
+	bmips_rac_flush_disable = false;
+
+exit:
 	of_node_put(np);
 }
 
diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 555a5b449ca8..20e2fb10022d 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -46,7 +46,11 @@ int bmips_smp_enabled = 1;
 int bmips_cpu_offset;
 cpumask_t bmips_booted_mask;
 unsigned long bmips_tp1_irqs = IE_IRQ1;
-/* CBR addr doesn't change and we can cache it */
+/*
+ * CBR addr doesn't change and we can cache it.
+ * For broken SoC/Bootloader CBR addr might also be provided via DT
+ * with "brcm,bmips-cbr-reg" in the "cpus" node.
+ */
 void __iomem *bmips_cbr_addr __read_mostly;
 
 #define RESET_FROM_KSEG0		0x80080800
-- 
2.43.0


