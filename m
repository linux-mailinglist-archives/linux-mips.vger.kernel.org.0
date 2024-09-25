Return-Path: <linux-mips+bounces-5653-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC2398667B
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 20:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23B30B232E4
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 18:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C7C13DB99;
	Wed, 25 Sep 2024 18:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ai95BFHO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE3613D276;
	Wed, 25 Sep 2024 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727289873; cv=none; b=r2VgPv628Po1djHaDlnUWWXSnjmtFzTLRAWe4piMVeGHZDgNO5uhcHxosZALMvXGvhFI0h2rHJ5aE2cmA/A7sdxiKZKmFsJU3KWbxPCnFTwTMne+rhKT5fU/V2Omr897HGkPK79FYFU3IqhwBUsa00hhN//HXEojehoQ1mmi7es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727289873; c=relaxed/simple;
	bh=b48BAUQcmKfgrqydVW9CzOSP9oPk709ucv35xQdCLYM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pgstW79LJRvTW41nLSpHHpG3yLD5nB1BfprXnOy5bVX4kvFYndNTdQMNyDTqOYPOqPD43U5zWZN2G4F2caOg+sIVhM9/XVvwTyG93uhUVE/Vf94OxMYYkByhioB5rRPoEXdR/J7ea1sgQUlMBZIUTUzh3Zjit/wWaNDHs6RtEcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ai95BFHO; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53661ac5ba1so181109e87.2;
        Wed, 25 Sep 2024 11:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727289870; x=1727894670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym+GLj4ZyAaSicWoH1d2a5XwRIYGGvh8r3PdBoUX3FA=;
        b=ai95BFHO1tzzHWw0HI4wETJoJNwCHBQbhF2/Y/Ucj0D4tVIvdqDEdwVTBjXhHAPNns
         J77lrw2DwC5hIJ0SvGJ9zOVL3mvwQrxpR/ejZ9PdR3/uDtzTY4TQGfdWchhVDMsVhg3J
         uYzLZMhECHOoJSuGlrOClo80hSihYOXD1erRINLcvRAIlzGoBKArgdoHFaoRJO/J1CEx
         zRuNPb7rYsFTXDrxWjQWMl7Ww9f7E6sfyGoy+IGOl8iDaxqROLkZrSbGq4+dfI1wqYvu
         RQbctvvzznaGM9A2HLAEIpztE0L69VAJF6xPk3lg4rvq8F1jr3e/D8pw2Wb1YcQl7ppW
         62aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727289870; x=1727894670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ym+GLj4ZyAaSicWoH1d2a5XwRIYGGvh8r3PdBoUX3FA=;
        b=wJPikoo5BvZ/kEX2YuZl0IrH9J994FY1MhTHKC4pjYNTiozdHVlpGBa/mNRZXUFVMJ
         rAcqp/Zisj04d7uwLob3DnnrAPX7PzHSqqptDtZ/OpknKyy37fxJTTPoYul2t7XMjxeD
         xpEDYoJmSHxKj7Aafq/5azxRqiP/MX8Q4J7KNpgfb4Fz3LkNrcnoh8roM34jWSo8GiTu
         sFZfAJIHzgjYxexvEtV7Q9s+i8iM/i8ACZCzAwC3607R0moCivbWjpINBw7+o7VUaf7c
         OCKDH9nQS8MZM3BRn2LMnYV4pJR5WCWzhYhNoFA3R6Q5IUmTD8k1gP7qs5pa2wPkgKJa
         Gvig==
X-Forwarded-Encrypted: i=1; AJvYcCVPCo10iM7a9ip5HUCN0VcAMnjZDMWl1TTul3+nbbaf9OKMwvyEJzS8NyEmH6cEToFlbKN924rpVFvhvLo=@vger.kernel.org, AJvYcCXOhiqCTPing752f+vmBc7bUqqxodFx9Xna2WndMx4unuVAFB1zTZKbpqp669dcsQr8H+hP+QCoLpTurg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMAb/XvdWuYPaEPeEuAtO5SAcscR4/2paxvGYo7pGBb9yD3oQf
	VQvxXfqtzUaanm2+LZUPKm7ttfJuHStJanLeLeyhFWcAVabwM8Sx
X-Google-Smtp-Source: AGHT+IEk2OrwkxQTAWeXQ0RdD+vQJJDoq5EzX9eI0O3n8szE90Zduy2yaDoyLnPK6IcnhAb4tiLY/g==
X-Received: by 2002:a05:6512:3083:b0:530:ea60:7e07 with SMTP id 2adb3069b0e04-53877568f5cmr2030881e87.58.1727289869519;
        Wed, 25 Sep 2024 11:44:29 -0700 (PDT)
Received: from KILLINGMACHINE.itotolink.net ([46.188.27.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a8640a63sm588747e87.156.2024.09.25.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 11:44:28 -0700 (PDT)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	alexandre.belloni@bootlin.com,
	gregory.clement@bootlin.com,
	lars.povlsen@microchip.com,
	UNGLinuxDriver@microchip.com,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH 1/2] irqchip/ocelot: Fix trigger register address
Date: Wed, 25 Sep 2024 21:44:15 +0300
Message-Id: <20240925184416.54204-2-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240925184416.54204-1-matsievskiysv@gmail.com>
References: <20240925184416.54204-1-matsievskiysv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use main interrupt trigger registers instead of device interrupt trigger
registers.

Controllers, supported by this driver, have two sets of registers:
* (main) interrupt registers control peripheral interrupt sources;
* device interrupt registers configure per-device (network interface)
interrupts and act as an extra stage before the main interrupt registers.

In the driver unmask code, device trigger registers are used in the mask
calculation of the main interrupt sticky register, mixing two kinds of
registers. Use main interrupt trigger register instead.

Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
---
 drivers/irqchip/irq-mscc-ocelot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mscc-ocelot.c b/drivers/irqchip/irq-mscc-ocelot.c
index 4d0c3532dbe7..c19ab379e8c5 100644
--- a/drivers/irqchip/irq-mscc-ocelot.c
+++ b/drivers/irqchip/irq-mscc-ocelot.c
@@ -37,7 +37,7 @@ static struct chip_props ocelot_props = {
 	.reg_off_ena_clr	= 0x1c,
 	.reg_off_ena_set	= 0x20,
 	.reg_off_ident		= 0x38,
-	.reg_off_trigger	= 0x5c,
+	.reg_off_trigger	= 0x4,
 	.n_irq			= 24,
 };
 
@@ -70,7 +70,7 @@ static struct chip_props jaguar2_props = {
 	.reg_off_ena_clr	= 0x1c,
 	.reg_off_ena_set	= 0x20,
 	.reg_off_ident		= 0x38,
-	.reg_off_trigger	= 0x5c,
+	.reg_off_trigger	= 0x4,
 	.n_irq			= 29,
 };
 
-- 
2.39.2


