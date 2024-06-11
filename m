Return-Path: <linux-mips+bounces-3576-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28855903A82
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E2471C231F5
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30E717D899;
	Tue, 11 Jun 2024 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wzhjc4T8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F5217D88D;
	Tue, 11 Jun 2024 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105774; cv=none; b=jsc9iKVQ+CK6IeW2/tnLITtWIRVc75953eUQsibFHUVwD2cRlDNaFFSA9o5C0404JoSLPmsN4ELXj3BRZ6BbIefSLb1uet2n7z7Q8rYFrA+egQfvGttW8oOednWlbxBQrxMbPZ7WSgv58o1b8RzFrZuBTonyP2G/Br9sh7jrvjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105774; c=relaxed/simple;
	bh=wTDGlpwvDV/tYVSnvnYnjRhtXn8bRII9NTQtrKlKeew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gbrXlbOszd4SgE8xnU2MVno4i0oJakTOVr3JerJJxiPHBbMjn0kF7h8gHoUn6v/rzidoRsP8DScjyZSfNMXCOdoLqZD8IqCAWxnEssZWYrCsG11SsuZ/WKcbQr6zqRcN33IHMGLxIUEfMhCQ6a5X9QcQ0g6aQl69H7uov0NeMn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wzhjc4T8; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2c1def9b4b3so877489a91.0;
        Tue, 11 Jun 2024 04:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105772; x=1718710572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUr5nSYv5tY7HQINi2nTpc/x5kG6Ztbr9RxJD3fNnUU=;
        b=Wzhjc4T82qH4VjRs02s20i0NcFre+WGiDWRWKXncK0NY1BD5wNMxsw5AcbgYgfElbe
         KqKhF15BGzgRKugM2l9FuK22iDBzcOKqXEc1DSiKlnPykV5BqC7xy7uBEDhqaGTjl7vs
         EcVi4NVGUAir1Or/bL99zJa4i3fA5e02m57o9AZF7zG7F1qqcPqm7A5PvUVkt3GZvpMr
         EXH9nK6tO8hMOIBGQjk9LGDlYZxQMcD0ClwGcyklCHTw9YB6o3KGnhA18PwRK/UP8d82
         L+iqNXj/nEa7AbxTONI8LNsP1B+2leLaIk8hSY3P6ITsik+bVigBbT/h8xgOi5Hvbj/I
         TZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105772; x=1718710572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUr5nSYv5tY7HQINi2nTpc/x5kG6Ztbr9RxJD3fNnUU=;
        b=UySFLjtfIyz5CFUze72ZHAS2qKmyoYhNjDzPJzkm8OGPvp+GNN9oiO+j64v1heMl/F
         3RFpZ1HM82S3KEBudR9uPxSXQMabQTzETN5tCuvKStHJ9lekrdYnKBdLTDNODoiBVkf7
         Qxu0hbfj8Uvbtj68RdQJ9XrJyxshxB1axIB9PXMj4gybv5gTCzx8VUnCHD9wp/ekj4Ae
         SUzhdviBnDmcbcidxYKGsWMNcqi72vxmB/ItnRUkTXGdDq701qR7KjcZHUECXJ+z1dYF
         J/zR2qRI81OFk/P6G1L18u+J+nkTftoLXAFp9ayyPcoHn56rEL755JAyxFSTbacMugwV
         8Z4A==
X-Forwarded-Encrypted: i=1; AJvYcCWvgLPnGUjytWkA28hblAmTQwZKv+U84vEuAHh6orC0Ns1XZMzgsxeecVHfA3P5OPKlv5ejI35q7cWj1m8H1Pqqqiw2WHtZIKBLFehae19h5ko6nFvCsMj2f2hqWdplim0yNZBP6O7FmzyTHZX8S2YNicfzFZd3PBzgJJRx4OqGaGBUfYc=
X-Gm-Message-State: AOJu0Yz+gmzSKRu7e4AA63rrC6/TAqp4e8v1wYd/bd5Y9ULvOj+P+BLO
	eBf1bzG0Fht9c82Kf5UehXSKuZEmOevTyXVCiRDEa7UgSwkgZhsL
X-Google-Smtp-Source: AGHT+IFUGwaFivizDf0SnGE18XoE7bi8+5EJ03/BzizEhUoZRYPWIZ4N2Kjf0iQkk+nU04BWSQDNgQ==
X-Received: by 2002:a17:90b:4f8c:b0:2c3:195d:8cc1 with SMTP id 98e67ed59e1d1-2c3195d8deamr3897147a91.37.1718105772537;
        Tue, 11 Jun 2024 04:36:12 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2c2dd785762sm6705086a91.37.2024.06.11.04.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:36:12 -0700 (PDT)
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
Cc: =?UTF-8?q?Daniel=20Gonz=C3=A1lez=20Cabanelas?= <dgcbueu@gmail.com>
Subject: [PATCH v7 5/5] mips: bmips: enable RAC on BMIPS4350
Date: Tue, 11 Jun 2024 13:35:37 +0200
Message-ID: <20240611113538.9004-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611113538.9004-1-ansuelsmth@gmail.com>
References: <20240611113538.9004-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Daniel González Cabanelas <dgcbueu@gmail.com>

The data RAC is left disabled by the bootloader in some SoCs, at least in
the core it boots from.
Enabling this feature increases the performance up to +30% depending on the
task.

Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
[ rework code and reduce code duplication ]
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/mips/kernel/smp-bmips.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 20e2fb10022d..e30342af8d91 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -598,6 +598,7 @@ asmlinkage void __weak plat_wired_tlb_setup(void)
 void bmips_cpu_setup(void)
 {
 	void __iomem __maybe_unused *cbr = bmips_cbr_addr;
+	u32 __maybe_unused rac_addr;
 	u32 __maybe_unused cfg;
 
 	switch (current_cpu_type()) {
@@ -626,6 +627,23 @@ void bmips_cpu_setup(void)
 		__raw_readl(cbr + BMIPS_RAC_ADDRESS_RANGE);
 		break;
 
+	case CPU_BMIPS4350:
+		rac_addr = BMIPS_RAC_CONFIG_1;
+
+		if (!(read_c0_brcm_cmt_local() & (1 << 31)))
+			rac_addr = BMIPS_RAC_CONFIG;
+
+		/* Enable data RAC */
+		cfg = __raw_readl(cbr + rac_addr);
+		__raw_writel(cfg | 0xf, cbr + rac_addr);
+		__raw_readl(cbr + rac_addr);
+
+		/* Flush stale data out of the readahead cache */
+		cfg = __raw_readl(cbr + BMIPS_RAC_CONFIG);
+		__raw_writel(cfg | 0x100, cbr + BMIPS_RAC_CONFIG);
+		__raw_readl(cbr + BMIPS_RAC_CONFIG);
+		break;
+
 	case CPU_BMIPS4380:
 		/* CBG workaround for early BMIPS4380 CPUs */
 		switch (read_c0_prid()) {
-- 
2.43.0


