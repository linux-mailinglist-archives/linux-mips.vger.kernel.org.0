Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF4F1F3CD9
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 15:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbgFINmi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 09:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728082AbgFINmh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 09:42:37 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF21CC03E97C;
        Tue,  9 Jun 2020 06:42:36 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g10so2869468wmh.4;
        Tue, 09 Jun 2020 06:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FpYJiNkgnSHlg1N1yUdznvApuZcA90h4iDgIFTGjijs=;
        b=VkyqjW1HowFHs2WIFKkETDwu91tkylxH0NZgn/byhqPmCbZYsftFITWfPq6LhV+Esn
         ZiCFZpMWRFfNyDs07EB1DhmFTxLspB1y0M/8OS0P3MLezzaKnV3np1rMiaOpus2eoWZV
         RRdxhJa4vcETlmTkjTBIX9I25g0fltscRPVN8LoFnpopLPNoIEzpk5/EzHMW6l6JqucY
         tcyhen0AbbSug8r3KFbgqEF+4kN2sbIvJUqnfQGrqG1JlgPhBT+7BrIbrzjmTY85E1U6
         1ccCTm1drVZbhYWKHH5kNt4vglFp9+MiC13MQcn48bndCnpI6Z9iZcXHxBj47L1AboLG
         INWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FpYJiNkgnSHlg1N1yUdznvApuZcA90h4iDgIFTGjijs=;
        b=iOxieKJTh9CMXRzDXcVyFTp2hpdtx1qnB8XZ/MI5RCAAVvJDkJ1FHW40dha/mhYFNC
         mxZmUftxfdFTejIEK4ngxOu6yFRvHWO5Q5NjejueUINU0zYCSxbrPRpNSMclqgfuxeVc
         CZAh7h6XU+DGyR5jUsmIJVGj2b4TITCpN3RLMez9kAmuoOICZWLRTtxyDw0Gw0OcGMGs
         EtVKlqGDd03gmYcHRibzwQVnD+vbR/SXZJmQiYFlAHSvKa+U9EzMor2A5Gf4inqtuMwh
         p3M/hf/UCjP7pLQ6l3xj7WlW7qu/1Tfzy/8nlOpjvYzliu7+QEBDG1j4Ux8QgNabqpft
         En4A==
X-Gm-Message-State: AOAM533f8wBanZUEQGUm/ncxervN82cA54UXJY8NMC9UJT4itGM3gCzH
        BVs/QTgxCgeRyfaPMYYVO8U=
X-Google-Smtp-Source: ABdhPJzGfhkeeAb+TCxjTnCktcdrUNsCpIfxWT1rgn5vz4ZrAQA03lJVXR/lvAsLxB7dk/uvUb+row==
X-Received: by 2002:a1c:dc06:: with SMTP id t6mr3434278wmg.118.1591710155588;
        Tue, 09 Jun 2020 06:42:35 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id w17sm3454067wra.71.2020.06.09.06.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 06:42:35 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 1/7] mips: bmips: select ARCH_HAS_RESET_CONTROLLER
Date:   Tue,  9 Jun 2020 15:42:26 +0200
Message-Id: <20200609134232.4084718-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609134232.4084718-1-noltari@gmail.com>
References: <20200609134232.4084718-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This allows to add reset controllers support.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 9dc08ee3d6b9..e82586e7719c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -229,6 +229,7 @@ config ATH79
 
 config BMIPS_GENERIC
 	bool "Broadcom Generic BMIPS kernel"
+	select ARCH_HAS_RESET_CONTROLLER
 	select ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 	select ARCH_HAS_PHYS_TO_DMA
 	select BOOT_RAW
-- 
2.26.2

