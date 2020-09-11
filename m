Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13E6265DCD
	for <lists+linux-mips@lfdr.de>; Fri, 11 Sep 2020 12:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgIKK1T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Sep 2020 06:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgIKK1R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Sep 2020 06:27:17 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36397C061573
        for <linux-mips@vger.kernel.org>; Fri, 11 Sep 2020 03:27:17 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id l126so6985576pfd.5
        for <linux-mips@vger.kernel.org>; Fri, 11 Sep 2020 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=0Q+mRldzeNc4mUazAbCBa9vIrcqMaeg+luRlC+gamu0=;
        b=pHRJdEtOdmDSrNgpEaEzchIB53t4VBWbF6N0iAwIzGqLhOhdOllKVGevFzEa3fQ/6v
         th4/TXjwybFh5DUudJsyhRXUAwrfbbcC07s+uSJMlw9STAqQSGBX7w7nG8Z+H3+cTnux
         sUHwrNJUnw4dZUJfFPk/Og+cM1R8EBUsr7+Siu/YizewG6mQH/kf/MtKUfEDFSwQ3uE1
         Lvq6YFAmYxjOZtoodB6sp9jUoZuCkU3ZECGggbvuGOJh+Rx+5gDoziVp9kfKAAVJaVP9
         Y4MbCRKqrHC40E+jk3S/IrcvxHyl/ShRFXkK4OWUi6bIhesyYKmLUiyDtRB6L/SjGHS4
         gjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=0Q+mRldzeNc4mUazAbCBa9vIrcqMaeg+luRlC+gamu0=;
        b=e+REPP9khDHiY5KZDYMpEgG6Y1kNThU9Hq0exD1HRvKsM6+oUgSAyr9A126RUzdzXZ
         6uUvWLLNX4Dsl8Br/3GX0WMU5HF4UlJz92ETqzaIpMNkWRrMe1OYuza9BaDNcOOmwC9r
         9hwj8MGHmnJ3Mh1DgWGjfahn/vksyD8kx3PvewVHcQqivWnSptOzFqT5P/GWgxkp1ZOP
         Pc35KskuYirMmPH3RzUfKfQ9ycBoQ9HKvZXMeSOroylzGtJpp7bJmr16Q5Yz0YRX9L+o
         0OxpaoHjup04cMvoz9T8oF0P29kIyrtnExHSvqec3lTVL2b7TVEGTgIh37qzXdbW98ZA
         wJEg==
X-Gm-Message-State: AOAM533VO/BA96Zwv/3I8fpXgecr8mgfmfQw5h8u78iPyiUVhDyZfDhL
        vB37IeazRsWhH9LfvhZbsv8=
X-Google-Smtp-Source: ABdhPJyDlIqkP6hOQSjj1nAPNyVgDUxJX79AuKkOZXi+KacHTh6QwbYsQbfjeMTByjOuLOwIB4Nqiw==
X-Received: by 2002:a62:7ed5:0:b029:13e:d13d:a086 with SMTP id z204-20020a627ed50000b029013ed13da086mr1522248pfc.29.1599820036776;
        Fri, 11 Sep 2020 03:27:16 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id j24sm1612727pjy.35.2020.09.11.03.27.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2020 03:27:16 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 1/2] MIPS: Loongson64: Increase NR_IRQS to 320
Date:   Fri, 11 Sep 2020 18:26:17 +0800
Message-Id: <1599819978-13999-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Modernized Loongson64 uses a hierarchical organization for interrupt
controllers (INTCs), all INTC nodes (not only leaf nodes) need some IRQ
numbers. This means 280 (i.e., NR_IRQS_LEGACY + NR_MIPS_CPU_IRQS + 256)
is not enough to represent all interrupts, so let's increase NR_IRQS to
320 (NR_IRQS_LEGACY + NR_MIPS_CPU_IRQS + NR_MAX_CHAINED_IRQS + 256).

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/mach-loongson64/irq.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson64/irq.h
index f5e362f7..7450d45 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -7,7 +7,8 @@
 /* cpu core interrupt numbers */
 #define NR_IRQS_LEGACY		16
 #define NR_MIPS_CPU_IRQS	8
-#define NR_IRQS			(NR_IRQS_LEGACY + NR_MIPS_CPU_IRQS + 256)
+#define NR_MAX_CHAINED_IRQS	40 /* Chained IRQs means those not directly used by devices */
+#define NR_IRQS			(NR_IRQS_LEGACY + NR_MIPS_CPU_IRQS + NR_MAX_CHAINED_IRQS + 256)
 
 #define MIPS_CPU_IRQ_BASE 	NR_IRQS_LEGACY
 
-- 
2.7.0

