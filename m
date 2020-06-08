Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F6C1F15A4
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2020 11:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729264AbgFHJlC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Jun 2020 05:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729260AbgFHJlA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Jun 2020 05:41:00 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F53C08C5C4;
        Mon,  8 Jun 2020 02:41:00 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id f185so15807441wmf.3;
        Mon, 08 Jun 2020 02:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=il1m5NUP7re9G7KU6aHwcFuWrrrnzuYE/JMpUwdavKA=;
        b=CLeq0rnlvqkHw2Qlwfd/NB4okSe7BM4LDkARQWALxpxMU9NXeBR5tgGn6UbrJR8bvT
         o7MQf65r2QX2CAAHW7x7uYdO2NutqOzSjV0z/yDgc6S/qLiicFEVzsQL49h3mYHaid28
         QMO+r/9q7akBk72uMZkOPi6facaSCzUKjKo8rZf9FzqArcoi+QoqhPY3j00NrGP7KSNz
         1Z+P2U1Y42Nh8738GYGIyXhHp5EKWYXvvpCdOT/CBgDRJK7/oPndGA7Of+y+fm2HKUCf
         PFB+VZ74lrsqENdaBJMzQGFZe3YwKjHIJoinfXmAwj0tnLIq4/e6MmPRNkmD4z755hw9
         QqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=il1m5NUP7re9G7KU6aHwcFuWrrrnzuYE/JMpUwdavKA=;
        b=ZGr03K/LtwgBnnnpeo4QsmRlbYzYUC7xtUIumJY0EpB+XNOYpiCjzj2nYvq8LL73O4
         CBy5gd2U7DtAHopVRL86RcjLcQXHdXgP80PZaQVw0YfJHw88KDPYVH2YEYzbZ3xhJCZP
         de4uhpM2DN/Acv2zpU+sXRniTZfntGs+59ybj/sNuJ1ULLm8cotxnZ6UqgvcZWfxZGb3
         jGO19yCZUo30k/DjUSIHYXpGYE0sz3wFVNPGO+sNgKwL87nNzCYHe07Z8NspoYfA5fyf
         IpNhrIW3VCnihSCsu1QBTZL88kG2uOmXhxiX8+413eY2P9wx55+95SwIBN+EQKtTraRL
         M97Q==
X-Gm-Message-State: AOAM533wtFO10vs1uyauJ9N5h+tfC1ENHGVKpOOxCZlhhXKqWEk2pEOr
        8LhrqhzcxV3oIKIy3te2uvU=
X-Google-Smtp-Source: ABdhPJwdwqoWaP8+TMuOU5+m89nd/NKtrkkJcMfiuCxPYHjWwM/xJi7bWdkRUO3z4i7W8AInvcYxJQ==
X-Received: by 2002:a1c:4105:: with SMTP id o5mr15250547wma.168.1591609257618;
        Mon, 08 Jun 2020 02:40:57 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id a3sm22096479wrp.91.2020.06.08.02.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:40:57 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com,
        linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 1/2] MIPS: BCM63xx: add helper function to detect CFE
Date:   Mon,  8 Jun 2020 11:40:52 +0200
Message-Id: <20200608094053.3381512-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608094053.3381512-1-noltari@gmail.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CFE passes argument 3 as "CFE1".

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/mips/include/asm/mach-bcm63xx/bcm63xx_board.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_board.h b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_board.h
index 1d19a726f86c..5af07796e8c7 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_board.h
+++ b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_board.h
@@ -2,6 +2,8 @@
 #ifndef BCM63XX_BOARD_H_
 #define BCM63XX_BOARD_H_
 
+#include <asm/bootinfo.h>
+
 const char *board_get_name(void);
 
 void board_prom_init(void);
@@ -10,4 +12,8 @@ void board_setup(void);
 
 int board_register_devices(void);
 
+static inline bool bcm63xx_is_cfe_present(void) {
+	return fw_arg3 == 0x43464531;
+}
+
 #endif /* ! BCM63XX_BOARD_H_ */
-- 
2.26.2

