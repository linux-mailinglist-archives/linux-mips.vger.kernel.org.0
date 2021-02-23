Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80B4322AC7
	for <lists+linux-mips@lfdr.de>; Tue, 23 Feb 2021 13:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbhBWMtC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 07:49:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbhBWMtB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 07:49:01 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB08C061574;
        Tue, 23 Feb 2021 04:48:21 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id o82so2315932wme.1;
        Tue, 23 Feb 2021 04:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qmz3/fq70C3LlV15nzNOy8AXupZs19LPK44Rkh90zQY=;
        b=QlNe1VGvSx5nv+uxzrkw5PdTAZQj8M7YKY/h7mwy/tuL28sT7puk4BedmSWmbrcEDo
         /ZUadYl9HhDJOFGJJmWAc97thhm+v+kRvOFVTuP6gM0hr95hovMEfef+te1tJ6654WQx
         +3OP9mQTc/A0lLeWqlqCRAVus/nHYL7Ko4pQhKhKXyJ0Mehv33yflNwmYoIzqPdXfmPT
         2Ue5IDlBrup0OZTiHMHZKrkliNxOcTmjbeEoxKiyqPyr5R7/KSkR9n4RuWGQao2zKxI7
         eZqafjYHELn47C8KGSxph2rIAiQpHfE5qKtRfLXxMRpLD3CXXIahlMewB9EacUtv2LSF
         yWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qmz3/fq70C3LlV15nzNOy8AXupZs19LPK44Rkh90zQY=;
        b=AWql9yTCLApoVg0rStaf5W8Xi2Htk7fUi6xNrYB43WBEzUfSnT0U8+o/G32BsbTKWR
         v8z8dEFZm4zHkIrlcX8Qcbq4mUJvpKtRhUiY8eym3BmeARJLyMIFM+XCRpxC2ghyJubk
         U3fQkroQX9AxpXaFgUoHulKVPxecxOb8Yr3dj7GC3zcm2J/lnooSyFv7PJJSqb1qAq6n
         rDRKAtQYjZgn+NIh5uE3iV05ynmwEsUdU4bw2FRw+Q7jWoH7obmCcidhEE5n/n1ari4N
         m0U8akE4zF/eJ7jgYqRSBDylnlbDBAqlBmIdYAqEU1V+SJ/d66Cz8KzLjzmkt7TQ0jkG
         KBCg==
X-Gm-Message-State: AOAM530yz4p0qu7y1hyfy106y7PH7xvPsT4rB9vC5KuXRKfws22LDCK6
        zU7oia+Iutjb7bC+gAIndQs=
X-Google-Smtp-Source: ABdhPJxb5uRJfnOTt5/kPU8upNF1hJhkWGMQO9j0pWN6DhSXy+if6IP7iS8bKnr9GPaGh43FzADWdA==
X-Received: by 2002:a1c:1b4d:: with SMTP id b74mr9535725wmb.31.1614084499857;
        Tue, 23 Feb 2021 04:48:19 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id t23sm2679604wmn.13.2021.02.23.04.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 04:48:19 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] mips: smp-bmips: fix CPU mappings
Date:   Tue, 23 Feb 2021 13:48:17 +0100
Message-Id: <20210223124817.26486-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When booting bmips with SMP enabled on a BCM6358 running on CPU #1 instead of
CPU #0, the current CPU mapping code produces the following:
- smp_processor_id(): 0
- cpu_logical_map(): 1
- cpu_number_map(): 1

This is because SMP isn't supported on BCM6358 since it has a shared TLB, so
it is disabled and max_cpus is decreased from 2 to 1.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/kernel/smp-bmips.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 359b176b665f..c4760cb48a67 100644
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
+		set_cpu_possible(0, 1);
 	}
 }
 
-- 
2.20.1

