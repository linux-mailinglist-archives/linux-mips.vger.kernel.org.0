Return-Path: <linux-mips+bounces-12793-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D0769D0B547
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D35430508A5
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D331E3644A6;
	Fri,  9 Jan 2026 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DNn/tOHA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hjUiqcOV"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624313644CD
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976917; cv=none; b=ou1NgXPpSCHnhHQYN/qCIyYjNEcfYjjhp3Ta46U1uzIn3VAxmjyV/3f5HzaDsxlqWy3YzQhmGQ7jlcOto9mKy1cPntOh71jPhzaPmi6jTCaqCXWCV2QysN/KyVHEWvdtwFWPPw1GIQkX4HExE1Z6PlZqtUUrxi8PXHY8Cpuawx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976917; c=relaxed/simple;
	bh=3pGQvenJ9ZmREItlzAsp+wrnhPY/izeuPzFZI4ZvsaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTv5Lbbsma/1agFGTMR2g77iQ6p7WKeElrBoET4oMv1OkObDFXrSq2+4fgNRiEgfXZG1XWdqOQmikjlxtXAdMaQDYWX5/0yaO9ZkFyXAcik0a32qZ70fY3c/muUr/n7u6KlRb5kza+HVgOU5qXeQ3DbgZS4wlpxNPXAOPrc4RRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DNn/tOHA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hjUiqcOV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QCscfpmeXBc/eil0hCnzwdDj5dsujSakb0zZ//5eZvU=;
	b=DNn/tOHAF77tHSbUYl1mixSLwY5KrhGMkJbkgIQi7GK0rw9zbssshvDcFRQm4bHsL8+nOC
	Bf9FR8h+UKVrX+y0szYsGIdQlayCqu8hs9bS+eR82jKWIM+Gv8YUDr56GtXouziD4ZZAJ0
	XWeVxUsPU6PFAyVreLSp+INR6CGjnFU=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-8Zv0_WkAP6i5wy5XrsClyg-1; Fri, 09 Jan 2026 11:41:54 -0500
X-MC-Unique: 8Zv0_WkAP6i5wy5XrsClyg-1
X-Mimecast-MFC-AGG-ID: 8Zv0_WkAP6i5wy5XrsClyg_1767976914
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f568048ccso4819024241.2
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976914; x=1768581714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCscfpmeXBc/eil0hCnzwdDj5dsujSakb0zZ//5eZvU=;
        b=hjUiqcOVyqUACELSRBvq8/Qu1QTug+0djXJNr5f0/zNm6HEQohewiLkNKoC6RIfHEj
         sDERZbfmsf0OjTzLFfD5bPqRwOqhkSnRU+3WQe0TBq06idj47ww8jXUZtXtz/X8z3yTQ
         GjgRrNia85cDD8DfDtHkhZninVWzoiyz3UIzNgO8JkuCT2TA1m3x2InX1huBvfBopv1p
         isYyj5gDfd5lQ62IZ6WFMtKneAj8qqbVdcjCf5Y74VPoJQBdbf3uRY2i7OhTednlgnAx
         /7VxHKYkoXosCPA9VO1ge71J+csQfM/fBYIm7V0/n4c+u6XU2PAz0oCgyyy8g2Z0XgTv
         7w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976914; x=1768581714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QCscfpmeXBc/eil0hCnzwdDj5dsujSakb0zZ//5eZvU=;
        b=bZ6H5Zab6C8QSDguTSR88nPiBeDemoZ3qObpwWwYFyJ5LheeRpZ4bmISTZvBHDWBKt
         wu79rcmXmWJPpoeF6A4w/2mLPQ2OPe08qIHPhKf2exz39SUNTVVBkQT10CnxhD7/4oBS
         TRnwZrYWCulqav89ws4LrrkA3M/WHQKsCjPsE2gajeYV//dNzVKFi/fHZH8bcRMRMxQf
         nL4bf0eK28IuIcRHWEKS5KjSq2oESjY5X25AYfmjdwOaDmb54tzoq4i7q5qYudvdR5ta
         Yoka6BeJZciUT++KqEyaQaekp7sXqRJ2AAe3KIo9m56qmFG1BpZzBAUGLeBI0HHKVLo+
         Svfw==
X-Gm-Message-State: AOJu0YzfLH1zbV6DUiHn1U0ez6w6yIuiKReTG2eU6YM6KBed9aS2rMzv
	GkQf9VaDk/HoUPwyrq9FlpV2ARGf+q0wNy0c5bkAv93rkJqXo9RY9TA73wC1fZdGiq4wr+4MJ0x
	GDQW13uJ5f2wcWT+CtnKWGJ/hCjuqXvApuYfC/CvJO4yKP6bYYG1XYkWOmVvrfNk=
X-Gm-Gg: AY/fxX4OqLiEkLzdYtR7Vd+esHQ2zwl+niNyA6Wgc2l52gsmHhyNtBL2GyUO1CTHnlh
	fAVhxWM4E4VyGLjPsQ16WybsAO1MZBXCo2xpUDtpcU7e34Pev1qLqeuTAhKl9YAgBgHE7WhdA74
	S2o0roFKFpXLF9FhkQ8HjkL2CyitBhy08D1yp+Kkdj7NKW6V6ywHYl9hrbUcgUgXGnVEfiuUtWk
	XG/T25wPvlcUlNkPCgoNeIPKfrZkuu5Vy3nvQrW//4Z2CVZ6+g4FQVr2vVjjghisdYYAVSWlzAH
	HAKZuIu9hXBLjy/AO+ftegqeYAJygRywMaLmT/QawtUqV+CYQwq0o8+cDdJl1WOsNQ3ruy92/1E
	Hu/m5i184nfJ1alR9VFUdN1nz8Ijdjmd0fh/19kmrbtO/ZNdC
X-Received: by 2002:a05:6122:c86:b0:563:42b5:4584 with SMTP id 71dfb90a1353d-56347fd00cemr3420793e0c.15.1767976913563;
        Fri, 09 Jan 2026 08:41:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUN6B7dCBP0JcYRmyd83u67HiafV1Tjodu/NOX3ME9rb4gqA9llBG6eUvccvjGY9M74+QQog==
X-Received: by 2002:a05:6122:c86:b0:563:42b5:4584 with SMTP id 71dfb90a1353d-56347fd00cemr3420787e0c.15.1767976913161;
        Fri, 09 Jan 2026 08:41:53 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:41:52 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:14 -0500
Subject: [PATCH 01/13] MIPS: copy pic32.h header file from asm/mach-pic32/
 to include/platform-data/
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-1-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2291; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3pGQvenJ9ZmREItlzAsp+wrnhPY/izeuPzFZI4ZvsaE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y/cDjssMHmjL3to5Dzl/KUz1s9dGGt8vo9HsO7C6
 wXz9c8v7ChlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAi5UsY/gd+NFU8onzyft3X
 1Ah9xfDbhtKNoZwak3/cPeCeuzaCbx4jw0nvgps/v5+VUZVg28b/aepKs1v5D5/vXW1ssPW94v5
 JjhwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

There are currently some pic32 MIPS drivers that are in tree, and are
only configured to be compiled on the pic32 platform. There's a risk of
breaking some of these drivers when migrating drivers away from legacy
APIs. It happened to me with a pic32 clk driver.

Let's go ahead and copy the MIPS pic32.h header to
include/linux/platform_data/. This will make it easier, and cleaner to
enable COMPILE_TEST for some of these pic32 drivers. The asm variant of
the header file will be dropped once all drivers have been updated.

Link: https://lore.kernel.org/linux-clk/CABx5tq+eOocJ41X-GSgkGy6S+s+Am1yCS099wqP695NtwALTmg@mail.gmail.com/T/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 include/linux/platform_data/pic32.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/platform_data/pic32.h b/include/linux/platform_data/pic32.h
new file mode 100644
index 0000000000000000000000000000000000000000..925b436a8541b2732c221186c5f33045ea2d669a
--- /dev/null
+++ b/include/linux/platform_data/pic32.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Joshua Henderson <joshua.henderson@microchip.com>
+ * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
+ */
+#ifndef __LINUX_PLATFORM_DATA_PIC32_H
+#define __LINUX_PLATFORM_DATA_PIC32_H
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


