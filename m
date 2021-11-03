Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0893C444B64
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 00:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhKCXRU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 19:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbhKCXQ7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 19:16:59 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642C1C061714;
        Wed,  3 Nov 2021 16:14:22 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id f5so3686608pgc.12;
        Wed, 03 Nov 2021 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5tJguGsd/yhajMqKVQpl9RHTa8E0C6uvBpHGThfw2qI=;
        b=i46YcPFhxeJhhR5TNgTJjEH3myValJYdzJWuapw45e3IBgNQzawBZOrfCNnqaRk0vl
         BJWq0d8tzSFe2k1GKL94t1zw5iOr35odGaURpRFE+IwUcAxIzxOE8H9lI15RICS9ZVpX
         gq9IA+hyNAR0s2nSVYiEI3u8xkzfwYis5Zb7Yc0nFYqwQAHKnrxH+grZfuIkE5yK64sZ
         SzVWuwnUPVSRwYBnE4cXnc2hrmm6dJiJMSInLQERMwzq4pvz2Iezx5kJObsCydHtGOdt
         CqSEYGya6XYBe/I53VGTD8L+mhhFtrpwi1mLs2DXxqpfgrz4ei9mSgpItn1nkxtbq350
         hvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5tJguGsd/yhajMqKVQpl9RHTa8E0C6uvBpHGThfw2qI=;
        b=XEFKI8ylwuzn/KvaUORKQWzEGi8z/5/kG+RZJ5nOePE2g6BEnB1PBx7lB/cqsnk/AG
         B7WMMpHJHT7Ys+RByMgzVe12z5xSuSIVUO6bn9zNUp0rJ+mqelpkLo4tXp74rH08ASR1
         mXpbPHsiTx0TN4bYg6vqNXjPfb6AYxlu/Q3aCDNc0oIeUcZ+0HwxubZvjds5B+8mGVsY
         EFjWTwjDVFtooLo30agqqIao6WpcjD1ehM07dqA10zti9AKwwnspzrpkqmu2kCHbwnes
         aO704Uyzmj8u1UNdlYF502y8jL0PJ1htjJo2SxoL7rYXU3hhyW2i2j87qa6WiSzJB5Hj
         9rxQ==
X-Gm-Message-State: AOAM531NgyWIVZSztEO1nRFMCy1vi1U/4R8FnwAyxiqPBQNQczyNYy/U
        9CJDaSaOIGFZsdDi8531QnhAm6RsbNo=
X-Google-Smtp-Source: ABdhPJz1ckvqLaN1kUqu98azVkkNO+1zbwA/6iP2o1lSawNhg4pK1LG/PnwPsSYg9iE4wQONeNfbNg==
X-Received: by 2002:a05:6a00:22c2:b0:481:1f34:d8eb with SMTP id f2-20020a056a0022c200b004811f34d8ebmr18675523pfj.38.1635981261766;
        Wed, 03 Nov 2021 16:14:21 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p7sm2613549pgn.52.2021.11.03.16.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 16:14:21 -0700 (PDT)
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
Subject: [PATCH v3 5/7] watchdog: bcm7038_wdt: Add platform device id for bcm63xx-wdt
Date:   Wed,  3 Nov 2021 16:13:25 -0700
Message-Id: <20211103231327.385186-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103231327.385186-1-f.fainelli@gmail.com>
References: <20211103231327.385186-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to phase out bcm63xx_wdt and use bcm7038_wdt instead, introduce
a platform_device_id table that allows both names to be matched.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/bcm7038_wdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
index 506cd7ef9c77..a8a0e8485125 100644
--- a/drivers/watchdog/bcm7038_wdt.c
+++ b/drivers/watchdog/bcm7038_wdt.c
@@ -223,8 +223,16 @@ static const struct of_device_id bcm7038_wdt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, bcm7038_wdt_match);
 
+static const struct platform_device_id bcm7038_wdt_devtype[] = {
+	{ .name = "bcm7038-wdt" },
+	{ .name = "bcm63xx-wdt" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, bcm7038_wdt_devtype);
+
 static struct platform_driver bcm7038_wdt_driver = {
 	.probe		= bcm7038_wdt_probe,
+	.id_table	= bcm7038_wdt_devtype,
 	.driver		= {
 		.name		= "bcm7038-wdt",
 		.of_match_table	= bcm7038_wdt_match,
-- 
2.25.1

