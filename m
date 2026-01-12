Return-Path: <linux-mips+bounces-12883-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1FED159F8
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E12E300A3DA
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA0234B1AC;
	Mon, 12 Jan 2026 22:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JZUt4NOi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sJr9xaoZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1FC32E144
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258155; cv=none; b=nEQ63sa/QnHUwFBe1p5YY6F2vpzGwtW+8thD+VAhDq4Uhs4e2hCcPYc4srqIxCgQ9gZY47I4qKAQ2MmX0bQp73ifU7zkoDl3ES3uyQ8JKnIVC0zt79MlwIR362zdWvyFX7tlOT2TSIKRBJQmeKoLXVh+SiIXNq98luBu5vv7EcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258155; c=relaxed/simple;
	bh=yHjRVceqWfnClK7L6EMMiy426ixzWKYcwkDTfA7qIk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwjOBzR7QWPL1wOs4q+dlxw87UGKvahyRHWG0eVms+3tMXp6t9QL6ltR2AQ2e9wJKcyyW60TXspLmPxRZVzHQP9jYADkeG2VWmlcsYN9PL9XUcK5CkNydrc/vJoWzlW0LWuQNL0aiKmW36Y0VMQmE6KsCSs/45G7uf3AaDKLwTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JZUt4NOi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sJr9xaoZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyzBh855aJXV9DomRvvsPNm2BYWx1ng/Ty7nI9/oOKs=;
	b=JZUt4NOi/VpWhO2xZwICdv+335bOif1RJanRoCWY+7k8KmF1RtAFWcCj+XgpVLPEZg8OmH
	HOb5tHwwMnmvJxi7czlD9IO+lYBkz6G9GJuAtefM9Uo2QgAXSlVu1lIKaSeQYGx74CbZIw
	LASfpThnV3uHLk5CRc/yCTuzO8ugG1k=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-NjCjnskvPBqz4BtEU8zbMQ-1; Mon, 12 Jan 2026 17:49:11 -0500
X-MC-Unique: NjCjnskvPBqz4BtEU8zbMQ-1
X-Mimecast-MFC-AGG-ID: NjCjnskvPBqz4BtEU8zbMQ_1768258150
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bc4493d315so1809781385a.1
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258150; x=1768862950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyzBh855aJXV9DomRvvsPNm2BYWx1ng/Ty7nI9/oOKs=;
        b=sJr9xaoZ0CNFfgLtVmmRYbfGcH2ZXl+TctyYKi3YLL/xxQ27HfpdEws+dnQ24Ca1E1
         RhGwN2WvvXn0AmQhKs7+Dmh0sKge7i9TTfoM+jlvQKfUL2ES/l6YtrzsFOGYaehHiSXz
         LglMtlVzuudris3+1pugzHkewEmyHKQEJB/m94Wm+kIoErT1FQLHs5+enGBHqvYtVKLB
         /BCjwGEnJSi63a12ipY9uKmkrHUSIxqRTrIaLqy6bADAvvF+IFae23B8LYMo9elfTAW9
         9VhhLcxbuVybL6pNUBb9/L58bQ43/JW5TwRvcSdy4xnKXsODE2Y8OJP8+f47AhP65NS3
         UHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258150; x=1768862950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eyzBh855aJXV9DomRvvsPNm2BYWx1ng/Ty7nI9/oOKs=;
        b=VTKl1ItbZyNg19paGsxaE0RAqdAsRGryWwPkV2oFnrOKFWUFK732T5A7NXyEydoi3i
         tOr871wL+3lgx9hpu0j4INoEpH5WNnpg0mEJnfaLOnoUcFvabSft6uktGOwfaH5nfhvr
         /4ofU6Lqpeiv0lp0pv1/D+GDHLW1hc98+nybGWJZdo+Sdo7LG94gtuce7GxLDl8FTqtZ
         bRhki87XAujhCfOcmaWvpmVZ2hf0NBB8Ff2ukDCGSMFf+dFdM3+E6cIq0JQBB1I5nAPC
         YvNRmLnJvi9WPBONUzu9EgiDTvQQ/bIMNF7znyzvh18Sbb8IERQjnvcNQiho2pKwP/78
         nk7Q==
X-Gm-Message-State: AOJu0YxmPUcFBjphluSBhlboml0BMTVYHmhrBJCvqNvEKvMbO8Up46QG
	aA2QQHUYHVNr7iTSj1ReSWfjXO9Ti+hAzfSjUPzV3shQYAJ+S38e3S8/GcAd881tU7cp7pxVVO/
	ing28akG1N0SPph8Rk5FlgDNUMTdKcg8Tsp2ln4xSaUnzGKzLXH9JyHUb4+mFTyQ=
X-Gm-Gg: AY/fxX40WAQ5a6jjS6dARDjXq80dyBOe6PA5D1p3nRcDouRasoXEQHY71VUvikJXlrS
	oX+yoBnHYhJKjiDfTJ6vgP7wHtufUF3ibxr+NEYmostQvzcXbKcfkNhZwwE7HQ9MyDJKWQamMFn
	PM1iVYifFuZ/SgZM0N16oiDcDe+BEdlnv0Cdxuz77BvjwGyhjKozZfyySax/hTdX+cQfr37YYaS
	73en7B8Vin/co+N7kQJXkZfIZLFpyYyekwq0ybvXajvJOLBOa5f9ipcJOk+eDyJr/tzPQlmyETw
	B3ljwy3lp5iZZ0gq7OI98sVu9tW1wJl1grWPh5JADz2xn3LGXy5WoAF2OqZ62U2t3GNKVngmgQG
	+q+5spKDuj8SS2cTjVAO9mioNPQx8fY9/k++bTl5DQX7BGW831Q==
X-Received: by 2002:a05:620a:31a4:b0:8b2:eea5:331b with SMTP id af79cd13be357-8c38938e154mr2685489685a.19.1768258150605;
        Mon, 12 Jan 2026 14:49:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZJ0/t/BqglFxl8bhfU4LW7RtVPhpIRIP9G2UOgYZlp9QuAWV2pW+HRmyZh7vP7WwkCFFdtA==
X-Received: by 2002:a05:620a:31a4:b0:8b2:eea5:331b with SMTP id af79cd13be357-8c38938e154mr2685488085a.19.1768258150263;
        Mon, 12 Jan 2026 14:49:10 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:49:09 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:09 -0500
Subject: [PATCH v2 15/16] MIPS: drop unused pic32.h header
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-15-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=yHjRVceqWfnClK7L6EMMiy426ixzWKYcwkDTfA7qIk0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq3xuS2fcX3M+0rVApHmzw4895y+tibA+tvmo4q7Fv
 Q5B8y9u6ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiW1wZGbbd7A/p2WhQpsOz
 lePAg3X254MC3L82JnwWYL7cfOrr6+eMDDeln1os5dLbZbXYf5firYLJaxjOfzlZ/2L5pEDzk1q
 tq9kB
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
index 660fa4178b3e4e30977c8c4126df4266150062ce..0000000000000000000000000000000000000000
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
-#include <linux/types.h>
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


