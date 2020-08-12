Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D93242654
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 09:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgHLHwm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 03:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgHLHwm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 03:52:42 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB87FC06174A;
        Wed, 12 Aug 2020 00:52:41 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g75so1018903wme.4;
        Wed, 12 Aug 2020 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=929+dh1AtIEgfaabT2Jpl1udW5ZWOmPGilo19Uc2jmE=;
        b=j2DilTxDdjXBrTJ81JgbsPZzICYwPhEhS4YUdSJVX7UpvQggnn4XCuLBZCXeAyg8KY
         80euFMKmsPIJABMahJS30bBS/ILN3k24ClHqU1TKNsekx5NrFVyzGyV9UYi3NAs44Z+C
         ed0Hs/I4GhhKIl8jNuJtuAHwB8/i0WQ9V2+8H855/qUsK0Zu6g2uq1k3iERgVJnl9mdI
         nKMiYunXW8XQC/jqVIzSQqpDIcgw3Xcz+TsAZNGGZxbsL5/ieAk+/N94fak06aV8FptR
         rJLow17yxeethnbj9ncyd1RzdykqrZq0dvyj9nYaGx6ABhCu2Y5hSRhnYOJrm1t2V+Bx
         np9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=929+dh1AtIEgfaabT2Jpl1udW5ZWOmPGilo19Uc2jmE=;
        b=LvDo1uuNrVDhtTt2qQMm+99OvWwMsQARIny6FiwiYqaqOe6BzlvwskO4kyWK23F92c
         ZiPjMEDISpmQeUY4n0nVmtAXjBA7fvdpWAXcLIToJ77kQKVU2gOO9YVnQ9Tjj4BfOLHU
         Yl0vvOgpyXLWSSBgUF52L+ckkx4gQpOFiWwZ2jE21ohHpiW+W3+TFk9rkLZLrjtSVHH6
         fOrlIhxO98lraaj5EBL2Hjq+jSQvGZQljnnOQKRqIJaqIPmJmy0QWhXAYmbgT4t110rz
         1/D8mLpnOmegSZng2JnXdiLvXEcymqqgeYH9/CY8C12ptS2sfGjiChkAR2xT/B4chYig
         VmMg==
X-Gm-Message-State: AOAM5303QNuxqhtGlmH7bjOIIF39QrlaH81gX+tTGKK6baks+O1HovGR
        w3MsJ46CwMHHZcPs5o21hC4=
X-Google-Smtp-Source: ABdhPJx6YFEZgpPsw2QZ2xccLbfaZGwYAy9W2nrDDP2RyS8jW/lP1NnZEw8dgkaLijW7mxzMmdlNfA==
X-Received: by 2002:a1c:24c4:: with SMTP id k187mr7251153wmk.148.1597218760577;
        Wed, 12 Aug 2020 00:52:40 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id 6sm2470984wmf.4.2020.08.12.00.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 00:52:40 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 3/5] MIPS: BCM63xx: enable EHCI for DWV-S0 board
Date:   Wed, 12 Aug 2020 09:52:33 +0200
Message-Id: <20200812075235.366864-4-noltari@gmail.com>
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

BCM6358 SoCs have OHCI and EHCI controllers that share the same USB ports.
Therefore, the board should also have EHCI enabled.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v4: no changes.
 v3: Reword commit description to avoid possible confusions.
 v2: no changes.

 arch/mips/bcm63xx/boards/board_bcm963xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 45f1bc437245..ac9570b66f37 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -645,6 +645,7 @@ static struct board_info __initdata board_DWVS0 = {
 	},
 
 	.has_ohci0			= 1,
+	.has_ehci0			= 1,
 };
 #endif /* CONFIG_BCM63XX_CPU_6358 */
 
-- 
2.28.0

