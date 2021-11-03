Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9A1444B63
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 00:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbhKCXRT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 19:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbhKCXQ6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 19:16:58 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10986C061208;
        Wed,  3 Nov 2021 16:14:21 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id m21so3687847pgu.13;
        Wed, 03 Nov 2021 16:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AYKs8DG5aY7Ez32ozoVHTajRv/Q2Rt0Xxh3ZKd1RZW4=;
        b=ghCXrz/kqRISKfiTcmzNDDkevcetSQzBSw68JqOjqDFPR6JLVcyzTh+eBDUYYkOK5N
         phGPACbF4rq9ipcxLuVKOxFBbBbj3dn53KkeY1i+vR9DKGnVBV5VcwLzhMoQHSRdVZMy
         r5OhgPVUGg2fNhnpkhRSrHV4VjBxpBdk7ONQVn0aGClsaFUrl+LWkl35IvNBtj9M8PcN
         HrAEDbmgxIi27PIwLiJdPx2G8nPahuvvw8MiwRemz6M1o3sC5oaZl7MaVP6ozEuKwqmN
         TdhkWi9aoz0Hd5ENAYgvtMj27qSsC1HHkE7eQxhhtIptggtWbr5cEKbiLQg03ZhPisH2
         l/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AYKs8DG5aY7Ez32ozoVHTajRv/Q2Rt0Xxh3ZKd1RZW4=;
        b=R9Q970JEhwfC4zFkGECPiN9RWFWS3wLojVHAYAtqnRlKd9Fi8P9+FmLKSEtQruZ5Gn
         1YVz8Zd/MnJPTxBwiBjNuwmuNEIOw1nMQ1jk+Y2rU4EgC6YTeZ7gO6vNGFPFOja7hJfu
         1k65eQVeTOLZ3Dc7ccijaKQLzYWjMJL+uS6ERhL+NrNm5tv5V2QG/IW3gRgFIJV0EDf+
         5BZNyh+0e2lz04jWvN5xOG6jZMZ4yBgmTKRuSRwhPeUm6izNoRBqPcmqDHNb+2uX7N1n
         3SKWG6fusm+pAjekvWmnZLiaDxdEVKpKaau/+LvG30E4azYrh01waIratPe7RGltyesI
         c5yw==
X-Gm-Message-State: AOAM530AImpeuU2L0i2XQrbx+QCanUNTeKsAbSumi2L8QN4NuZjxZAKe
        +PAXGKOYLhPri6/SLK1jcrf0KamvE5Q=
X-Google-Smtp-Source: ABdhPJzqaGgk4G2XlVB2TDrYcdgAC/XC0dwa1fn7D4CRo42Tk30pa2nBmniEbzktPiTpDvLOb1qv9g==
X-Received: by 2002:a05:6a00:2ad:b0:480:fae5:2693 with SMTP id q13-20020a056a0002ad00b00480fae52693mr30204115pfs.37.1635981260413;
        Wed, 03 Nov 2021 16:14:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p7sm2613549pgn.52.2021.11.03.16.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 16:14:20 -0700 (PDT)
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
Subject: [PATCH v3 4/7] watchdog: Allow building BCM7038_WDT for BCM63XX
Date:   Wed,  3 Nov 2021 16:13:24 -0700
Message-Id: <20211103231327.385186-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103231327.385186-1-f.fainelli@gmail.com>
References: <20211103231327.385186-1-f.fainelli@gmail.com>
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

