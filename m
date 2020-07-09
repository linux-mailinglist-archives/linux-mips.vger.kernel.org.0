Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02C421ABC0
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 01:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgGIXmd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 19:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgGIXmc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 19:42:32 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E431C08C5DD;
        Thu,  9 Jul 2020 16:42:32 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z13so4046259wrw.5;
        Thu, 09 Jul 2020 16:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4w3mY8dRce2YSM1Q27IO4UqK6/aMeTR2SDeihQy+Qik=;
        b=J8doVttIiTOhEDp1n4SUfuPhQlprEVjYY9KcuJLUg0/2vXk3IG9wdhnVmLNzUZW2Et
         4rRGLvbLLtVxvDKMKKQ/6gwYxh1WF6vBfAt3MLQpBNzyZy97/jTMkJ+si3MAkfmVBnUu
         PeDo+d+l1qIxewnwsV7o2iS+9M7zUc3Pkm2zCoX4mfz7zpjdwt6A8E/QQAhhmRopid/v
         utbjG7ZoUwTewNvQYVcm+tVRzclmUHZNCxA8WObfsEPE8xi7qX2r8jV4WYt+Ier5G8ug
         qvJA/e4Nb2rxEJrEN39BUjbBBgKIFKF42/OGVin/CU809exdUe0SH2wVRJhUivSgbzBP
         HVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4w3mY8dRce2YSM1Q27IO4UqK6/aMeTR2SDeihQy+Qik=;
        b=XU9GnY/RfxbUwSCR6OFRZ6i8aGde1Bms4ouUYh0+pmBp7AsX6Iims9a6TTqKMSpcv8
         Ouykint2wGscM1CRD8M5LgO+rgDIhddMpNQYFwG8jZpwBIrRbRkcD8hKoLZM/LN74Mhg
         Q7c8iU3vZo3ER1AzKwjNzmfJrmq3CTpMcd4aMn6QuRX7Vx2m2Z+M3Rv5TRbCN9TMDLBJ
         IoKIfzNGucTFYRw38ZlC1BMC4kDEwRn/wDvSZI9/z3BitNJ+yMKiMXzqDRhXI4Qxj60Z
         /vSRjDGZMS9LVFgyuU1Gkxta9dL1E0ViMtMkfg1mpdNtbAine1UOOENvptQ9yl84L34n
         lWiw==
X-Gm-Message-State: AOAM532t3XT0Vqy0WmnTIa+yZu9yXTU/pnRoyB3+x+YiJ0cKtHnRLQCa
        18EtjG5BkIk03oocK+ZeQ8volPHE
X-Google-Smtp-Source: ABdhPJxmDxwwdel8727y2cVLTisEvSjH08iGdXcl433UXp/9DuF3EAKkY5c7J/eK9Q/SvV8Fw4jHJw==
X-Received: by 2002:a5d:62cd:: with SMTP id o13mr64149639wrv.272.1594338150963;
        Thu, 09 Jul 2020 16:42:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id f16sm6615034wmh.27.2020.07.09.16.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 16:42:30 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM BMIPS MIPS
        ARCHITECTURE),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE)
Subject: [PATCH] irqchip/irq-bcm7038-l1: Allow building on ARM 32-bit
Date:   Thu,  9 Jul 2020 16:41:41 -0700
Message-Id: <20200709234141.4901-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We need to have a definition for cpu_logical_map[] which on ARM
platforms is provided by asm/smp_plat.h. This header is not
automatically included from linux/smp.h and untangling it is a bit
difficult.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7038-l1.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index fd7c537fb42a..f36bcd296ce2 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -28,6 +28,9 @@
 #include <linux/irqchip.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/syscore_ops.h>
+#ifdef CONFIG_ARM
+#include <asm/smp_plat.h>
+#endif
 
 #define IRQS_PER_WORD		32
 #define REG_BYTES_PER_IRQ_WORD	(sizeof(u32) * 4)
-- 
2.17.1

