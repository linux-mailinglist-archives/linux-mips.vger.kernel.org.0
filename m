Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B3922DBA9
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 06:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725298AbgGZEP4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Jul 2020 00:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbgGZEPy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Jul 2020 00:15:54 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BD3C0619D2;
        Sat, 25 Jul 2020 21:15:54 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a9so7335400pjd.3;
        Sat, 25 Jul 2020 21:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4WYzTUUdMZgoaXQcj1WqQmcltrZ3z5zlJgG5BDAvVq0=;
        b=Mds+cXhHNoz5AXlWOYXU3s73JA7XvAoKNrtZ0EoUYw/9juGs858oarelVHf6MWejx/
         K9qwRNU48Io3CpDFBwMxYkMly/guogRkDhKc5l4Cfga+EVXIORgOW2e12NUAcOcdZKr6
         oK52z8X0jkbOo/87p2Q5o9O+QLCnpKDmL+Avmq9S07uECG3Kh6MTBpGsxOZlNaFT1Wcm
         EJSyRBFw2X/6m3tRl0UnAJOcRaT3+hed9IcREYVk5eKDgZjYcsT7x7BN9f2MLYFpfix/
         PA82QHvi9dKmU48qqAmpIedC24aGdFnWkx/FnvfnLjgVb4TxRXGoe+N3HJpIIfJr3Vcy
         kE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4WYzTUUdMZgoaXQcj1WqQmcltrZ3z5zlJgG5BDAvVq0=;
        b=CQGXSaFWZXDKL9shWKH2aJ0QQ3xjSUTTd6elt3lAZ40pGFJRKcqqQcDKmTVqc2CRN9
         n0XM/k0vB7pJ37YowTgAvP0kmahesETFSSW2OqVO2odok/cFTRjIhoQHAY4Qj495JYzU
         me6y2Uw1DRe5DJ+AW5HJoe+1vkseAHNY/ECta9Hw2LjdrV5sI+zrw2sIJR5qdsOo7G2f
         zXIWGwrd9vbSQWJ4QLnbsbtDlr/WGGIv6ujQTkiosFYryFCSjVEyCVlkgFaeWRJXqnLR
         1bKavAt3llRNCIeVp96JkKXlVV8zIcR7eBpCycJqC7WAQoP+1+7sCefZ872WtXVx9V5e
         Wjrw==
X-Gm-Message-State: AOAM53084VzbBvpedeXI+i2J0u9eoRTKDK7AbSytwZ1a+6HWIo2V7Moo
        fmbEnuSe3HOqiVaRtsmrCK0=
X-Google-Smtp-Source: ABdhPJysTVPd/ymZRoYHMSRlnRVchHuwkNi4184gSgJMYsFYwQOSJsmMh6BDWtCwUSoGz2ypa3V9tg==
X-Received: by 2002:a17:90a:648d:: with SMTP id h13mr11662239pjj.44.1595736954007;
        Sat, 25 Jul 2020 21:15:54 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id d16sm10725568pfo.156.2020.07.25.21.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 21:15:53 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@linux-mips.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org (open list:BROADCOM BCM47XX MIPS
        ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] MIPS: BCM47xx: Include bcm47xx_sprom.h
Date:   Sat, 25 Jul 2020 21:15:21 -0700
Message-Id: <20200726041521.5398-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200726041521.5398-1-f.fainelli@gmail.com>
References: <20200726041521.5398-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that bcm47xx_sprom.h contains a prototype for bcm47xx_fill_sprom,
include that header file directly from bcm47xx.h.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/include/asm/mach-bcm47xx/bcm47xx.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-bcm47xx/bcm47xx.h b/arch/mips/include/asm/mach-bcm47xx/bcm47xx.h
index d7f1ef246d5c..93817bfb7fb2 100644
--- a/arch/mips/include/asm/mach-bcm47xx/bcm47xx.h
+++ b/arch/mips/include/asm/mach-bcm47xx/bcm47xx.h
@@ -10,6 +10,7 @@
 #include <linux/bcma/bcma.h>
 #include <linux/bcma/bcma_soc.h>
 #include <linux/bcm47xx_nvram.h>
+#include <linux/bcm47xx_sprom.h>
 
 enum bcm47xx_bus_type {
 #ifdef CONFIG_BCM47XX_SSB
@@ -32,9 +33,6 @@ union bcm47xx_bus {
 extern union bcm47xx_bus bcm47xx_bus;
 extern enum bcm47xx_bus_type bcm47xx_bus_type;
 
-void bcm47xx_fill_sprom(struct ssb_sprom *sprom, const char *prefix,
-			bool fallback);
-
 void bcm47xx_set_system_type(u16 chip_id);
 
 #endif /* __ASM_BCM47XX_H */
-- 
2.17.1

