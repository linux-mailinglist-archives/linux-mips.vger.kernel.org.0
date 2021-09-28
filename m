Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92CB041A582
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238761AbhI1CbW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238675AbhI1CbW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:31:22 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9829BC061575;
        Mon, 27 Sep 2021 19:29:43 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so1048587pjb.1;
        Mon, 27 Sep 2021 19:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=NjdUivUzdZIcWUfq2B+DqEDlK/vAyvuonMuyRazk71KUNcC4fpUD7TjAKBiGAyom72
         mOflpP0y3cWkei6yTX8aSDptcYnqhEQ0mUZ177b5CzwilJdMs+mcezfWU5FaaSQ4ErHz
         rmUREEThVfR3BpmMWcNbpkixlNQn2w0OUtRrTXKJKBOpGPINlFrjNJzPlDUsMrfyCeg4
         19OugXFdxnd8Hn5AZjcjiEqbgxVQ8ELNpIuPA7Tuv9fpAxIGoen0j5ylhH1xTe7yv0UE
         vNHaz3dmt0fNk6GRYa2tiAHeLOrhrm32oEmLAbbgyNLDdkiwMi0pKXZmRjVcZ1TIbXq1
         ttEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ALk99V/yV50Q7B1PyIb1+nfNEsL1ZZBgIrsEIIgD/g=;
        b=J84Bcw4k/sSzMwq+WsxDQZlhXsRaeumKD5SZ/BxVCr+oScZmsLlTtmzIyl6yznX4uZ
         B9YVVmGdJNuxWIBh6oJycU2NaALoR2MhljlMRO+cityaGqGQDAS4Ngz/1WtfMM0UQTNF
         /spxoIio1UHHC8Q3gAYoOJ32kXj3yNscKCGoKSQEO5iuDuZ39SxieccNyw00NXxt1hCn
         s30K/WDS18GnM0ncp0BZvcmkRpEm4F1zHxyVrmQh6CSH5L6rnz1Y4nz5XCzNl2TLOtBs
         1jfZxmz7I2MTF4YLgkjSkJ6L9UtjO6VnxBE/pyAviMCHqWZs26up5fENhoYwydZ9znQZ
         QDsQ==
X-Gm-Message-State: AOAM531SkuqPuDb0Ww2GazNIOyoNsu7emYLvEL9uozruOl0PB3Yok8Bj
        ZJ1d3S0uz7OcJEuwWJMwMOtAc9WkGsI=
X-Google-Smtp-Source: ABdhPJxGwwAps1QeBxtsZt7JyXBBjI8ez8OrLt7Uz9FaFSSrpN38TI9EVtDfYGOJM7LGUCpWsORpsA==
X-Received: by 2002:a17:902:710c:b0:13d:f226:2e3b with SMTP id a12-20020a170902710c00b0013df2262e3bmr2509463pll.83.1632796182846;
        Mon, 27 Sep 2021 19:29:42 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:29:42 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
        linux-sh@vger.kernel.org (open list:SUPERH),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: [PATCH v2 10/12] arm64: broadcom: Removed forced select of interrupt controllers
Date:   Mon, 27 Sep 2021 19:27:13 -0700
Message-Id: <20210928022715.369160-11-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928022715.369160-1-f.fainelli@gmail.com>
References: <20210928022715.369160-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that the various second level interrupt controllers have been moved
to IRQCHIP_PLATFORM_DRIVER and they do default to ARCH_BRCMSTB and
ARCH_BCM2835 where relevant, remove their forced selection from the
machine entry to allow an user to build them as modules.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm64/Kconfig.platforms | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index b0ce18d4cc98..2e9440f2da22 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -44,7 +44,6 @@ config ARCH_BCM2835
 	select ARM_AMBA
 	select ARM_GIC
 	select ARM_TIMER_SP804
-	select BRCMSTB_L2_IRQ
 	help
 	  This enables support for the Broadcom BCM2837 and BCM2711 SoC.
 	  These SoCs are used in the Raspberry Pi 3 and 4 devices.
@@ -82,8 +81,6 @@ config ARCH_BITMAIN
 config ARCH_BRCMSTB
 	bool "Broadcom Set-Top-Box SoCs"
 	select ARCH_HAS_RESET_CONTROLLER
-	select BCM7038_L1_IRQ
-	select BRCMSTB_L2_IRQ
 	select GENERIC_IRQ_CHIP
 	select PINCTRL
 	help
-- 
2.25.1

