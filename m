Return-Path: <linux-mips+bounces-12795-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4D6D0B565
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98FAE3074026
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0585D363C6C;
	Fri,  9 Jan 2026 16:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QKsfJatI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cd9Kd/vS"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400CC322B7F
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976936; cv=none; b=Gpp7stqOYXLA93jafsAAhzzV4dynoqOnCYf0vjuNoB5sP/AEo7WaFIaut6BeFnCMqnCAP3rqJSPJqO8/UT8equ/aV1NAh7HB/xv1UEroKKfSip33gQtFdJffJIUFo/0/ZhuFdn2JlCRugicdLpQFDsVPIPBHVAD/uH1CcBY2Iq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976936; c=relaxed/simple;
	bh=Vrhq/CPUKCSJZC5ftY4JbGaGOKIgBStMYML61YpBX6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GW4idpLC3+2hSQebZs5E9hDMlfCSCDkbIjXm1nN4a4GOb2tJSc1WsIuKrczHha3hDgichCwMAAipUv7bVuPGT/X2pYdSxgiPGJG/7jvUwqez7XwpunKVf1VOpt+YHuZObVhnvhwlA9RNWyiuP1vbxBzjMAOYAFS6KMgBDM2eBgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QKsfJatI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cd9Kd/vS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8G3iTWn7Rhs+HPnQX+m9ZAsdW9/xgT6GNM2KV4m+Hg=;
	b=QKsfJatIkHxOwYUf3eWwTTfdD8b4n8YxP7s41k6PIG4fehNLYba/RrAbnct7A8xlbT18t5
	l4Y2tQWipDZ+vfEC3M0Z0sqhVB61BCuedoqqtVOOPWu2bd6ldlSGS/vuOqEIrkQy++9Orb
	/vM64rAn9PVyJOtMyJdCZBFwRkd4fBo=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-CbTMntXmOaSwpacugyCNlQ-1; Fri, 09 Jan 2026 11:42:08 -0500
X-MC-Unique: CbTMntXmOaSwpacugyCNlQ-1
X-Mimecast-MFC-AGG-ID: CbTMntXmOaSwpacugyCNlQ_1767976927
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f5e6c2110so4730056241.2
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976927; x=1768581727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8G3iTWn7Rhs+HPnQX+m9ZAsdW9/xgT6GNM2KV4m+Hg=;
        b=Cd9Kd/vSS/4sflvuEGz6HycUxRDHYAhX7AeRrL+25edc5ap1h0mmPq/8loc/EV2k9Q
         OoZAzHFpBRo1iZhIhkhTF4bbovGw46yY5cCinVYtoiym3qOxwsrXLCXiCPdD+Ah1qQcv
         l8A1hlIkkbw8AKf1U6SUJnJubKDwx4BJb8D32EO57zay9vJ+2gSxxel7JdYCiSFfvCPn
         NBFlbKZMUhT0ZkfxGGHqHRVuUbCPkbz3kciryiKAZUOmzvgkAmxRDhRuOsKoHsCPIbbK
         gq1zK0NFYTxcDZguuWl2LXM3mURMWLIr/Smy+MiGbgryTU8qPKD0WRUjJLuxeYyRvD4g
         dG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976927; x=1768581727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8G3iTWn7Rhs+HPnQX+m9ZAsdW9/xgT6GNM2KV4m+Hg=;
        b=oWglm2rGAVsPJMN3rk7GQ4PrN1ygIzhxjc4tK5Z9zT0f9FTug7zsuDfLu2+clslW/V
         FDFgUO2HEXDN79H+QxCWfX+JmF8E1cqcwAJsaDA/t+defHSI+8Pzs9miTWThRQhpgKTz
         ziuvv2La/ClkQgSjVF5cr/1a6mpLzj2YR3Sml3Fc4XyH7vThylrkE9DVmlEF/7JNi2e0
         brIMNq6MBnxafibh5ek5KDO7ar0DBtIrvWhoSsbrVrlE9sExVSIKtBEzGiG9fUqv8zFQ
         VwW4/A939O5nGSc/lJnuCjHabZ75KXS/ozrG2OihaK2b2T+7zBLKTy38JxtwijqGtiGy
         IapQ==
X-Gm-Message-State: AOJu0Yw1aaDFAUPOHmQBquZ7O2+G/UMbExJqJzLn8a7ozx+HyNK09KhT
	EIub6uBFrgqlhigjCtoS+q9Kvq1bSsoeG6n0P0eygUFqjws61yshb+jAXTa1+ILHt+8O1/tdwfQ
	RvCcH+vy6ILnWd1m7edfj32TjxeJ+3tOJ4qj4LhVnucYdgsKOhbzeampjV/vwxyw=
X-Gm-Gg: AY/fxX6+ftHOss34lwa+Jg8F6qrJHfDQ04exVZK5xg5woyy+2SeboN9V5EVuxOExCBk
	CxCsr0MkOC3Yrv7dJbDZHFIlltyU+ZpoQ2v6gwix8QKXluuEPWzYTp5x+80nzFyHd4dPayy8iha
	0C1IhArP6W7vN7LDQuOcL77Vo2f+zhi3Al9bM/Sm+mU8axYWDJq48DnUqKzfbnJ3+jEsyrfEPXq
	bRO8sOjp5mJfGFQBAC6CJldfcwtC52G50ZO8eOBiuijZ8k2Lm6qiKTNeEhE5ofT7i8DxQItgD8L
	wuU13b4+wgvLJ55Krv8jap0VoUIPL8BfNS5M3OcrYDBBe1DIRYepm4rFnrXYzU9nco7BnCM0twU
	h2/LDgozZZ32aVVOvwKdcckcrpYOB0Ff23mkddRjGaUSa1JxC
X-Received: by 2002:a05:6122:c86:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-56347fcbaefmr3960064e0c.16.1767976927595;
        Fri, 09 Jan 2026 08:42:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaK4ZQlhHSL7st+ec//YitNKMbcF1ZkuAG1qxekPKSiilUAoN7f5G29YBrJtuCejl4DyUgQg==
X-Received: by 2002:a05:6122:c86:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-56347fcbaefmr3960056e0c.16.1767976927274;
        Fri, 09 Jan 2026 08:42:07 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:06 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:18 -0500
Subject: [PATCH 05/13] irqchip/irq-pic32-evic: update include to use
 pic32.h from platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-5-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Vrhq/CPUKCSJZC5ftY4JbGaGOKIgBStMYML61YpBX6U=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y+8CxDb7P1Z4UDS2dbrDTvijRe84zNqW7lo0fv5V
 nIfCrfs7ChlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiqZIM/8PToq46nPUIeNDw
 Wb2h1UCtmEUzObUj2nRK3rGXwo/N7jH8U7srvGFRvGlVLe82Yc8o64UTS9fvCDmy8/MF2Qmncr1
 ucgAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org
---
 drivers/irqchip/irq-pic32-evic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-pic32-evic.c b/drivers/irqchip/irq-pic32-evic.c
index 5dfda8e8df10d282760c947775bcde96011b573f..d87aca73c009fd6fa4ec6a15fdb9ec68a5f99017 100644
--- a/drivers/irqchip/irq-pic32-evic.c
+++ b/drivers/irqchip/irq-pic32-evic.c
@@ -13,10 +13,10 @@
 #include <linux/io.h>
 #include <linux/irqchip.h>
 #include <linux/irq.h>
+#include <linux/platform_data/pic32.h>
 
 #include <asm/irq.h>
 #include <asm/traps.h>
-#include <asm/mach-pic32/pic32.h>
 
 #define REG_INTCON	0x0000
 #define REG_INTSTAT	0x0020

-- 
2.52.0


