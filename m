Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69ADC3237F5
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 08:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbhBXHeZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 02:34:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232855AbhBXHeV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 02:34:21 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603F1C061574;
        Tue, 23 Feb 2021 23:33:40 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d11so859617wrj.7;
        Tue, 23 Feb 2021 23:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ngrIjKk22xJlSVhCaumQHcOAqUwk1OGJLsfqi4lKIBo=;
        b=EL9OEmHcHAEb0qcfyHUsls1XhXzzJA8Od1BU+7l9y4uXzEH7yZtjrVWVYptzvHbPiW
         VeDCLMFT0kOPJWfKMsKB4PbLuQugFehxHdAE+KERaBEW508b+eyW0Wh07FiPD8FqS6RK
         JYtJxK6hKQ9+iYW6GxyI8vbpm8ir0ocTPmSMH/2qj9796ykqzYwM/gB1bDWlbKaCpgr3
         YZh//XPdnub6KbnNBIfBkwZtsqK6boKuPP+euktOALXBuRSLLYZ2QcZu6tm3wTSRnVHX
         QtTC6iPSpxI/9Wdgg6ICLP2bhfU9XopjMkK6przvjCS4aEiGzuHlwo9MnopY2ztAYFQu
         J3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ngrIjKk22xJlSVhCaumQHcOAqUwk1OGJLsfqi4lKIBo=;
        b=JHMmxyrvgy89rkCQ1PwlAQSJYmcJsEshozlYVGfdg1T0KZamDcJzXbVjrh7VJV0iQ2
         a9dtKDdJ5DScSRLc5XjIFqqjznT3RDY+fJXTPQyq9xMNabP12ACiYvMuz48ZwMLGf58u
         VRbTOeXULR2IPrkBgkJjBvan3fSzrNfeE9Rmr503Sm/jKVzi4E1OXKijnac5MW7kyneV
         GW9sWLw+pzFzKtekZrW3Yt4SBzyQzl5oamoi4ROnTA4ZyjEGpZqabFc5gb+lRXSfp6ZU
         EUfiooLSPJkUT57pCAgY8zO8u5NEfVfhepVP0oV9zEaO5M0TecmDEPmfGxMPSl/kiUji
         59Zw==
X-Gm-Message-State: AOAM531lFY5LR26VVRRY3s32C9U8ow/rLn7guTONuJQgRQ8xWiLCbXNR
        QXZeOib96JrpujWK7BVwJZA=
X-Google-Smtp-Source: ABdhPJwySs16PorVSXAIzG2mrMIXqnP7+7mpbX3ZWTHaWmF5wxm+NwI5OOrJcHd4Th8/CE2n3CaptQ==
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr27423312wrr.217.1614152019170;
        Tue, 23 Feb 2021 23:33:39 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id b7sm1930073wrv.6.2021.02.23.23.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 23:33:38 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2] mips: smp-bmips: fix CPU mappings
Date:   Wed, 24 Feb 2021 08:33:36 +0100
Message-Id: <20210224073336.32265-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210223124817.26486-1-noltari@gmail.com>
References: <20210223124817.26486-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When booting bmips with SMP enabled on a BCM6358 running on CPU #1 instead of
CPU #0, the current CPU mapping code produces the following:
- smp_processor_id(): 0
- cpu_logical_map(0): 1
- cpu_number_map(0): 1

This is because SMP isn't supported on BCM6358 since it has a shared TLB, so
it is disabled and max_cpus is decreased from 2 to 1.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v2: Fix duplicated line

 arch/mips/kernel/smp-bmips.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 359b176b665f..b6ef5f7312cf 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -134,17 +134,24 @@ static void __init bmips_smp_setup(void)
 	if (!board_ebase_setup)
 		board_ebase_setup = &bmips_ebase_setup;
 
-	__cpu_number_map[boot_cpu] = 0;
-	__cpu_logical_map[0] = boot_cpu;
-
-	for (i = 0; i < max_cpus; i++) {
-		if (i != boot_cpu) {
-			__cpu_number_map[i] = cpu;
-			__cpu_logical_map[cpu] = i;
-			cpu++;
+	if (max_cpus > 1) {
+		__cpu_number_map[boot_cpu] = 0;
+		__cpu_logical_map[0] = boot_cpu;
+
+		for (i = 0; i < max_cpus; i++) {
+			if (i != boot_cpu) {
+				__cpu_number_map[i] = cpu;
+				__cpu_logical_map[cpu] = i;
+				cpu++;
+			}
+			set_cpu_possible(i, 1);
+			set_cpu_present(i, 1);
 		}
-		set_cpu_possible(i, 1);
-		set_cpu_present(i, 1);
+	} else {
+		__cpu_number_map[0] = boot_cpu;
+		__cpu_logical_map[0] = 0;
+		set_cpu_possible(0, 1);
+		set_cpu_present(0, 1);
 	}
 }
 
-- 
2.20.1

