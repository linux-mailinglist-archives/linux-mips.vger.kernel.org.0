Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC8E24265C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 09:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgHLHwm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 03:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgHLHwl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 03:52:41 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F37C06174A;
        Wed, 12 Aug 2020 00:52:40 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k8so1023379wma.2;
        Wed, 12 Aug 2020 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nur6pxS01LRZqcrFJZO5ePHhqrKykVC60TYIT6WDyBA=;
        b=o5gVZiDZwQiljKUQC3cv4HxMTYAAyZ/ovKdvbyeZxqJZ7muD08JBzmJ4fiWgG2IXIo
         61rpUQaV+TwKE65DlNTf2PUBgX9Nad9wAshZmTCn3cbPDdX/N/CPEpI78+zH1+bMU1Ps
         N2oAfXYzezelg9bKwiOg9554smreq2a4/S27aTPrRAcoO7mx+WGTZbMEbov5+IEEdnhl
         ecwXdL5Vx+0+U/nCcah/kRv59Lb7rxHQ2+UkQkZsYR2xyCBKfdTv+WKAlgcCZio+IW4M
         qU4T57mTakxQK+M54KNo/RgQGOQtye9CyoiuKrypM1UsgccscvSJjtJVoVI73QnevFfV
         hqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nur6pxS01LRZqcrFJZO5ePHhqrKykVC60TYIT6WDyBA=;
        b=hyy3CYJRDXKbqr81g91145BSG8TFzJDz3XGngEzME9p6aC11mZ9tELxNkskhLjni3K
         KT53WuFfaceM6jlu2ou2+5uOlxVJXPLuujNyX35PR4rkuiMO7/DE4CgmJuSDLCSeDO0C
         FFnGtwXnnRXy/1YDqGjwjEQS8EtX6Hiar9IW4EYY2OJnHAoTwWIfAeT7a/0K+LiLE7cn
         9zHe708fj2VenE384/Nr0NiwzwQ6+ASjMkG8uMGCH7Iu9CwStGU3OB75f53XAaKNQiHF
         MEPjEJXsA/yVwUgPDQQ1wV3bNWkb4oWmcrvvk+043RCKCI6ZXvqkvoUR64NLRC3nGeEJ
         3w1w==
X-Gm-Message-State: AOAM531hy8v1JLua2QECCO5QKfej8xoP2rQbxNrd+yDqvLrwZU8Fb7rb
        KjuNoI4YBhj3GHJMO7+v60g=
X-Google-Smtp-Source: ABdhPJwQXl8p04MtRtem0bnoEu6eowTeps/Eub06KgvCb6XIMqV+T0JmR53KivE9PTg6d59exyu3ZQ==
X-Received: by 2002:a1c:81d1:: with SMTP id c200mr7300440wmd.162.1597218758608;
        Wed, 12 Aug 2020 00:52:38 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id 6sm2470984wmf.4.2020.08.12.00.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 00:52:38 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 1/5] MIPS: BCM63xx: remove duplicated new lines
Date:   Wed, 12 Aug 2020 09:52:31 +0200
Message-Id: <20200812075235.366864-2-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812075235.366864-1-noltari@gmail.com>
References: <20200812075235.366864-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are 3 duplicated new lines, let's remove them.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 v4: no changes.
 v3: no changes.
 v2: no changes.

 arch/mips/bcm63xx/boards/board_bcm963xx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 230bf27c1fb8..744aa16bab12 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -32,7 +32,6 @@
 
 #include <uapi/linux/bcm933xx_hcs.h>
 
-
 #define HCS_OFFSET_128K			0x20000
 
 static struct board_info board;
@@ -337,7 +336,6 @@ static struct board_info __initdata board_96348gw_11 = {
 		.force_duplex_full	= 1,
 	},
 
-
 	.has_ohci0 = 1,
 	.has_pccard = 1,
 	.has_ehci0 = 1,
@@ -580,7 +578,6 @@ static struct board_info __initdata board_96358vw2 = {
 		.force_duplex_full	= 1,
 	},
 
-
 	.has_ohci0 = 1,
 	.has_pccard = 1,
 	.has_ehci0 = 1,
-- 
2.28.0

