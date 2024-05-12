Return-Path: <linux-mips+bounces-3249-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 838FF8C36AC
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 15:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B307D1C20FD8
	for <lists+linux-mips@lfdr.de>; Sun, 12 May 2024 13:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896002C6BC;
	Sun, 12 May 2024 13:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beEkSMMB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC120224FA;
	Sun, 12 May 2024 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715520329; cv=none; b=b+ruF0PWsNcY2aQ8xWQ/svWNjoNH4A8/T2jlusnX+yX4mHbOCg6Si6sbL5qXI2R8zetOUDLqhXEDBDpm03ON1OnCFq0msA/CJYLTc5uikVxorsQZqpPEsLmB72JwtCyTKrnAZOKN6Ug7p6UbQx7+4xLZfIAdm9mKJZDegAQqY80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715520329; c=relaxed/simple;
	bh=cULXUs4oYMOgR/QBf90+qkWOo4Cgu5Y9M6vv7b9LZ54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQOHIUeZRaW00UZd04RGAOOv4dVbCNm7AzHlSY6PXIqEyUm8VavV/JqWRkIkD2rHldJUpcBCslWSBpJA57dCA4jzGQp8KiXY+AJP782OBJF9AzyzFiID7EIgUEge3E4ri36oDIM+VV+/6b6T0NPKgBewsN+r+5N0sUQqCprs1vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beEkSMMB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3504ad82a64so1890885f8f.3;
        Sun, 12 May 2024 06:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715520326; x=1716125126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5Pmi57zjaY4Bk3X2+sKkul6hm94IvXCLST+UV4b4aI=;
        b=beEkSMMBOl7nrB1FYwJ/n8gl9gSvFQFZoLpJA6MWul10N1W+e/O/nHRENk5QInLY4E
         hKb5XsbqbDjzf1ep9P1nDzpeCn/FI1oHjEQPFimcfiYwIjIwCqvsljoNqcwA4bpbqVv3
         LV9sFLV4r/cFMCHs0nhQYXbVz/Ru7NxPdlWQeJ53/ZfcLrf73kpwgHBSnLTc8s94HAR+
         O4T+Ws1QNWQWGzoDeTpO8NkcAInPv2vI9gPxp4gwh9P8bdNWwk1GuI7BKgjHkT33NZvw
         BqYTiuNofjWO9jPKRKCa/CI43ULTEXRruyLKQeB5eRJJYVzKewyhFsx6M70WoKVjQhwX
         ZzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715520326; x=1716125126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5Pmi57zjaY4Bk3X2+sKkul6hm94IvXCLST+UV4b4aI=;
        b=EVEAOyrVicYc8i/ndoMYPD56ezcRA3hcvT4WwQxZPlUNIzsinU0xXVoq0UwbJch409
         aPZiwPwRfaDyvBfuvk2SjrcjPaMQBiBcayQ8+XhN21x9nTLvqMyOc3llxVKwqhVjK9Dr
         EmcT0dPewLM034lk8v5U0plzo0dnUpYcFEIDHbqvTWYVdGxKos8m559164kun4KfSOCw
         D5XoYO4RXDdDVEWPDfBebzluQB4yROWR5g2/kUPdnzBizlI40YgXD4aeVXp9E27JVMR+
         kcer2Z9WQrY6QV2QtXUdV9TXZwRVxPS0kKxOLSQAxfmQvF3dvq7ziwT0jq9uZd8Hv9Qw
         lqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRbSpSlFvbdInxcl8Fsz5LIvwWM3RREp35B1/VnGL7nTggi/ewP9Gj2JPnfgwsog33LSnqrnZWRaUL8rnG7/ZTYbpns68gIoT7mMKzftD0QVnX/I6wFbHr9EugN5/D2nwyD/es44hgEDNraHgyqFHFxPnrzNXoUWjPKSQpMgR9KEXFPJs=
X-Gm-Message-State: AOJu0YxqdygPrYzF9hYL1qMWO08SDbR/o/tulPFGu2UInCSNLNstZLR0
	+4WyerI1yh6xs6QWnwJ/yfOXvM9BwqbIrKNcW4ZrIsKTEGTOrnst
X-Google-Smtp-Source: AGHT+IHG3/XRd6IxAw7eUmVcc5xbSl2lr2OFca3ps7nBLqxTUog370gaVqi8bvEvtL3Tmt7Vfk5big==
X-Received: by 2002:adf:f10e:0:b0:343:e52a:f51e with SMTP id ffacd0b85a97d-3504a954dc2mr4494750f8f.47.1715520326176;
        Sun, 12 May 2024 06:25:26 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3502b79bd09sm8822468f8f.14.2024.05.12.06.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 06:25:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Saravana Kannan <saravanak@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Helge Deller <deller@gmx.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Baoquan He <bhe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Bauer <mail@david-bauer.net>,
	Liviu Dudau <liviu@dudau.co.uk>,
	Serge Semin <fancer.lancer@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/4] of: add support for bootargs-override chosen property
Date: Sun, 12 May 2024 15:25:09 +0200
Message-ID: <20240512132513.2831-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240512132513.2831-1-ansuelsmth@gmail.com>
References: <20240512132513.2831-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some devices bootloader may hardcoded and overwrite the
bootargs DT property passed in "/chosen" when the kernel is
loaded resulting in the value dropped.

While CMDLINE_FORCE can be used, this is not a good option for
kernels that are shared across devices.

This setting enables using "/chosen/bootargs-override" as the
cmdline if it exists in the device tree.

This broken behaviour was found in various devices from ipq806x Soc,
to Mediatek and even PowerPC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/fdt.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a8a04f27915b..253315421591 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1068,8 +1068,16 @@ int __init early_init_dt_scan_chosen(char *cmdline)
 				fdt_totalsize(initial_boot_params));
 	}
 
-	/* Retrieve command line */
-	p = of_get_flat_dt_prop(node, "bootargs", &l);
+	/*
+	 * Retrieve command line
+	 * bootargs might be hardcoded and overwrite by bootloader on
+	 * kernel load.
+	 * Check if alternative bootargs-override is present instead
+	 * first.
+	 */
+	p = of_get_flat_dt_prop(node, "bootargs-override", &l);
+	if (p == NULL || l == 0)
+		p = of_get_flat_dt_prop(node, "bootargs", &l);
 	if (p != NULL && l > 0)
 		strscpy(cmdline, p, min(l, COMMAND_LINE_SIZE));
 
-- 
2.43.0


