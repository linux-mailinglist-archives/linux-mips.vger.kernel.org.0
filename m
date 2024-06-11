Return-Path: <linux-mips+bounces-3575-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BA4903A7F
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5371B1F23334
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F06417D37F;
	Tue, 11 Jun 2024 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoE6Sp7K"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6F117D370;
	Tue, 11 Jun 2024 11:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105771; cv=none; b=Oa9Pekzdy37W7QPXFTkHgoc2SUdLNhnIVfgD8mS1z8XunRt49QgxAwPcn0pdBJr+CJYYmJWFSrkTBfTT/tVZ3i0MWIkqygTfPRP/Mfb+rJpQjx3N8tPmoxVehVksqx06mfFYp9mPG6666eUiYyCF1EkRcAx7cwVSD94DdrpjILA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105771; c=relaxed/simple;
	bh=gjN79ppeuDgEdXtGgZv95JiQxwKZq+yKjWg+0of9O4I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UL0cK9YCi40tCX9nCmkhltByllGW/PQXOOoFMeHrua/7h/2H+Qcx8KAlkSUY0GhybEjC6uLxpyl2dqGh7F2M8GhlEQ4xAImSpPo9lcqMOBexJpeD1u2/JrNG/mbv66S4/L6PxOO/7DVdGB+K3H9YE2FQDIvOM1bEnGn9oFVp3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoE6Sp7K; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2c2dee9d9a1so2178164a91.3;
        Tue, 11 Jun 2024 04:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105769; x=1718710569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNOjp4zLTWeiYUMIKl1XAdQRfTNfHRMQuegu2k2+92k=;
        b=eoE6Sp7KBxwS9ZPTu9beKs3JFaNVKATg95YSt6DWT9J8buuzHTpaNdHwUjNQw8R6Qi
         7IXsY2OLNDEhVWp5XzoGGyUTCFjcGUZ+uh05N9t6E1LT/psL5lrwkQ7J3vmlfrQOypNK
         i+xdVs6KxbBbumC2Fhw3keLlzGHWWvhJ6rF9Sta+zTaySeNmIkhMQRbQJEJhX++Ibmze
         +qmtbayksB4pCqft7fGhhU2zZDhIo5F0tc8i5dBUyJgFdwpHIyj9t5NHT01YtKV6f9C4
         LDPjuuM+RnHz666+scXV1fESqJ/5PCfEy4JsdWcSXsRsD2ETiHSToalLkCDuLKKanVzr
         GXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105769; x=1718710569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNOjp4zLTWeiYUMIKl1XAdQRfTNfHRMQuegu2k2+92k=;
        b=pIPzA0mlj3O2ezZyosaMNDIHNSiNmR656QqVjjsRa5Fg9Rp5Jnkgq0Q6hAnt6RygzC
         7IvaRMZA1guOcw+pu0FP17HmPRqE0+F/k+5QvfoaayrXhJ5CTJTs1X/ebrkFDCDbnzI1
         6eyheH+cv2FhkML1mQcTn4uOd1/AKnBUND7qWdpoFNY+1Ul1BMocuZMCEz6m4NdB7vpH
         UQA//1ZY6kZGXT48zaI4gQeJNnBMjdGp0eskT3iBJDD7em9bvJD8R2dWAf75dKFm5CTO
         ltWZj1kBbM0VqJvjb9gcGBBO4zYMEg897wvlpFJv2DZrK4p84SRbTsiYI8CH7wP4G2cB
         Hr5w==
X-Forwarded-Encrypted: i=1; AJvYcCV8uGlxcntKC5pftSJm74knB936AEadnoIwkAcJMK8KRh5a3q+nEWv41VKHncGaicyB2yERPCbJqcNWNZc7eh6NDVyDld5+grCpkN6r6/LiQPQqXwQgS4WoYTpN1IVoCFBt7VZrA2+3zOACMm/oiTV+Ao0GAzt+1l0gBfs4RUA3dDDsI04=
X-Gm-Message-State: AOJu0YxRP1OaVFT007dxX4xmdhCwoKl5kVk7KZGaQdBkyqYFcF5ijz37
	Hnv8Lg31xpARuoq7ZSyXMPpRg4LKomXMf2pzsm4EWlcncvUxiiWXJtnEWw==
X-Google-Smtp-Source: AGHT+IFEoZuq+CeA7n3YPIP/l4GMR/Lw0oqJS+PHSt43uJR6SgRSc8XH5+cV90gZczv7YeogOEupyg==
X-Received: by 2002:a17:90b:4a51:b0:2c2:e790:a54d with SMTP id 98e67ed59e1d1-2c2e790a6b2mr7170006a91.23.1718105769260;
        Tue, 11 Jun 2024 04:36:09 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2c2dd785762sm6705086a91.37.2024.06.11.04.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:36:08 -0700 (PDT)
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
Subject: [PATCH v7 4/5] mips: bmips: setup: make CBR address configurable
Date: Tue, 11 Jun 2024 13:35:36 +0200
Message-ID: <20240611113538.9004-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611113538.9004-1-ansuelsmth@gmail.com>
References: <20240611113538.9004-1-ansuelsmth@gmail.com>
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


