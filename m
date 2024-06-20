Return-Path: <linux-mips+bounces-3776-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DD4910CE9
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D701280FA6
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90051BD4E3;
	Thu, 20 Jun 2024 16:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YStk8+C9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15231B47CD;
	Thu, 20 Jun 2024 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900764; cv=none; b=M2y0kRAaabNMi1LfaYPl9+w9dOQXC15iRkvUhOcWpRH3pJSYpJZMfeYHj7D7N6893SdO0iUNJQ/RYdQ3VpJEFhSQ6RWwWLbCyvVQUDTkqjWHWaF+MVuPPB0cC2dhAXAJWFe2douelMRKfmK1yuq1xIEwb+k951sirRDmwFZpz3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900764; c=relaxed/simple;
	bh=UVO1myQaPBujoJWRLCLTxNRRBzaTVaHPRY6to3ygN28=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udPw4EPeddW7D0BOJgFcUcw+6Pv8afjgsPMQvEJRW5y3z8J1LIzh3v7JCg8Bfk0cU0/BbN+GYMmAFz1ajHLy8A7lF1NQdCo+fVjyWj9HmTqk7cIfFZYP2/n9s8w4c5O4lf1BPZvFC1jGdVzXIYiapbegO5aonFB4s6Eqp/z2idQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YStk8+C9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35f2d723ef0so873359f8f.1;
        Thu, 20 Jun 2024 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718900761; x=1719505561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRFLTJNPJ/gzxqUXRK709YXx6V+BEgCgQn22f+BOLiI=;
        b=YStk8+C9u/nvIB+CdCH+GAdhoVCvE2vDS+Iq3wWGn123mbxrXXRZBipq74NNtco5x+
         YxS+89QOxQwVBayeUDKkUnKVY3ERHmyXJGW/KYwzNXukmYIQJDB0P+KdTK4ugaE9VDX8
         tP9AJU4P4geoEGAiptf6raslnXQWrzwCuKigARBgoX00neNEI+VKc5kJwXkhv3vOadhq
         FGAj2pBcBLC1qrPeXLU5JIpAh7n9aoesbbmvWPmOJOnfak2evoushC1NsVH29BSQ9Eur
         f4CDQJpwWt5/c7MwrBjqIzmeYRTQI83SqyZ1dqJupKt7zauyDEON7oJbfhM+ErvBt1wc
         /pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718900761; x=1719505561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRFLTJNPJ/gzxqUXRK709YXx6V+BEgCgQn22f+BOLiI=;
        b=rmnK76D+ej8AiPWPvk8yt/p58U+61aLMRs+LZed1AlrWro8mx2G7L+6tzMvog/h4nD
         /DxX6kjDkyMZThdNKo/neVrnIcFbzFlMBlNzgVjWe9CYjP+wiK3v+XKrwm09SV8SP7Yw
         Q105TiD2xQzLQ2DSk6s800PPXtq+ZJ/ztJVUbiJOXw7l8g20fs0se33fP8lYWDpg2Fbd
         PO1W8/9T46bTMrVlQSeup1Z43MM/NGEabrW7al61v53P+gRlb32xqpNwe05bbd0zHH3P
         jtrKsoa5gjEXkkjlSMfyBrvub76lFUYk4Vs2yWnwXV6oZM1MmavY9mAfRF2n3wO8H+NZ
         nT6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEBfEq10HmeuGGzMg9H6JPntfDDY70U8KyybLfuH6zo0kzQOLtZ4Jc0Dk0LodMSsWIWdYp8sfQXQf1t9jLVTOTDCK9ECsrSvHxQFdpd1j7Um2rHZNM+HAOmG4NQZlhOB8n++V0Pvhhcvui98c2pMd0i8OKK9Ayrxpaqg7Qbap8+n6J3Bo=
X-Gm-Message-State: AOJu0Yxm/wD7QkJHzjRQZ8o/mdGiuCNu6N9n97KJpfgDIajaHbmxuUx9
	8HXaNPjwko0eYmLgxEu99WsteTCcdrWxMYC+pM1PPWBXWw88dgDU
X-Google-Smtp-Source: AGHT+IH06avoPKvd9gNdxUypOUzPl1LB5cmhJW7GLSK+E8wgSZxkXh19VV/AyY68iCWVJtBiiw59tw==
X-Received: by 2002:a5d:6d8c:0:b0:365:64a:49b with SMTP id ffacd0b85a97d-365064a051dmr2045122f8f.59.1718900761270;
        Thu, 20 Jun 2024 09:26:01 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-362c7c2dffdsm6277480f8f.35.2024.06.20.09.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 09:26:00 -0700 (PDT)
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
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/4] mips: bmips: setup: make CBR address configurable
Date: Thu, 20 Jun 2024 17:26:44 +0200
Message-ID: <20240620152649.994-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240620152649.994-1-ansuelsmth@gmail.com>
References: <20240620152649.994-1-ansuelsmth@gmail.com>
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
 arch/mips/bcm47xx/setup.c |  6 +++++-
 arch/mips/bcm63xx/setup.c |  6 +++++-
 arch/mips/bmips/setup.c   | 30 ++++++++++++++++++++++++++++--
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index 2f1ee0560aba..247be207f293 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -46,7 +46,11 @@
 #include <bcm47xx.h>
 #include <bcm47xx_board.h>
 
-/* CBR addr doesn't change and we can cache it */
+/*
+ * CBR addr doesn't change and we can cache it.
+ * For broken SoC/Bootloader CBR addr might also be provided via DT
+ * with "brcm,bmips-cbr-reg" in the "cpus" node.
+ */
 void __iomem *bmips_cbr_addr __read_mostly;
 
 union bcm47xx_bus bcm47xx_bus;
diff --git a/arch/mips/bcm63xx/setup.c b/arch/mips/bcm63xx/setup.c
index 16ea8945ae3a..81529084bc75 100644
--- a/arch/mips/bcm63xx/setup.c
+++ b/arch/mips/bcm63xx/setup.c
@@ -23,7 +23,11 @@
 #include <bcm63xx_io.h>
 #include <bcm63xx_gpio.h>
 
-/* CBR addr doesn't change and we can cache it */
+/*
+ * CBR addr doesn't change and we can cache it.
+ * For broken SoC/Bootloader CBR addr might also be provided via DT
+ * with "brcm,bmips-cbr-reg" in the "cpus" node.
+ */
 void __iomem *bmips_cbr_addr __read_mostly;
 
 void bcm63xx_machine_halt(void)
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 6dd166c3d643..2572fd49a6e9 100644
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
 void __iomem *bmips_cbr_addr __read_mostly;
 
 extern bool bmips_rac_flush_disable;
@@ -208,13 +212,35 @@ void __init plat_mem_setup(void)
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
2.45.1


