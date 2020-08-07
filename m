Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8313223EA87
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 11:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgHGJih (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 05:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgHGJic (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 05:38:32 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E20C061574;
        Fri,  7 Aug 2020 02:38:31 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k8so1227561wma.2;
        Fri, 07 Aug 2020 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WB7bY6PeWX70+Ts0KFMg9NeYXKRvtcv8Jr8oZrBj/mA=;
        b=rnydLoHi9Ye631isxaAhBWPChgOxw0fmvEETmrf8GANs3IhFzAtyfVL6JdCSwCXZmS
         p8Tm/YWhA/A/zD/e8qW5nbBhbUhQW5k2qE+WVsY2PEmAZXtK2NaOwTk8gmumCwuhPlkp
         oLgUzOPjUN0YvZVvLzvDeJUPKy+lbo/tivz9f++Fq8s5iFPwrnP1drzAZwTNkhWfZVe6
         njVecTEGSOOuFhN4TRcmnTjuF/YEgZcmZPRMhW3rEBtnVaHWavX9MGp7J9EWbASwINDx
         eTGBgfEM34Wy8fgE4vSrXnfTKfWo270xv5h/LU62gT9LifmDOMXODxvT2EOs1OP5K1Ia
         2nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WB7bY6PeWX70+Ts0KFMg9NeYXKRvtcv8Jr8oZrBj/mA=;
        b=LS6pEMFuVBAK6p1dcA2VwUnfmJHP7a0HoCeHQBNphl6PAxsS/sZd86slBXgGbUAG4x
         0L5y0G+jS9AxmewaFudFgItLQqCxDzjE5R7q1vMLCg4R08aATywzv61tZaPzzHCzZCxv
         SIvbVTNfAuTjuWUDPsUquQrBujDDOzUziU6GS27eRCGezNcTJkdWMxDHetSx+NZa2syn
         OEIGSEca581Qb1e2TqlJgwwV4xe17NsQrR4pYnlwIqIY7e4iyLrM6UkzeI+1ZQOHCQyv
         2X77qqFOfJyzUe/ftasyTMXLOsQsPpSKEgOBuz3inRwP7SyNQeT/75DcoiFm1uiULo7S
         26Bg==
X-Gm-Message-State: AOAM533xqys9uB61RxH8B+teSqIBy2UJI4p3Fp40WEYHLWzX5xK3JD10
        H8Wtv7H2J/8b2/l4Ztx7qk0=
X-Google-Smtp-Source: ABdhPJy34KcoCpyoDNb4Y0HWBVSWOKa9fEu9o2EGa4bNWMMGqVRZOQ6tHUVN4ka//ZvUAx1yD7gXSQ==
X-Received: by 2002:a1c:4b0d:: with SMTP id y13mr11724915wma.6.1596793110625;
        Fri, 07 Aug 2020 02:38:30 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id q19sm9460529wrf.48.2020.08.07.02.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 02:38:30 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 3/4] MIPS: BCM63xx: enable EHCI for DWV-S0 board
Date:   Fri,  7 Aug 2020 11:38:24 +0200
Message-Id: <20200807093825.2902474-4-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807093825.2902474-1-noltari@gmail.com>
References: <20200807093825.2902474-1-noltari@gmail.com>
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

