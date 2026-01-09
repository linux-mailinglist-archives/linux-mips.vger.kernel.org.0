Return-Path: <linux-mips+bounces-12804-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0959D0B5DA
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DEB030AC645
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939FF365A1E;
	Fri,  9 Jan 2026 16:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TxkUHMTc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDrq+rEw"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEE236403C
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976960; cv=none; b=GOsI7I/WmmLQhqxdrTP2F5dHMR3mEoKrdtueUHo1/DO3zMSPzzUNkL71FzW1YKpoqSHsJ/SRJ/Ig0ClFwBwYNfyAlBRCvusvkipm5ICrUFLc7kRiFjeVfqVwkiazyI+HzJLm6YNq9M+J4uHZYi2UbGgtIvlmxRYf+15TGJ8XKxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976960; c=relaxed/simple;
	bh=uTwZPPApCk+r0l8ouXvDKHt35nfzWWyFRIn4+7fQl1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFrL2ehUPKnA5nFnahSJdIBLz2ZaDRwJG2KVs3BMshZikUhCveAqgHMkO87uo7/KrSdgvSbZJoEQD8pycCQglXUCuPT72ZXDKoyJrVl3Vs7X6yrFBG8UYYUGJhjjEa16wEqDTQwfd6Qzttjbq2PC5OqVT32HPVf/1k5r+YsfAgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TxkUHMTc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDrq+rEw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFZby19oXMurQdBvXK8gBW1QJJ1lRB9h9qeIj+TIB/k=;
	b=TxkUHMTcgyuqJYFO6Tmng7hUZOkF5UOhCd2DmM4lidvMs10mWxc6wSUlYHx38xtq/x0z+g
	WoZ7t286k6F3OwLxJp3BHRntc8C4uZvZ5vlOdj5CopOeBSxO6Be0YDRpLhhqxJLO4r4tm1
	iVCLt1kz8UmhYc8v5TdbrnjI9BGgyVY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-uQb--xh9OJaFz81r53edcQ-1; Fri, 09 Jan 2026 11:42:36 -0500
X-MC-Unique: uQb--xh9OJaFz81r53edcQ-1
X-Mimecast-MFC-AGG-ID: uQb--xh9OJaFz81r53edcQ_1767976955
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5637112ac92so144561e0c.0
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976955; x=1768581755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFZby19oXMurQdBvXK8gBW1QJJ1lRB9h9qeIj+TIB/k=;
        b=UDrq+rEwmmLBC2WXPnETTmpryUENLQQY0yPxVOl5EKAJyLFOdgAYZ6ag9jT6jZMXgu
         yM9z+35LdAIIiiwNRwQdeffI23oj2aQ27MHNe0FTfM/WABecZOldT/GgCOIahrNJCqU4
         +bBaPRyG8xTbmAFAQpOUE5OlcfOEsXO+eeFU2dw1FatGbHhOn5ZOj+t3B8Le3BNmo9hH
         kV85Q5IjO484rHGtz2e0t9jnmwfvBr4e4sZ3fneB6sGVwJR6b8vN9zinFq9DP2AB6RKj
         JRSNpQE2a5BruOELRcX+uCgF/B/iq6WvTrtAq4sfspeJhjJYYybM4JsfRm5VREZQpoas
         MsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976955; x=1768581755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XFZby19oXMurQdBvXK8gBW1QJJ1lRB9h9qeIj+TIB/k=;
        b=AuhrbvLymn89pTgAvkZ5vD0QrcweZiga5qkkZDWahMt9X4k8eXzoGb4djbL+tf7Vm8
         kmAUCUy4MFOmVkoqKbBnz7XOob/rzh9LU0JSXSCSP+qokqdzWo8x36uQ2aa1QSJwxA5Z
         eEZXhI9eQ/0y2LkqD7LEpYFCByfdR7a9mc0bRJGeBSRr9SiQoRPUWzztFScHFS0qfnnT
         bSRJX6MDwRPBZyBvs6hqpM4LDTaLtmHhPeyShnhM4DKYA431D4Aodaw1iGEZYvfDCZiy
         Xp2i8Y54MxsDcFyi2w89g1EitIspwYL4Ba1F17E7Y3P4AnduAdAUoY7rPmVx4KdIOAX0
         4MXQ==
X-Gm-Message-State: AOJu0YxMIwuuc06y2aDmuHdU1zJhloGIU2BYZ0MaFY/Gbi9tqylZ2nwm
	+xzBLf3eamZrXgk6OOzdjcaXEHr8JfihrKiJZ9pL0/jsptAS0jmvyYh6nKkil7IO3gbnecoCdBp
	91uFTpj4TNSUYN5xmybexq9KY0oEVDElXOlXjSUnfN50ZnRJ3SEW349nOTBz8dmk=
X-Gm-Gg: AY/fxX5HzCi81FpXh22lVg7oaYwL81BiMIoSn866SSkAftG2PWd19XNI7GTfUGGgAC5
	GQTjFn+8HDu+NgiewApsOf5kxrFXJQIh1uQUaZreyr6oVpSquxTZqPhtGJao3T/o7Va2C7eWABH
	0hXMpQUpr1ED0/IotNul4wr9Qo43pHXoqgeMqTF608GPwzAxNZGKXhxowDLOiTusMJ0oiIIVy4y
	eWNCyQaF9DD5xQPu5hi4WGqrx30zzpTMfTCZWgaEOeMem5xWBMwPqKHBuMLJvt5+mC/tdPe71Gy
	KRd95dE6OZ621DlllX6jJRwqKG3nxBOJL3K37GCD773fZoiZySgB5N1ofkpOMX8S0jBtLBnAPta
	sN4pU0vDSI/vjCit05JYeL3aI5LarjrB7+M4N0FUofqj2Ijr7
X-Received: by 2002:a05:6122:4885:b0:559:83be:69c5 with SMTP id 71dfb90a1353d-56347fe2e8cmr3533151e0c.10.1767976955247;
        Fri, 09 Jan 2026 08:42:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/QyNDS5wwpPV/LHex0SFNomycY5DEjrnWSwn1DEA6gtYg/TFbILzU9hHxrtNfDe6LdvCb7A==
X-Received: by 2002:a05:6122:4885:b0:559:83be:69c5 with SMTP id 71dfb90a1353d-56347fe2e8cmr3533145e0c.10.1767976954756;
        Fri, 09 Jan 2026 08:42:34 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:34 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:25 -0500
Subject: [PATCH 12/13] MIPS: drop unused pic32.h header
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-12-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=uTwZPPApCk+r0l8ouXvDKHt35nfzWWyFRIn4+7fQl1c=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y9yvFbZeXlJm9MKtWIBlfLvCZc0xDtaclU5v3hfN
 Hu3XzGuo5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIl8jmRkWHF9c8b2tqDqFZ8M
 uJZNPShdtSUv3MJm+sn/yeKJC4/IZzP8lT9/OE5kf933l44N3OdYO06EHlk507/Jd+J/kan/Qjv
 XsAIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

All users of the MIPS pic32.h asm header have been migrated to
linux/platform_data/pic32.h, so let's go ahead and drop the unused asm
variant.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/include/asm/mach-pic32/pic32.h | 36 --------------------------------
 1 file changed, 36 deletions(-)

diff --git a/arch/mips/include/asm/mach-pic32/pic32.h b/arch/mips/include/asm/mach-pic32/pic32.h
deleted file mode 100644
index 53918a671a4c39dba2a22121187cdd73e1935b24..0000000000000000000000000000000000000000
--- a/arch/mips/include/asm/mach-pic32/pic32.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Joshua Henderson <joshua.henderson@microchip.com>
- * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
- */
-#ifndef _ASM_MACH_PIC32_H
-#define _ASM_MACH_PIC32_H
-
-#include <linux/io.h>
-
-/*
- * PIC32 register offsets for SET/CLR/INV where supported.
- */
-#define PIC32_CLR(_reg)		((_reg) + 0x04)
-#define PIC32_SET(_reg)		((_reg) + 0x08)
-#define PIC32_INV(_reg)		((_reg) + 0x0C)
-
-/*
- * PIC32 Base Register Offsets
- */
-#define PIC32_BASE_CONFIG	0x1f800000
-#define PIC32_BASE_OSC		0x1f801200
-#define PIC32_BASE_RESET	0x1f801240
-#define PIC32_BASE_PPS		0x1f801400
-#define PIC32_BASE_UART		0x1f822000
-#define PIC32_BASE_PORT		0x1f860000
-#define PIC32_BASE_DEVCFG2	0x1fc4ff44
-
-/*
- * Register unlock sequence required for some register access.
- */
-void pic32_syskey_unlock_debug(const char *fn, const ulong ln);
-#define pic32_syskey_unlock()	\
-	pic32_syskey_unlock_debug(__func__, __LINE__)
-
-#endif /* _ASM_MACH_PIC32_H */

-- 
2.52.0


