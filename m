Return-Path: <linux-mips+bounces-3570-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E743903A30
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 13:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99BAB28592F
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2024 11:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1437E17C23B;
	Tue, 11 Jun 2024 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1FKzCg9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B7017C20D;
	Tue, 11 Jun 2024 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718105544; cv=none; b=iYXVVGMD7LPM9LaIfX44ZPH4YQzeIxpkZxZzT4Hpj8fkoQ8v4X0L2zFpz0OryPOuU3mZlXNimpp/KQcmvEdrfOvy3yN5UiI/S2pip2PhrAy9iGZgHjaaFPDPT8V6U41yV7hQzyNU/hjceRkr3ePpjiy2f61FGZONXWwwO1j1vec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718105544; c=relaxed/simple;
	bh=wTDGlpwvDV/tYVSnvnYnjRhtXn8bRII9NTQtrKlKeew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lphvQ3xbuC11kojOypYP/rqcMWJDpuECWY8XWwZFomFmX37o2V9B0HlUYaTiqHCZmr2rmLeQ+4sl3z9zjuOgL3yt9wyOlC5/pbiGwO7eHgbocksap/apzfdhuW00gLbz3WCBTOdO5J+duFPAdPfMS6JQRNhI7/CH0MLsSWpmFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1FKzCg9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4217926991fso29620705e9.3;
        Tue, 11 Jun 2024 04:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718105541; x=1718710341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUr5nSYv5tY7HQINi2nTpc/x5kG6Ztbr9RxJD3fNnUU=;
        b=e1FKzCg99nHZM03/ks5kViLDnq+mSXthPv//GiKV99qg/c6A8WQanVHTgvZCyigUyl
         JwCHmMBY6WYpsd6qYvrPWwOShSMy3TzfakI3My0tZSep63smFuOUX5dSzlMG71Q7pG+E
         pkAQytPoZ00jJJcgQLRo7B5sOl4U1M14JX9Xsq+vLk7BzMmFcNHhwqb5NaYqn2wVTZVa
         9SDqCgFK6gG3o+muAP7YSUG+etXt8mXUIwk0rN3osO8s1qiU6BOR71WJ+x6MES1T6lz6
         dMuGp53teUUE5f8AlwjcVfKcrKOw1YxgvnFTQgWihsJQ5NzUvOtSLAEa2p+z5JRoX8Go
         iAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105541; x=1718710341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUr5nSYv5tY7HQINi2nTpc/x5kG6Ztbr9RxJD3fNnUU=;
        b=kcl+u3F1slM3f15GB/WWedOlgKJWJ1W5xa3FFUTYMYIKgCE8SBzeP8vWVYzt5ixE+n
         u1eTp8kTsDpjovYfdTUpLNroJHxqgzDf84SWVH5DV3owb+k6T6FXEpYDTiXAYnLR/ZrZ
         t0SuWrh8BKhWGdng2tudUfy/u7cgdlbJ9ztZmGgAkVSBabok6HugL21VseIOrPBFUxFZ
         mFsZXaTthEBdynKNvcroM9qk2XEqXKIrJ4sgsxVyy5YZNEFBTaBcChG7bjgWmiPWlsNJ
         xE8Gs2d+yv95nLxD7fcMARjt8DQ4RmrhiHcJ+LmPWmjaYhdrvn0Ee9BOI8NPzpUaNj+C
         cqRA==
X-Forwarded-Encrypted: i=1; AJvYcCWubeiJYvaYBnJHXRuZmGC+1y4d8Y81Re5MAQ79pDQD4l9IgJmjSWLmrDNhUzF7YBikSum2A81exLlPBJGpn5i8p4PaQ6OimgEtPwKzTl+oxTOVDI2SZBUmqkqDtwBj+6P0Xv9q2pnionKeYCGap6t44aSSjlJS9DYKpIdQUTMR6yG8hEU=
X-Gm-Message-State: AOJu0YxlScOsFH0Fp6m3TICM9juZp1xSXZqFIgnGd4I8CNQPuxq3EAjh
	Z3n5yER+hKJonSaCcF22nHpV9sOKrwnghaByGBgPdZjXbE/CSOMjco/SqQ==
X-Google-Smtp-Source: AGHT+IHknZho3WwfJIZcfYix14c2tO11q1f1ovDFm6NviLABNMYl+fM8KHPpVL5yeiD3xRWqRerNiQ==
X-Received: by 2002:a05:600c:1d1d:b0:422:5a9c:fdb7 with SMTP id 5b1f17b1804b1-4225a9cffc6mr13062365e9.29.1718105540603;
        Tue, 11 Jun 2024 04:32:20 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4227467990csm2473505e9.1.2024.06.11.04.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 04:32:20 -0700 (PDT)
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
Subject: [PATCH v6 5/5] mips: bmips: enable RAC on BMIPS4350
Date: Tue, 11 Jun 2024 13:32:08 +0200
Message-ID: <20240611113209.8142-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611113209.8142-1-ansuelsmth@gmail.com>
References: <20240611113209.8142-1-ansuelsmth@gmail.com>
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


