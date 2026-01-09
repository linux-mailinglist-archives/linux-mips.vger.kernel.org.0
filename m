Return-Path: <linux-mips+bounces-12798-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E34D0B56E
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 593BF307B80C
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7633364E8B;
	Fri,  9 Jan 2026 16:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OqAIXZ1M";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qBmGT5am"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700BB3644A7
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976940; cv=none; b=P6q4Q1LOFtBmXVlRyL1Jl/qYoglV6eGW6vGupbdeT6PYGzulk9Pqq+q1JhGBuFBwH8rez3bysHPLz2aDIhbL/lHR27cVGljyzOZFB8luKg8sWhmNTwZyzXpwjDF8nIiic6wp3XNRmFyfXtzv1ML0a5pAmVq440/p6deY+/fUdRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976940; c=relaxed/simple;
	bh=nmpgAjLfAC87GKkiTxsZXklsE6NiSn+AfRFX+0wMF08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IoxS5SleqRqM/x6tEQKFCj3A/0S/8Z0eYDmbtN/VNj2irItZdHr9m5MgANiMicfguASIef6jvSa4JA2HLC45PsS4ThSTjTjGm2pR8trzU++jLWp0wcbLi4TPunVahq8QbvxmIlMdQRdKP/Koi+tOOLCUabKcuf1OuIwN7hrn/vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OqAIXZ1M; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qBmGT5am; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vb+ZCk79JFofYy0opP2TBb2dghQqxeyzmNW11i1RuaE=;
	b=OqAIXZ1MsHV1hu4lmC7rJ8zDDZs6G2XgPsQgGB5qz1VwEkZdM8lRoUbyP71SQp7Y0SIrS/
	AbuDhEH+FSOO9oN2t455+EyXHPo3au/rK7zQEcvFC5/Y1qcAYr/rsUXZIPCC6gwGCMEBOA
	IA1M9KlxTi2O63ffY1JB55A68Ysbr98=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-Oe9GRWUfNIO7rGYHwnWCnA-1; Fri, 09 Jan 2026 11:42:00 -0500
X-MC-Unique: Oe9GRWUfNIO7rGYHwnWCnA-1
X-Mimecast-MFC-AGG-ID: Oe9GRWUfNIO7rGYHwnWCnA_1767976920
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56366d7c469so1482182e0c.0
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976920; x=1768581720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vb+ZCk79JFofYy0opP2TBb2dghQqxeyzmNW11i1RuaE=;
        b=qBmGT5amxp28x4orcOX8/cbbkPRmDAzQ5jux6n0HagBjuWGH7EWMi2V+UQUqAx2kFx
         bKrp+DE4pKORqCuCXZXVoLewbOpjsNaUHhhmQUScQFS7RZ9V/TFHGnMyPgWauSPO2XzL
         fQrHi1VTCyVhLbn4xsszsRDqlfGUv4OVHrtb0Ekr/ZRzcAGhwmLpE0k22bhYX28MUwqd
         ATfOOHEgIkpT5IXD1J5Q5BZ8GE5DNqBkixzIAGhEtZoCigFxY5Gdw7It6OZ8wQPBqy+1
         7YjrHmrItL24cY4Uc3h6598Etn3yC1nfYUpiAqB3RtAWoCv0eaAItIXj4dBCgoLQsEGF
         s3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976920; x=1768581720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vb+ZCk79JFofYy0opP2TBb2dghQqxeyzmNW11i1RuaE=;
        b=r5QS6J+HyyRfLHEWj3pgaiSnSxKrW5SVMXHUxtQVukX7SQ4qvkFFSuZd62D6YTzK6O
         8W/R4IoqZpjPRzdn5ci1V6pVSvBAOPJjQ1u3kfFl3do+MhjQfcmEFwLdww0OuxmqA4a/
         KNHQwh5tT9/EpVtCEsbCoxyRiaja1eKpgAnJDWrYFUOdn70y4taKm7YBzFaunUKJroO8
         ZwWzq7erZuceYYH1gM5tFdC0i5aeyNd1vQIe9fXClj1TBg3CI3PaUnJM+X8cHSLiMmtP
         +y6sJ0b82aAZFnz+z2/OQ+xzyXa8ZDByiZrHFHmPexR+yYRG3Y1DVycaFyUO8euf0Uil
         Zd1A==
X-Gm-Message-State: AOJu0YzpINivc105hACvUM3c6G99Cu4JLM4egX++uu+ExNoHJ8/xocI1
	x4VfBRRPfWg7t7fW/2JIcYaaphSIrkAKeUuAyiiKRpKU7jUremtgep4SZghhnuTxjA1OhKCR7C4
	gsOVFmZ+VC5YNPnDUItT7hcdTEtBsQpIsDhucl7Q+mH1yKrUiBpo5UGFyNQSbu6c=
X-Gm-Gg: AY/fxX7+xYd1WDFKegslQcAFHLNCW+YHQ4cJo+DEHhXJEH1vpCAmP0GVBhUsB69ACEZ
	wh9bPKtduimsXcLSDXHIOzMuIj4iaX5lZxHkZ4BgyoWe5RWW7txWTuEaPrkK3MdjP5OoYR+OEyt
	CBFXHpB6W7gGWDb0MlK9RficKEV0FYdSueollcQt7aXIQp2YAuWTplXpkQQ57D2qR5ueX/CMW0v
	Cu4dv2ENMgUnlrjqeLpk0HetEO23QOmWqlsn4AXF+xghsC6F42uly4hGMAcquGLXfyjDslA8fF0
	nLCCO2ft3JfCDyyIwbdgjWcb9Bfzap+7SvZxZh0hmM/Dz9AscbaLl+OC6NgXOv6PwKNosHtWVT5
	+6UtaO6ZsbeYnbVe+5LlOEACqAWv/mXg8JaPXudIRqCgzq7pd
X-Received: by 2002:a05:6122:459a:b0:55b:305b:4e31 with SMTP id 71dfb90a1353d-56347ffbc74mr4032654e0c.17.1767976919998;
        Fri, 09 Jan 2026 08:41:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdbScE9hXL2bKfmWaAIXgFKPZqtXyC/ZOYmGZRdu0PyNqNvoiVsgbd2DT32FJ5mEiTwd7eWw==
X-Received: by 2002:a05:6122:459a:b0:55b:305b:4e31 with SMTP id 71dfb90a1353d-56347ffbc74mr4032646e0c.17.1767976919541;
        Fri, 09 Jan 2026 08:41:59 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:41:59 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:16 -0500
Subject: [PATCH 03/13] MIPS: update include to use pic32.h from
 platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-3-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2900; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=nmpgAjLfAC87GKkiTxsZXklsE6NiSn+AfRFX+0wMF08=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y+wx+9cGSC6TVJ8yZST0+QrZPYuV5kl7/BNydBD3
 6X1X+jSjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbys5Dhn2ag56XDD65yGV2f
 Z2m2z6LgL99KzVuqn7T0X0Z/2/JizlaG/zn6C4zVxa5UpHcVbZugsihKbNWCowKyola66uu9+gz
 +cQEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/pic32/common/reset.c            | 2 +-
 arch/mips/pic32/pic32mzda/config.c        | 3 +--
 arch/mips/pic32/pic32mzda/early_clk.c     | 2 +-
 arch/mips/pic32/pic32mzda/early_console.c | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/pic32/common/reset.c b/arch/mips/pic32/common/reset.c
index a5fd7a8e2800ff06cfe8c0ed91c8ff6f5996750f..d4ad5dbd61c0d06fee2c9fef2af5c3a7c4312209 100644
--- a/arch/mips/pic32/common/reset.c
+++ b/arch/mips/pic32/common/reset.c
@@ -4,9 +4,9 @@
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
 #include <linux/init.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/pm.h>
 #include <asm/reboot.h>
-#include <asm/mach-pic32/pic32.h>
 
 #define PIC32_RSWRST		0x10
 
diff --git a/arch/mips/pic32/pic32mzda/config.c b/arch/mips/pic32/pic32mzda/config.c
index 73be5689e0dfb8b18c0a44ee860ca2786201471e..fc21cbc11f7d6b75b15e5c6747a1a5f34c1d5d8e 100644
--- a/arch/mips/pic32/pic32mzda/config.c
+++ b/arch/mips/pic32/pic32mzda/config.c
@@ -5,10 +5,9 @@
  */
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/spinlock.h>
 
-#include <asm/mach-pic32/pic32.h>
-
 #include "pic32mzda.h"
 
 #define PIC32_CFGCON	0x0000
diff --git a/arch/mips/pic32/pic32mzda/early_clk.c b/arch/mips/pic32/pic32mzda/early_clk.c
index 6001e507d8e398dee77eed071f0e53f708b57a61..ed8fa6e68b7b814bc184ee9bebddca08c20623c0 100644
--- a/arch/mips/pic32/pic32mzda/early_clk.c
+++ b/arch/mips/pic32/pic32mzda/early_clk.c
@@ -3,7 +3,7 @@
  * Joshua Henderson <joshua.henderson@microchip.com>
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
-#include <asm/mach-pic32/pic32.h>
+#include <linux/platform_data/pic32.h>
 
 #include "pic32mzda.h"
 
diff --git a/arch/mips/pic32/pic32mzda/early_console.c b/arch/mips/pic32/pic32mzda/early_console.c
index 3cd1b408fa1cb039f917f2d92e82fd00d8a44574..1349c783cb640d1c0940db6deda77da882ff97fe 100644
--- a/arch/mips/pic32/pic32mzda/early_console.c
+++ b/arch/mips/pic32/pic32mzda/early_console.c
@@ -3,9 +3,9 @@
  * Joshua Henderson <joshua.henderson@microchip.com>
  * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
  */
-#include <asm/mach-pic32/pic32.h>
 #include <asm/fw/fw.h>
 #include <asm/setup.h>
+#include <linux/platform_data/pic32.h>
 
 #include "pic32mzda.h"
 #include "early_pin.h"

-- 
2.52.0


