Return-Path: <linux-mips+bounces-12874-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D4DD15A5E
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74EE130AF1DF
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5467F2C08D0;
	Mon, 12 Jan 2026 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ClrfolXj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o4OXp6fU"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41906296BCF
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258147; cv=none; b=TVYoUqORPx9mjkXzLAfB+Lor7yTm81oZeup4D0ZrBT9BddPmxE2LcodKHKDqjtkpdq6ilnunArRC4F5rPmVJwNLCFcAhZ9qMB0Y6ISzSkKvWYXLjO8Q1kqnlCkQgdzLbaGbso5cRQ2Mexla2ZRY2wccSYM/LJTI3I7RzrW+X6LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258147; c=relaxed/simple;
	bh=Fhwn7JpszU6bR/+bGXbNCU1tXjceD91V/PuflY63sbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ct5zyPBlrAf5MZQNPKk02xDNW8vM5stdxWKrd7Nv2vatmTf1SKM+S55wfzRvuTLMt2+Kh+Kf0vmx7YLdFu/isHo8N6QOs/7cvzAIXTYPZtFUoqZRAy37aLV71xn//LGKfOTC/ZPZQ+dAEecipLpyenAS63vuvHAAiUJYmO1D0Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ClrfolXj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o4OXp6fU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfFkwx/N3FSRHczUBV8rjodXI/sheuEQtcHS0csJM18=;
	b=ClrfolXjlLGXM8fgXL0m51USIp9rk8p0LtjZZibhUY2xfoUHGP5HqlO2ZZHRzG77Ngj15G
	rvazALZ4HefbTdfAKAT9Yhvk85WNTfNNNPW7p4S0cjmB4OZdDw/hDZuvj8lBL2KTnj0mBT
	i5ZCAfFQ+LT/CTgzJxMi+aH24PHuD3o=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-bRsb_TeJMl6WFOMzRKSnqQ-1; Mon, 12 Jan 2026 17:48:53 -0500
X-MC-Unique: bRsb_TeJMl6WFOMzRKSnqQ-1
X-Mimecast-MFC-AGG-ID: bRsb_TeJMl6WFOMzRKSnqQ_1768258133
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c277fe676eso2079650485a.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258133; x=1768862933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfFkwx/N3FSRHczUBV8rjodXI/sheuEQtcHS0csJM18=;
        b=o4OXp6fUmNTBXqwyFVB0nHIp0RkbpLvbupkeCm8ccPugfrU2D7lhQdo72gQZzERQwW
         9MoNXndLMU4yQCAZlO5of9mhOchmkrc1nddyUw9Q3X1tn03KCX+AEEM9KG9eaw0XAmTB
         jsmEDOzRRL1qREu1/vjZEtAv+uIHa8WXdEJCUo1+b9yW8W+5ZdQ2EDRoJ0j2S9vSqmk6
         cEWbFjrrnPvphIOdxSndOeZ3se2nIFu1mIHxESfqWstb8LADZSU5rqfwzphImLt1GCcq
         SR2mYBEtqBGSdFbigLCtjoGCxyQoCHxYSM6scNiOfLudX9hB2h8HLfYJ7imDm2BOHTE/
         dLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258133; x=1768862933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZfFkwx/N3FSRHczUBV8rjodXI/sheuEQtcHS0csJM18=;
        b=HwNGfbOpJZUSfJ0CHkYstagBLfnWTZcU/sWQU56ZHxsR/dvRqAW2TKRrqte1MzlWBM
         TDQdsvmfSQ+8PP1lS6mTbWXklvmMVCoYBaJFmezjKMoHWTSvUsHr0uQog5JOMIxvqs0Q
         +eezblsDDERW7mY9fj2IEURZYST8nBfB4+V845CzAJtIbuY0d1KKV3mprDVaBWiJKtc/
         gaklfmvNO5MSH9fXgzocBa/zepldSqgkPb1IZg7GdjOYx98P0f7SrLQRL+JIG+0XTYRv
         hpyDrG2K/zDYxTNnVtuXj8WyNS1JU6AxPfWBHb+H7yqMIsCLhnyb6CK+KtOdgl8vox5p
         4uKg==
X-Gm-Message-State: AOJu0YxM1YcSDB6AyEzDJz8Rbu7dWWulSOsS7dN3NbBBiDyQrqJ6Z0Dw
	W7nN23f4CuFCttUiaXfTt1ouM2vEuOUyQayX7vifG3HG7jYHGKr/mORYSoh1urbDXzIplrCipy9
	VEndDoiNBHgnYeZDt1BFnFz2W4DzHAzhXQe2XifpWurV+5DZ7Lb0M7TlXpaWRdCE=
X-Gm-Gg: AY/fxX6P6U21KeuNnyFIIM5fshUnSS20fPg4fcBX3vBLAydeGjs3YzwyG5zUBHnB7+f
	nsNRVag9ujrpfLEgw9W/ji0mXyMtPxe4+2taERUjQC0lJrgiFSUubdr02426JE2MG6jfyFz7nl2
	rsqBseCX18XZXwnHJG0ozt9e8EoGuHMbHhV3jezbrnogrV9s+d0aigFd822AcOmkZid3m3J5i2Z
	of0S5XQok+9umptMxGEIr2hcgXUv8ES2s1XJw/fBt7rj54gvJQ3R2Z4zJ2IIZLw6lcrSahYJh5s
	p7eePdUuyF8z0+THikWm5kx3sEUs7Lu+in/QW7urxsbKS4p8Flo4/5eMpAW2aKK56M1vWIjqrYn
	/DuMdAjsQ0cD41YEAsH4lbqBuNGY2qogIaCFncDoGRTJdmb9+Cw==
X-Received: by 2002:a05:620a:290c:b0:8b2:ef70:64e9 with SMTP id af79cd13be357-8c38940915emr2781153385a.51.1768258132705;
        Mon, 12 Jan 2026 14:48:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrFpo44XCfquEvp6xfpFkuDvqBEFL+hrbY772cRuESamNkWJAFxqH4PyNyB8a9su7qVzyt2w==
X-Received: by 2002:a05:620a:290c:b0:8b2:ef70:64e9 with SMTP id af79cd13be357-8c38940915emr2781151385a.51.1768258132356;
        Mon, 12 Jan 2026 14:48:52 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:48:51 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:47:58 -0500
Subject: [PATCH v2 04/16] MIPS: copy pic32.h header file from
 asm/mach-pic32/ to include/platform-data/
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-4-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Fhwn7JpszU6bR/+bGXbNCU1tXjceD91V/PuflY63sbw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7wEV/8zsTW1EpZ9XeXHuO6cU/jdHGHm6g69LXLBj
 WbL+tZ2lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMJHleYwMF3V/h8XPW5AlbSbC
 k/t31hNxXo7l/165z5ga/Z21UHjJC4b/LvOUTjYXleo79d713lDZk7bZQpKR7+MdfuHyogoDg2m
 cAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

There are currently some pic32 MIPS drivers that are in tree, and are
only configured to be compiled on the pic32 platform. There's a risk of
breaking some of these drivers when migrating drivers away from legacy
APIs. It happened to me with a pic32 clk driver.

Let's go ahead and copy the MIPS pic32.h header to
include/linux/platform_data/, and make a minor update to allow compiling
this on other architectures. This will make it easier, and cleaner to
enable COMPILE_TEST for some of these pic32 drivers.

The asm variant of the header file will be dropped once all drivers have
been updated.

Link: https://lore.kernel.org/linux-clk/CABx5tq+eOocJ41X-GSgkGy6S+s+Am1yCS099wqP695NtwALTmg@mail.gmail.com/T/
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
Cc: linux-kernel@vger.kernel.org
---
 include/linux/platform_data/pic32.h | 39 +++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/include/linux/platform_data/pic32.h b/include/linux/platform_data/pic32.h
new file mode 100644
index 0000000000000000000000000000000000000000..f0b395fdb784fa8b7e19029b9ff97f761dbf1088
--- /dev/null
+++ b/include/linux/platform_data/pic32.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Joshua Henderson <joshua.henderson@microchip.com>
+ * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
+ */
+#ifndef __LINUX_PLATFORM_DATA_PIC32_H
+#define __LINUX_PLATFORM_DATA_PIC32_H
+
+#include <linux/types.h>
+
+/*
+ * PIC32 register offsets for SET/CLR/INV where supported.
+ */
+#define PIC32_CLR(_reg)		((_reg) + 0x04)
+#define PIC32_SET(_reg)		((_reg) + 0x08)
+#define PIC32_INV(_reg)		((_reg) + 0x0C)
+
+/*
+ * PIC32 Base Register Offsets
+ */
+#define PIC32_BASE_CONFIG	0x1f800000
+#define PIC32_BASE_OSC		0x1f801200
+#define PIC32_BASE_RESET	0x1f801240
+#define PIC32_BASE_PPS		0x1f801400
+#define PIC32_BASE_UART		0x1f822000
+#define PIC32_BASE_PORT		0x1f860000
+#define PIC32_BASE_DEVCFG2	0x1fc4ff44
+
+#if defined(CONFIG_MACH_PIC32)
+/* Register unlock sequence required for some register access. */
+void pic32_syskey_unlock_debug(const char *fn, const ulong ln);
+#define pic32_syskey_unlock()	\
+	pic32_syskey_unlock_debug(__func__, __LINE__)
+#else
+/* COMPILE_TEST on all other architectures */
+#define pic32_syskey_unlock()
+#endif
+
+#endif /* __LINUX_PLATFORM_DATA_PIC32_H */

-- 
2.52.0


