Return-Path: <linux-mips+bounces-3181-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 860218C029C
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 19:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F35B31F236C0
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 17:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FECD12AAD0;
	Wed,  8 May 2024 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL8+Vr/1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0A038F9A;
	Wed,  8 May 2024 17:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188064; cv=none; b=SY8Ac7gJJraF/JsjWsI7AcadBcQEqQr4HBTI9aGglHJqxK6bYyd3KPKxtvGt/H2Mh8oIf56GoXtZ7HufLiKEDV03zvVGStbFv28VuKAOEuiNAng1Fi30pJjmpi9IlgMZ7kYg6KGnilx1xAHGjLP0VQ49Ocj2E9W4Pi+5uQt4zPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188064; c=relaxed/simple;
	bh=JlcOFQPjlt6QpzAow7qGWD8usG8/Mww4c6Fy9ThgjZU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkwnKLX8eGtePckuKs8X77YADu/QGcC9oVtZUS5fAwzJJ/tPvDnYC4j5ESeR+/n8TY+K7o9ybXge5cy6E6J3+jCminOGGojIeRvNiMkjS1ZTg5jpEcDU7nA2BVHU7pm98DJ7bvvuKGuldp5EIY4D2quYl5871O/t5ntVu0L6k+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KL8+Vr/1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41c7ac6f635so31189115e9.3;
        Wed, 08 May 2024 10:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715188061; x=1715792861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9LIXMozHspZQG84dPZMvCKK2fcJoE/LYnXv511PO3I=;
        b=KL8+Vr/1rhPDdk+PhPlp4Diq2vQaor+IvLJh4I46y/NvpYGaeam5Gd9P8HX1nsiFS0
         gWDoQC1CpbpaI8Lbx/eZR69N9f7kCUTl6B3MFul2i3TJNQqFAEW6it7qhjHXeF+o5WDG
         nwcCaao6TLS27MVbE9gjL7FhVPDUzTJ58R61wfEGoBKfj9EAgfZRSf2Dqudc5vnzkClW
         4mMKtqsWD1nxfyuvqyrarcRBkmgaz3HZ6EWpYMGObtURDHCoUiUz/GVkOOOJ2t1VXoHx
         JAr6NxnbFCuMSs4mdaX1J70NQt3L9wHaKG4OOTQ6/cDz/e7Y17Es2wqedmE22TwJ81N2
         Oigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715188061; x=1715792861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9LIXMozHspZQG84dPZMvCKK2fcJoE/LYnXv511PO3I=;
        b=i9XIwIadbnRyfHq+CUB3MVcWQx7E4++4Gk/4Se1Nv9FYCkghJnTyWlPtE1vPhhEEuj
         EEUz5fi3FuGgA4kiMM6PjpQbLNeXYLe6Sl6B6uhqJ+9cIvSfbFlIjilDFVFajlwDwNfZ
         02Z1fj/56bvjXJVRAnEOFrJ+gMtvmM+7JsXOVmHFkSr/AI8uzFkROifRyK/7MGTf6JBh
         DzdvwR5IJlr7pcOk2thslHbcRjuhqUmrKUe6ld+UWUY7NU0RKgBBZv1jnq1SsKTAaBe4
         IcLPXIijvbxebjym5783lJ4TltSTk07L2PZQp6QKt4ZIIh/BojSaxs2WmJ9xFUn8bhAV
         eLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv0udZmMUClmMqI3u/Ria1RYb1LGkzP1qAFHdqXXHQ3udagPZPKoQ4ng6NN4sj6xZSMHLfjAvNUx04173yWeOZC2PuN6N7Nw0XU4hMTC5TYTW2No/Gv/1d5AreBTYHOfbu45g3ORFTa9rYo0jYUN5GZziYIht4SZPlcCzexAS/471OWM0=
X-Gm-Message-State: AOJu0YzDbYW+AKB022XJgRWMSaVqvvBdq8SFqvOaOQ1wtHENglYxAthJ
	DSXbJiwDmKjtAmwZhrHY7UXCsoqpGvm6uyQG9KSg0QqFvKxscTzl
X-Google-Smtp-Source: AGHT+IHxdmu8SGnQksk2mkLHyCRBMv8kDO7sVIMBGz+sbOjfEag5EQsEMpq5v5oXfHw0oG2L4/4HAA==
X-Received: by 2002:a05:600c:4755:b0:41b:9e4f:d2b2 with SMTP id 5b1f17b1804b1-41f71cc1c66mr32468325e9.2.1715188060826;
        Wed, 08 May 2024 10:07:40 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id fk12-20020a05600c0ccc00b0041c130520fbsm2921555wmb.46.2024.05.08.10.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:07:40 -0700 (PDT)
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
Subject: [PATCH v3 3/4] mips: bmips: setup: make CBR address configurable
Date: Wed,  8 May 2024 19:07:19 +0200
Message-ID: <20240508170721.3023-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508170721.3023-1-ansuelsmth@gmail.com>
References: <20240508170721.3023-1-ansuelsmth@gmail.com>
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
---
 arch/mips/bmips/setup.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 5e024399222f..01463b2f125d 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -34,7 +34,11 @@
 #define REG_BCM6328_OTP		((void __iomem *)CKSEG1ADDR(0x1000062c))
 #define BCM6328_TP1_DISABLED	BIT(9)
 
-/* CBR addr doesn't change and we can cache it */
+/*
+ * CBR addr doesn't change and we can cache it.
+ * For broken SoC/Bootloader CBR addr might also be provided via DT
+ * with "brcm,bmips-cbr-reg" in the "cpus" node.
+ */
 void __iomem *bmips_cbr_addr __ro_after_init  __read_mostly;
 extern bool bmips_rac_flush_disable;
 
@@ -207,13 +211,35 @@ void __init plat_mem_setup(void)
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
 
-- 
2.43.0


