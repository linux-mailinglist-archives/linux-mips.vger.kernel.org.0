Return-Path: <linux-mips+bounces-3237-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE88C3184
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 15:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A988B1F2182F
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 13:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD0555C3B;
	Sat, 11 May 2024 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcO22sk9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A7053368;
	Sat, 11 May 2024 13:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715432656; cv=none; b=l+6pmfykZWIrXv2vWdf2j+IdemI2hE7VOI/y+/y3LPjYh1Q+VpwBEAR9oX8N0Jp841gCnqno9cJ9tdUvWIstyctsSF4ZWdgpFFtLmegSdr+PvwdkZIXdyhGXw+SBykn22NhgGOaJApd6+LTOg70uqGkgIDGU9Kigbrv3RQDkIEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715432656; c=relaxed/simple;
	bh=yxOj5YfSwj2DTCNzCutbgmJ5WuKiiT3kbxTl71R4Wu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UO7S1wnTqNZa4YwSwpQEwj99AB7Q0Mt4PK/Qcpj7XvJW8+Vrh7fDzrfQuVV/vv/w4xiUmN1WmKT7eT4IEbzVZBSVP3kmmY1FW0LxyfjPbAg/6sx7yHEdrZHmHZGEhqUXqTgUDqGITQoQyD4bJ/qjRjUefuCBjuUS4GK5kd9L/Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcO22sk9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4200ee47de7so3826155e9.2;
        Sat, 11 May 2024 06:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715432653; x=1716037453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrwA2vIrlWfZjdips+U6g09WGPgGGcS7uLLAmHynIVM=;
        b=RcO22sk9GxqkwZ3rck1Uwsj9MCll4+QgD/Q15jfXjqZpDbtJ+Oepj6hTiSpBWaT/1z
         75p/NOabouYwV90TrlLfxHJHqMMTBdnEDJyv38bPz3TR9Ft+VlHjNekwFlrAL2PvODgG
         SQ7Tq6+/v2ZyiTD0U+1fGek/xqP09XIlFo0+MS7/OcWiZtSsp0Qx3xAHrHc0ebhRByaJ
         JmtwnsAgbFt0KI4UWrLR+W9YDLECzNmFhg1y1uzcCkVwExPvUygI0jDPfdsrcIGR7HXQ
         g/jqjpBGMff+3supla9V4+1lWr17MyniwGSbQRhE6fs0U/NOvbG7wNnNU5p1vipUUIH8
         f1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715432653; x=1716037453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrwA2vIrlWfZjdips+U6g09WGPgGGcS7uLLAmHynIVM=;
        b=totQPlaEJhe5CnhhNefhXv7NjAiXfT9rbJH3Lisk8GLpvXZu8TUm0wFqQeMIAK56iu
         d4rvwFuDpC804/SoDYo/KHiVKnnbNYVn/KcTFdGXM8Da76UP1hNkY8gF0w1fSvr0oK+P
         u2d9aya2SGPeM9GQpIHJ582ZFZY6OFrSQLimyLWo/vksXUdm+9ji/4pB/pPOc/FRkmiP
         anzRMD3LSffZVzIkIlRvdWY6wMYFVzDoh1unGQ3KnANxn6wnTpYMurAEMQZ6New4+VQY
         rDTSjw/NYI//bRwPJXEFfPHJzaKMXZJu+xLX+BmMJr26pgJCDTiO7F6T6VPenb+Mrzn2
         4qmA==
X-Forwarded-Encrypted: i=1; AJvYcCVs6TY97YuvMdfqjkEt/mzK0VfFlH64RfUYFOq65HF6CmXWugPiVtY6OxgNsL2OGuEERs4gXGlfG9e5wTPCEV+PctZG0jmKKeWkRoKD4svmL0lCgKijhqP95xfe13EC0FkINEX7FFCp+Zv/P+mpxsDncmwHnP2Zbi/Y8TVdegGShFTMojU=
X-Gm-Message-State: AOJu0YxzyYYiBVmClSx5S0D1mXgGdMGL2TV5hdVYR6Jt+BLInMehZAja
	wpF+NG+JUfMu9UirD4PGBmk51YLh9FiuWDZ4bhp2cBI0hHB1o3Sb
X-Google-Smtp-Source: AGHT+IH6zVREnewqTrqvb/pUGLF8t9A9Pi6KWKq0s48v6RX42K/A72ugZcftF2KiD4CDa4ZO3tSsYg==
X-Received: by 2002:a05:600c:4286:b0:418:fe93:22d0 with SMTP id 5b1f17b1804b1-41feaa397f7mr35465605e9.11.1715432652606;
        Sat, 11 May 2024 06:04:12 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42010ca475asm15995495e9.16.2024.05.11.06.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 06:04:12 -0700 (PDT)
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
Cc: =?UTF-8?q?Daniel=20Gonz=C3=A1lez=20Cabanelas?= <dgcbueu@gmail.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH v5 4/4] mips: bmips: enable RAC on BMIPS4350
Date: Sat, 11 May 2024 15:03:48 +0200
Message-ID: <20240511130349.23409-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240511130349.23409-1-ansuelsmth@gmail.com>
References: <20240511130349.23409-1-ansuelsmth@gmail.com>
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
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/mips/kernel/smp-bmips.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 20e2fb10022d..52324738cbb3 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -626,6 +626,23 @@ void bmips_cpu_setup(void)
 		__raw_readl(cbr + BMIPS_RAC_ADDRESS_RANGE);
 		break;
 
+	case CPU_BMIPS4350:
+		u32 rac_addr = BMIPS_RAC_CONFIG_1;
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


