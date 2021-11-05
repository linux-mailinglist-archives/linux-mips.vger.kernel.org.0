Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25DF74465FE
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbhKEPpD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbhKEPo7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:44:59 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7798C06120A;
        Fri,  5 Nov 2021 08:42:19 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 127so9231643pfu.1;
        Fri, 05 Nov 2021 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GNmFMVscVFJe4JSrxFDPWG8YQgNhBZi7EUnIsVKloIU=;
        b=cUU1K7TpRNod84ZZ8oDXdeICXMvaaUE/FGvcVaV17lDl9yvcqPzxfWmnR8KsUj1WCP
         XXF4NDLqheTGi+1xEJ4rfCxQhw0mNFzDlgX0M8UF1pXtQI1M19dKVQ1SiuwmeGRyjN8I
         uG4V8f2Yb3WagI0Rznndb+BzeKw6K1CUQqbqWUG9DTihOBf4gXgP5KLjFEYSYSS4f4KD
         HUDB5lG5ZaVP5Ikl2FqL8D3DEYVHyX2T5PNvNedof4HyIEWN+KPz37fcipIIjmWw9GJR
         mEnMvNvSAjcsNQQQP3QHS7eQKuKwUA71+yho7oNlQ0YkCer6kg6Q6Id5f6nMZdeHLL79
         hkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GNmFMVscVFJe4JSrxFDPWG8YQgNhBZi7EUnIsVKloIU=;
        b=bjFu2PHY2TZcib7MYnQnm+YDHqNv8LnDe4ZnECFF27dCFvqx+yf7G/5QWu4qTNmfx5
         WJg4zVZ6tO5fnbY30+EvnlrCjhiOF69bEhYTcNJQuv2n73lRz/1JJVKRjkTmblEhy+Uh
         4kS793dtKLfXVoVj0UiCPUVNy/z9ouZH6p+yobmyfSbq2Metauu/IN5tO+3y0WfQPEBa
         3W/Ssuj/fR4E5Ni/NAeSdKZxNPysC7vgCsejl8Z90GGF9mpvsuho/vsP3lgagZJ5k7YN
         0qEZmSVVi1zN6LMsUwTW80TX0jlVizGHc6jLpa2szTjdrJ/e/nrz3cgDitrjMf7C/Hlg
         MboA==
X-Gm-Message-State: AOAM533NvKUAJHkkGamsGKhLLp2mibuZsWspoQ01Bgqkexx2Q1EHZtWe
        fBdaJUFEL+RqnBVmXR1+P2BILwgZy0g=
X-Google-Smtp-Source: ABdhPJyBNmZfVz43Jy2lUhklC/2cmEGO8aGw7EavPHaUtwpPqEDHKFdh3aCGMJAVIWdeg/0Gy9D78Q==
X-Received: by 2002:a05:6a00:1381:b0:480:fde6:35e4 with SMTP id t1-20020a056a00138100b00480fde635e4mr40741071pfg.5.1636126938918;
        Fri, 05 Nov 2021 08:42:18 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b8sm7547097pfi.103.2021.11.05.08.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:42:18 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM63XX ARM
        ARCHITECTURE), Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-mips@vger.kernel.org (open list:MIPS),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM63XX
        ARM ARCHITECTURE)
Subject: [PATCH v4 4/7] watchdog: Allow building BCM7038_WDT for BCM63XX
Date:   Fri,  5 Nov 2021 08:42:05 -0700
Message-Id: <20211105154208.614260-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105154208.614260-1-f.fainelli@gmail.com>
References: <20211105154208.614260-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CONFIG_BCM63XX denotes the legacy MIPS-based DSL SoCs which utilize the
same piece of hardware as a watchdog, make it possible to select that
driver for those platforms.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bf59faeb3de1..b461bc80b954 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1753,15 +1753,16 @@ config BCM_KONA_WDT_DEBUG
 	  If in doubt, say 'N'.
 
 config BCM7038_WDT
-	tristate "BCM7038 Watchdog"
+	tristate "BCM63xx/BCM7038 Watchdog"
 	select WATCHDOG_CORE
 	depends on HAS_IOMEM
-	depends on ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
+	depends on ARCH_BRCMSTB || BMIPS_GENERIC || BCM63XX || COMPILE_TEST
 	help
 	 Watchdog driver for the built-in hardware in Broadcom 7038 and
 	 later SoCs used in set-top boxes.  BCM7038 was made public
 	 during the 2004 CES, and since then, many Broadcom chips use this
-	 watchdog block, including some cable modem chips.
+	 watchdog block, including some cable modem chips and DSL (63xx)
+	 chips.
 
 config IMGPDC_WDT
 	tristate "Imagination Technologies PDC Watchdog Timer"
-- 
2.25.1

