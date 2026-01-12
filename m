Return-Path: <linux-mips+bounces-12875-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DB0D15A61
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DA2E30AF9F9
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C1A2E1EF4;
	Mon, 12 Jan 2026 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BQVNddqr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="njYE9xuh"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A6928C866
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258148; cv=none; b=CaEF9hl7o0tYkHpLtUMvpDts9/mNx2f5vQuW+JrHb2J0MqOYqjA+5Idu309BRXYE0fcBsKm6dKK1ltHBgMl+LnjsrJki00pOO0OJQQFFJuTVPrBd9yMsSqMJHrfhLwjXxhFD8FmOfZ4X3aBVoxfBIWO83TyKAHykFMzbgLXZlYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258148; c=relaxed/simple;
	bh=Vrhq/CPUKCSJZC5ftY4JbGaGOKIgBStMYML61YpBX6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmeHpNpAAUyPDvEgd81c1kAHSmEywwsfpykwJwrW9ooBU9NSTgXu7+lr67bEKgsSe0bWY/Je9Be3rNWc0LAFxsoCQWwhEP3dyYxgrSMsHnhXl0q2Uvb9cu5fO7TOPOxdoBX39NXLPpS/gsm18jlbsxYv0VriCV4tgjl9cCXLUJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BQVNddqr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=njYE9xuh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8G3iTWn7Rhs+HPnQX+m9ZAsdW9/xgT6GNM2KV4m+Hg=;
	b=BQVNddqrVcD/dPKL1uMR62yzYZJ1RhlTZKI5ycc8uazaOFarY9ltT5/7me8AfK+N+XzR8A
	bfb1H5BWGM/96KlgtbF7F4HAzD5nCmIbmuJMY1z0UZrU23VnEE9l8HL+f0kz4GNMvvQFJH
	JVt2S+1Bri4AceaGGCqMah4GHK0beV8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-FRcVuwGvMW2Jx-b9918oSw-1; Mon, 12 Jan 2026 17:48:59 -0500
X-MC-Unique: FRcVuwGvMW2Jx-b9918oSw-1
X-Mimecast-MFC-AGG-ID: FRcVuwGvMW2Jx-b9918oSw_1768258139
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bc4493d315so1809739285a.1
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258139; x=1768862939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8G3iTWn7Rhs+HPnQX+m9ZAsdW9/xgT6GNM2KV4m+Hg=;
        b=njYE9xuhBCjWqjWlG/ypZC8HvOnypZbr2AVOvIWlTDK69/WR2spjBHkS/kV4y10IKH
         LVYy2RKPIQXb3hw+EOzSUYF2fy7Lp9JhKpBJchi9mQRYkXcnNnAD57mI4l0wDiR6zypc
         2oqbzqr6iIensziCKVHZksQTMHnCtt6c3h9nVuvBegux1RgaNKeHBA+DqQB8W0sah0vl
         YaDvSHhSYc/fmbuWb+mg94RlMBi93lwg9DUP2ruQszn/fdVRznESYIpsKMH3Awpv6hM5
         amL6iDJF19Wr4o0GQuK+gdahF1u1HOF/pacmPZyph4z7RzTAxwgBB5jHwuEQQD6afA6l
         stpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258139; x=1768862939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8G3iTWn7Rhs+HPnQX+m9ZAsdW9/xgT6GNM2KV4m+Hg=;
        b=U1jdrOnVDnV9ufKnFAhn3eSPN10ZThSLvXEnw/EDASicSB9euyb39ooZBbYYcXYqT4
         u2Xmm9aZAa8wXetLvyUJTcnBqkZE0dLQTpB2+La7sIOq+H3Bp3CPKsf0H5xp2V4VU1L9
         D50OrdhUTFe5T3OTj/0LT33/ll8eW3oWLpL9lK7k3Ent9szRHZ3RA6PPN0dNViCeolxb
         iisalzanoieG8VPFnJSbltvf9ICQ0/8TAcB3O6+Ywt+kUfREZuo36hC85aMDm0N/Ej0L
         YidNOy2CLQP8rojIfavVMIWx89vgVFdoW7YHcn3CXdiOqYw2O5T2b700WfafBL1sAsiy
         5w7A==
X-Gm-Message-State: AOJu0Yyep79GhRnG0A1976h1KK1RTEfia+emcJJPdCnZ2oyDJrlmSIB8
	ubjjnujmQI95gXSR3cVeeNbX/7Lcsl4icSJOExLM/WzjWTePJA2Qy/jHYPNGFlvyhkDEBIcXGAe
	qsLUKp2h0u4bDzCRIS2AsTFu9xStr6mSiDP+ZvVH4uoh6GDrj2fSv2Hz0SjJ1rSA=
X-Gm-Gg: AY/fxX7cVE89tgoYdvIS5iF5pc/N6HRXtxzGJh8UAiEilp+BhLCuB5c+wyntWxT67Qe
	dm0cRln6Fp9T8oXlnvSd+FtecYdgyXPicDHxTlO/f8HMzFWv0+DuxRVBvYM9JLf1Dl+sHHmOHqi
	DFD7jx3ReP00d0OIrTuTjep+eqvWP+AddF9z+cYK88FNihuzAW+BflhNeGVKrZysvmeXqWOel4n
	s0SQKSjnAcxg4QdYG4f12gNaz9EPwkheeyOjC3rc6OGnHqghAHr+HhUnf9w9hMKtSxuZHcux4pp
	8vgeDmU8Y6oyFyELS9zUD8bthU6KloJOxlDtuuf7ONCO+k/wjBQ/3FDiTaKqzMaI6ai+Ri/8oCR
	ltkV+leKbTbwXuPErw1z9sGTXiUcKOmDl9hwNVZle5ueO/MLL1g==
X-Received: by 2002:a05:620a:4413:b0:8b2:e86c:e7e2 with SMTP id af79cd13be357-8c3893a26e9mr2904087585a.35.1768258138749;
        Mon, 12 Jan 2026 14:48:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOls9+k/5NmjNmWKQc/iuS+/hVhriDFpmcSwu80R5MoV1s1X8WMBE3tDpVZLzzMq9E3I2slw==
X-Received: by 2002:a05:620a:4413:b0:8b2:e86c:e7e2 with SMTP id af79cd13be357-8c3893a26e9mr2904086085a.35.1768258138346;
        Mon, 12 Jan 2026 14:48:58 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:48:57 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:02 -0500
Subject: [PATCH v2 08/16] irqchip/irq-pic32-evic: update include to use
 pic32.h from platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-8-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Vrhq/CPUKCSJZC5ftY4JbGaGOKIgBStMYML61YpBX6U=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq7yfvJfneeR24/jfFEPTp1xMR4oDlYwtkusuN0w4l
 5Vx7ODFjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbiysDIsHXz8upts5ZVWc1d
 tHVL1DMrhZUct0xEtNi9m15HiborczD80wzeP+vZM91rRjWHs1Yft8g/d/iYw2njaa091rnl1aK
 72QA=
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


