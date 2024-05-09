Return-Path: <linux-mips+bounces-3194-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0688C17E1
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 22:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55A64B243A5
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 20:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3809085956;
	Thu,  9 May 2024 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmxxrnCZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E7684A27;
	Thu,  9 May 2024 20:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715287690; cv=none; b=bIMemjMUplu+qyVHhLTmIFMZBNhXJZ3J7WuXX8En9B15k/FUBEJK5X7uabD2OY9WnwgiWDODdlbYCNU+k3HfeNhY0tWy6U3z62OCrd8r/wE88BIV38Hyf8dUtWJD5BHegh3NeIzuMHmqeuQVoKmLtw/9KMUqSFJ9VsPWlyirifY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715287690; c=relaxed/simple;
	bh=Boa0W++MtEfVMvcoYhtb+sWsmp9UXce1Ic2gsr2Ycns=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5HW8x+S7OI7Y1JkmQ0w2yI2LuXnXv4Jy0tBKOaTdWZ7Vj4kVITkuaOt5eihAbKuTxQjQlP4lYb/EjMurFIPisWu2br9KytxTZZB+RF9QRTU6ATp5bDq1Eurc+TFo/CVs+WavWF32yndJqrO8ujBGT/uAc7klZr84ovxHMDfOSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmxxrnCZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34d7a32bdd3so751048f8f.0;
        Thu, 09 May 2024 13:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715287686; x=1715892486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrBtYiCsLozGGS79nCKQ9ksxNPOclMZf5RwZh99mGgI=;
        b=ZmxxrnCZ2AxhURq6qmIKsuVOWgXsvvJqqk00EGNPrWh1sKDToof6L9ZoWt4XfsZG8+
         jkb+RBD14B2D+iytMpT9PfvAm+hzfvGjySxOglM5VRMnYUklHczi+ritFosnK4gGN0WK
         LQurWUq0OFeTXx8kHVVr4Iq81BNsd3B8sCqLhLSN8zYYi06/ag7XfyfViGZXuGCPwDVO
         F6u5bQlhZ65kFGrNSUvNtEL/Piy0KS5S3ZzLUqrl0Jhj7Ap7recJvYna2PNkwZmDkVGV
         e5nJc2kmbRupVjAoVvzUSo0R0VxBmdMmY4d5B/wO/6/zNZfhs1jLr1HZZI+6H3fgm/qG
         CtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715287686; x=1715892486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrBtYiCsLozGGS79nCKQ9ksxNPOclMZf5RwZh99mGgI=;
        b=fA68sI4aP4yDs4pB446lGM6Uw6sx+e5+EiQRzWQgb9XPSpGmwdm946eYQmqm4uSYxJ
         YpQjC2pgRB4OhRgV4P9aY3+0IUJBUA6s5qMTJ6RMAcFGy9ERwA9fPp3gcAgDeKk6IEWv
         gEUtIbpUvi/nl+DbKTzybHTfJ/muIsddbAIkxGEKEbhzF7oMb1iywNClBLYX4ZCgaY34
         i2AFjv7CWQTm0B3znBBpL3z3wt21hqxysx41SXyVs+t1HrmxSQ9JNa2i7mn9mAYvIUpL
         iatQQrjDj5Zs5qkWIp2jD6Abv65HNcdfZ5pMyxKyj3aH72mwxCYmThgGCBfMT7+fEqRc
         mjZg==
X-Forwarded-Encrypted: i=1; AJvYcCVN8+yvjU5mOuIak5XsWkBsDyYCuMETmK4sWiRjNLxDSEj90IethZlnZAMsQGBXkkeY50GV/hfwWWJznl4eXb8L1iuZ2z8Xt9Ze3Bwlv5r9hvlR3jcdqF13RObZccALY34phn0fyQ/R0TRfLmW96ye8V1hw7Zi96/P4T8QOkXOeSlfYaPQ=
X-Gm-Message-State: AOJu0Yx3a6AhkZ+JCHcHClSIPUhG6UUZFrj9qD1rIGKMEF00O9oUZFiy
	2APZVgUvYuwdkI8IOxamJjGWrR3deJBkVOP2SPl/69uZhzqxvzjz
X-Google-Smtp-Source: AGHT+IELYeZCQihbs3Y7uTGSSMXh1iSBURoiAMyQwmWko9QNxKs52okkBo8yyhn8MgO4NWx6SqkkvQ==
X-Received: by 2002:a5d:4e10:0:b0:34f:b1dd:c3a1 with SMTP id ffacd0b85a97d-3504a9583bamr464047f8f.54.1715287686319;
        Thu, 09 May 2024 13:48:06 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502bbbbf08sm2588185f8f.96.2024.05.09.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 13:48:06 -0700 (PDT)
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
Subject: [PATCH v4 3/4] mips: bmips: setup: make CBR address configurable
Date: Thu,  9 May 2024 22:47:47 +0200
Message-ID: <20240509204750.1538-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509204750.1538-1-ansuelsmth@gmail.com>
References: <20240509204750.1538-1-ansuelsmth@gmail.com>
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


