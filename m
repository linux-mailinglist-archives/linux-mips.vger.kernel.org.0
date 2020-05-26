Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEADB1E2057
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 13:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388821AbgEZLDs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 07:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388818AbgEZLDr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 07:03:47 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80AADC03E97E;
        Tue, 26 May 2020 04:03:47 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u26so902023wmn.1;
        Tue, 26 May 2020 04:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WNmMCHQhQQzWJi0EZ9sZ2eNrgpixzlI5wsbtnbpPOeQ=;
        b=W8H3MQBsUXQUTKWEZv7Q4Wk5HwDwJdE5VIPVKx+zWM7nL/hLhk8fUgVZoZNICPIvG0
         1zoT0s+z/2Uv5zk25wqMi7ut5qOG+bwb93BOIqTvneSorUvGx/1fr4EsD7ZLWH6ZYPrz
         W+Z5ITMvhz3cPFDKQ6h7AU2ur68mjrW9SdlT7nW34AgQX712TTPrfUe9ZKbVpLEBaaDY
         i8ycYtToxxp1HYjSM45zR2OTK5bVlhZ7+DDBMndag9ROlbixbMr2v4u7ADw9zMFby959
         DE2F9pb9UXKhPQY4TGyfX/g/IgP17wjspC8azvkAo3B2XRw9fGf2qbJcb1ywsootcNWv
         O4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WNmMCHQhQQzWJi0EZ9sZ2eNrgpixzlI5wsbtnbpPOeQ=;
        b=GV/c8ooCXxooIXIDdNLXFb4Q1Ur5/TV8/7mfoRiBdgSxVPP9IKX1SmgBIuzJnK23ax
         16cTYT4SqGE0JuOLJYoXVVR2Ke39mk5B7MZY6b+CouwyX7CwcLIfxvEZ/+Hr0rwn/gYI
         TZAt60FRg9J4CHyvXXab47zFW+tjo8UkcLGsY4VuLyKfN4CVrgDPSxGrmxmaR5dEU7EU
         vVWGxh9omi2y2SBAJNxJZud3h5I8DTV/xusbN+GYVc5Pb2h7wVeaJp4fw0c3CtHii4Yr
         k1RJzUVsYMNNlixBIOUys4Cy5zt97Xx2jCjmamlu7Iq1mERf2ZZ+wkZza211SUHEIT1S
         ZFJQ==
X-Gm-Message-State: AOAM532EPbgnaS4HSlxY42Lx3pisNIwACbpOuuBa0PE7Rp2D4RjUIplA
        FwCPjE30qyxu8cw/mTD7/6E=
X-Google-Smtp-Source: ABdhPJy1dn8nJ7EBF1K3qfcolfl264laLlQTJniTWhVfeQbgu6WJ9Veq4i5pRVpVi/dlQexl8ZDiDA==
X-Received: by 2002:a05:600c:2041:: with SMTP id p1mr960165wmg.152.1590491026217;
        Tue, 26 May 2020 04:03:46 -0700 (PDT)
Received: from skynet.lan (172.red-88-15-120.dynamicip.rima-tde.net. [88.15.120.172])
        by smtp.gmail.com with ESMTPSA id l204sm11196246wmf.19.2020.05.26.04.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 04:03:45 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] MIPS: BCM63xx: fix 6328 boot selection bit
Date:   Tue, 26 May 2020 13:03:24 +0200
Message-Id: <20200526110324.1324754-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MISC_STRAP_BUS_BOOT_SEL_SHIFT is 18 according to Broadcom's GPL source code.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h
index bc3444cd4ef2..9ceb5e72889f 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h
+++ b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_regs.h
@@ -1367,8 +1367,8 @@
 #define MISC_STRAPBUS_6328_REG		0x240
 #define STRAPBUS_6328_FCVO_SHIFT	7
 #define STRAPBUS_6328_FCVO_MASK		(0x1f << STRAPBUS_6328_FCVO_SHIFT)
-#define STRAPBUS_6328_BOOT_SEL_SERIAL	(1 << 28)
-#define STRAPBUS_6328_BOOT_SEL_NAND	(0 << 28)
+#define STRAPBUS_6328_BOOT_SEL_SERIAL	(1 << 18)
+#define STRAPBUS_6328_BOOT_SEL_NAND	(0 << 18)
 
 /*************************************************************************
  * _REG relative to RSET_PCIE
-- 
2.26.2

