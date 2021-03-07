Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A59E32FEF7
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 06:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhCGFOt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 00:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhCGFOa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 00:14:30 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEAAC06174A;
        Sat,  6 Mar 2021 21:14:30 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id n9so3260726pgi.7;
        Sat, 06 Mar 2021 21:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F+YVVQrR9usFwFHLHDb8DCk5WVuJFinX4Whwvzf0h2k=;
        b=XTluanGcbF7jemYSMsJxw2LT7WcYCYC32MimrKVb62MIdeGohABL0zEoX70nzGmuaf
         Be9RLVoQnpmf+Txzy0uznUUkc7E+6RbiSmf7eyKjnQV657T1RW2ya+yUdsBmjOXnGrCh
         3YR+6sKA0J9rTwvXsG9a3RXlUkeriRYvyJ9GuLpgiyLKMt9zJvM6B91KS5968jrW1hoB
         87nlbjjOI1cknUBneksI2M/b+ieM8OC845Ubo2h5RppFXu3cRhUf4igD4Niw3OqNFSqN
         fH7HU6n+hGXEeu9VhS5SO1yrCq2kuZz980sauhziJXAUe/OJ2LoJK4ZZU4HjBTmYnobf
         Lxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F+YVVQrR9usFwFHLHDb8DCk5WVuJFinX4Whwvzf0h2k=;
        b=ZURxbTzPgpIEHyYnPRGS2oeXVOhvyR3Uy1gwVMqlc2Goci+u9y1zY6vdkxauRaSM4B
         8UABrNLJ3x3sVAej8vLEwj637Ef49KFy9Dju8dlNRJJBn9qBFt89gNOl/6hcweEaWDfN
         itxhJfbF8CZYXKqOVuJbap1TXK2OujWXvLdmat95+uZTXJJKxZEs1xfxTsJ+HV0wdPo7
         oRpXpky7X41IEndxqHtHSyGPEHZ4oVILwFDlTafZnGDuFzAtpr2SKWgDMckvuwVis9bZ
         XK/KCIVhYSGeMIpbHu/J2pLvfGf7KwTYQJipLPvU/+FmUGOEW8QuRmYsmUMSFP70aEwR
         CmvQ==
X-Gm-Message-State: AOAM532VHeEbkWI829cpf5OR/87IExY8MsIq1yGIBfOwOHGjgviyjkWU
        GB0GWwnfhxt3B/2nHpNH3mM=
X-Google-Smtp-Source: ABdhPJydvcw4whi+IUZqFP+fBiY9iwqOT/QsSxnG/IfeJpveaZNmrppJWAf7DwYMgE6y9HkzfjBpSw==
X-Received: by 2002:aa7:86d9:0:b029:1ef:4f40:4bba with SMTP id h25-20020aa786d90000b02901ef4f404bbamr12799065pfo.54.1615094068923;
        Sat, 06 Mar 2021 21:14:28 -0800 (PST)
Received: from z640-arch.lan ([2602:3f:e6a6:5d00::678])
        by smtp.gmail.com with ESMTPSA id 2sm6546318pfi.116.2021.03.06.21.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 21:14:28 -0800 (PST)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: ralink: make RALINK_ILL_ACC symbol visible
Date:   Sat,  6 Mar 2021 21:14:16 -0800
Message-Id: <20210307051416.3197109-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The illegal access driver is optional - it is informational and does not
provide critical functionality. Furthermore, it is currently not
functional on RT5350 SoCs, so a user may choose to omit non-functional
code on that platform. The default is kept at 'y' for backwards
compatibility. This change only makes the symbol visible and adds a
brief description.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/ralink/Kconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index c10d8b233ab1..c20c44788b62 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -9,9 +9,14 @@ config CLKEVT_RT3352
 	select CLKSRC_MMIO
 
 config RALINK_ILL_ACC
-	bool
+	bool "Illegal memory access IRQ driver"
 	depends on SOC_RT305X
 	default y
+	help
+	  This enables notifications of illegal memory access events.
+
+	  RT305x/RT5350 SoCs have a special IRQ that fires upon an illegal memory
+	  access.
 
 config IRQ_INTC
 	bool
-- 
2.30.1

