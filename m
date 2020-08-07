Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2584823EB29
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 12:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgHGKEZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 06:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728071AbgHGKEV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 06:04:21 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C8FC061756;
        Fri,  7 Aug 2020 03:04:20 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id p20so1145102wrf.0;
        Fri, 07 Aug 2020 03:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cf5QeGYVYLRSjclmAoqOV0mDosS8gPDcF89Y8SbowDY=;
        b=P+5pLdVevnnfQI44aAGws4HrbG/jyZLenE6qks3wTZbuZ63Er7J2xJ9S2+7Jo4L2IN
         6PVvtNliDKsqAwYO9Ecan5N1F+N8otuWyUsM26lNZdHMPjVy4JSk+Pq3IwWRFOBKtc8j
         vFDTJxPriQ20GPfpeRiCkYyo1wIkGaeeqomhBD3nBrvHSDZGExs7ZSIIwQ4J4Gt/+KFQ
         1AsJU2Vq5acQ7GpMUVDYNNiJJeaEpS42vyc5DflWaanb2/79nWls9VuYjCYzkKWdaWSb
         /gu/fxQSkhaZC0D7ARaUQ9fd1Ue4I5+t/Q2NSpK1Zn05+nT3jKA/jIBSA+xMj5fHEALQ
         Q/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cf5QeGYVYLRSjclmAoqOV0mDosS8gPDcF89Y8SbowDY=;
        b=E7K1CGUyz+fgWXqWZ8ehJ7REJyJq4zOuKZkbYJRitIyrsTET5VQ5EuoFd5uPIW3+JM
         0rcFu/5F1/wiHRcfL3OnfplwCMU+tF0HrPUVhzy6Fn2DEJAmfErA5mkkIxKQDqHGi5Hl
         c5iy3x2XXUH2yWjC9XZKz53RFjtJ56YABHbQINChZ4qCNKiwwQIfCN4itaUrwvVTsE3u
         R6crfm6I63kRCuJ5/13MT29Uxw+NlQZpbp6ZQa+/DQZwOCvR+AhwUxfL0OofDNscoLVG
         u3PNHdyPMbjC7YrNcCGe99WXK4FIhsnhx+jbVS8TEAGma49sBiQdstoTicFb78MII4UR
         TmOA==
X-Gm-Message-State: AOAM532Y7txEm0I4xuQbCEsag+yKp0T0DJLEQpn631fwH531ZgTLBDkc
        fYpomqXumoNjwdr/gtT0NG4=
X-Google-Smtp-Source: ABdhPJzS5MW70nWqGCI6WPvFiHzY0jdGuVil1e6MPi+5L3PPqqlw2O4VabTq3ogm9v9fSIOMCzuxbg==
X-Received: by 2002:a5d:6cd0:: with SMTP id c16mr11558331wrc.121.1596794657596;
        Fri, 07 Aug 2020 03:04:17 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id k1sm9875402wrw.91.2020.08.07.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 03:04:17 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 3/4] MIPS: BCM63xx: enable EHCI for DWV-S0 board
Date:   Fri,  7 Aug 2020 12:04:10 +0200
Message-Id: <20200807100411.2904279-4-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807100411.2904279-1-noltari@gmail.com>
References: <20200807100411.2904279-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

EHCI and OHCI share the same USB ports. Therefore, if the board has OHCI
it should also have EHCI.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
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
2.27.0

