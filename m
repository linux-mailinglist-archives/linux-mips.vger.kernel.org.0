Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3EB43E72C
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 19:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhJ1R0C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 13:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbhJ1RZ6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 13:25:58 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106AFC061570;
        Thu, 28 Oct 2021 10:23:31 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id k2-20020a17090ac50200b001a218b956aaso5317209pjt.2;
        Thu, 28 Oct 2021 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oR2LJprpgFHEyfIkq+LYfT/MDesQwIEWxhTuihSkoAY=;
        b=opoQgMZT/goPT/HH4eXbYBuQ7V1q6+ROLKtj6yC5iAJyGJCLuka+u5LAeWm9KaGwa/
         WU7t1MnywtIvYfCDQeIs2UmXJMR2CBqnxKTucZkDir5RynRcwuznMotV6QnIoXNW0IJc
         KKVwpL30/7Emc39xMhl+p93VVz6jbEKY+0R+Nu8wVqmb3E2FRgXXfEWAQxgnaEkWsxVo
         1md4untwWu+izVXouX0wqY2+kVStCx+Nhx/lFZD6PZ2c8YqTArGctxhZoQC5K4yliEM2
         ejVDgSBPVVJSpjYEPJ8LdsCK5vBPVJj87zj4f7xtYnf9RNtw1wn+v+CiOYrEq7B+Zcui
         yAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oR2LJprpgFHEyfIkq+LYfT/MDesQwIEWxhTuihSkoAY=;
        b=bLYY3bJXE4cY3ByEkczRa67Nh0tB/vc9cPGPRpQJSXneSRyg8LXIvOX0bmMhFeWzA0
         enkvjTuu1qGpR5uK//YHP4lfAGqLdaLFNFrnaHcpJBcJE03wKsSGVYVB2k/Dpkv6ZK0c
         CW9peprhAFqg1cJbeQEV/IABzHgieH24vWS+jkcVJITCwxFjb+WOoUuQwCHpNQiLXuZM
         7MjW4tThEs6ZeX8rFwet0vUzOp9+Pzrsvvu1acxD8UnCTkx8yfQ31chDaSKFd2Gk3Ovk
         03Wx8uF6dW1keSQigB/q6oWHyk6JbKIaCAr9n9w0Z9UkrZyMgXQ0C/x8rON/QsqR1I5z
         zPPg==
X-Gm-Message-State: AOAM530X1yTNYx3hLTroOyohClwVNfmvhLqz8YF9se5Ed9utkspcjCQs
        kQ89eRu5WR+5HS7oNLzi7bQ42fWuYwk=
X-Google-Smtp-Source: ABdhPJzt7fsv4JhCmKfJIpfvJr0gVsUJdII/D6p5iYsaSfSK9/tFlMqr+4dAk8g1zoVv0dh0jCDkMQ==
X-Received: by 2002:a17:90b:50c:: with SMTP id r12mr5783580pjz.71.1635441810244;
        Thu, 28 Oct 2021 10:23:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id l20sm3222499pgo.67.2021.10.28.10.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 10:23:29 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     rafal@milecki.pl, Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
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
Subject: [PATCH 4/7] watchdog: Allow building BCM7038_WDT for BCM63XX
Date:   Thu, 28 Oct 2021 10:23:19 -0700
Message-Id: <20211028172322.4021440-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028172322.4021440-1-f.fainelli@gmail.com>
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CONFIG_BCM63XX denotes the legacy MIPS-based DSL SoCs which utilize the
same piece of hardware as a watchdog, make it possible to select that
driver for those platforms.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bf59faeb3de1..24a775dd2bf1 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1756,12 +1756,13 @@ config BCM7038_WDT
 	tristate "BCM7038 Watchdog"
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

