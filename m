Return-Path: <linux-mips+bounces-3236-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A343F8C3181
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 15:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD891F2155F
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 13:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A2B53E1B;
	Sat, 11 May 2024 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHO4HHx5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781C351C3B;
	Sat, 11 May 2024 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715432655; cv=none; b=YVgIES8ZrhxjpvEtBFzlikm/xDNw511PFugsuFAdaUQ3o+U4pdEybb1pGTvB8VlMxvrE9RI37S9N+JmLiE9IXdh6UuZUjPdxo0fOS2h6r1f1u2VIdD03jkWXCMe001o+w1qhmLGwkZ2mu8VtUHiGndYjYPbO58LL0Q6Pl1AtcJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715432655; c=relaxed/simple;
	bh=gjN79ppeuDgEdXtGgZv95JiQxwKZq+yKjWg+0of9O4I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mz/bWg4W2p7GJhMBgbHAQp8+5zFykAz5bG2ih1UFn4qW1DCtU0lXaNUyU7DgXSBGEnk8tlv93pQR94XnI0eBfLdgCR17P1w/uZ4tlnOUCMZ3A49hz2AKosu1c55bN0nMwf1Gh3q4R4MRyBBFLRGQb3DiWHtUQ7xrNcLij4wNPyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHO4HHx5; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e4939c5323so35643431fa.2;
        Sat, 11 May 2024 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715432652; x=1716037452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNOjp4zLTWeiYUMIKl1XAdQRfTNfHRMQuegu2k2+92k=;
        b=EHO4HHx5NZ5t4SWrkKds3B4gRgJzB+SZiFrjOeyZAW6wb9IVXqMMENB7XIVgklS1iE
         koXPAT5wJbvPFCF6YFlurcCZeFAqfF4JfPn07d6DRtXc0vKTbMjlKJnOJo8lWJmhCMc9
         xUtqjlt5yJLRVZ0D113L3KOQCXK0IsIFa6Ooqbv6E5EnBjmXecKxdU5BpKrBUYI8X7NZ
         pXv0P3pEZ2r8BwpyueJnbQU65By9ykQdp48nyA1dCTNlWBI2sTDq5tx2jRajWlDxSa/H
         3cRUXNrMUhfX94tsOTQ08nMhjR8Nl0LjCPpypJ7DplhXp7zI1DZY3/2v7NoWyxOkoRjh
         YeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715432652; x=1716037452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNOjp4zLTWeiYUMIKl1XAdQRfTNfHRMQuegu2k2+92k=;
        b=j+Jj7sfWXdywzKdKcdeRmwLnW2eumnplONl/Yk/mwXjDi9X5Ofqk4xil/N69N1dOJX
         iZ1ZdaUMstExlP29hldVuuzXZXbv59dgtQDz7pVLgXxesauMNRpuX2EJreY7D643rrv4
         JWeXTu8mB4ecMBi2cCl0nlL6W8vGwcwmD4hfZ5h9J1PPFHBT/jSBLt7ccBv7CG3G4Xuv
         CqGSQR/BWr5OY8VyJBpBkzkCh8tZuSN3oE/dkBiyFS8ztPQ9Ceh5bXu1N05Bm4fs7HHK
         ZZN0IqrEnZbX/QvluxJkmh35sJhJI3KaHuWjPHuydpglczB1GSeXoPFh4PF1CCTC1Gju
         p/tw==
X-Forwarded-Encrypted: i=1; AJvYcCW/lXzPVuGg+uF5fmE0eMD/YVk5E/2YEABUZX4rvwyDIxSuRRhvUQzRj+n+LfvHVtjnKnNgRjwFrkh+LAMENwaEM9nvrKPGggOe1R2h8TDEywXckG5IWzjQJNfQqGqkslCDGth1JMe487x2Jm1iHHU/xtPiDcPmoWhsH4veJbapb2UwIvM=
X-Gm-Message-State: AOJu0YwDbiAFXa7EhMi/uNBvaoLzM8/vpto/7Qr+GUs95h10ZbX6EEjG
	1LHGic8lEcZBB3E+k4SM/+AKsWQ5CFjkiJL4UYn4IMD3GGjsnUim
X-Google-Smtp-Source: AGHT+IFK7U6umFCQPR5k7qTHydTHBaabWqYSzySJYm0rRdoWGKmvxAMLSBOAwNx6VHSH3bIF60VQQQ==
X-Received: by 2002:a05:651c:b13:b0:2e1:a8ca:6166 with SMTP id 38308e7fff4ca-2e5205c37a2mr55614381fa.43.1715432651568;
        Sat, 11 May 2024 06:04:11 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42010ca475asm15995495e9.16.2024.05.11.06.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 06:04:11 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] mips: bmips: setup: make CBR address configurable
Date: Sat, 11 May 2024 15:03:47 +0200
Message-ID: <20240511130349.23409-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240511130349.23409-1-ansuelsmth@gmail.com>
References: <20240511130349.23409-1-ansuelsmth@gmail.com>
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


