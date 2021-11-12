Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2AF644EFA5
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235900AbhKLWtk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236040AbhKLWth (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:49:37 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648A3C061767;
        Fri, 12 Nov 2021 14:46:46 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 136so4566553pgc.0;
        Fri, 12 Nov 2021 14:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XKmhYvw9V304NfvgcggX4aoYAGA8Osycb2EP7vxgFHs=;
        b=Iuq6wCyTfUr6cDPh9xSDWHYxfzD8ueDkal9urCKtY8u07t7+X4ystYUqc1q4IIkBjN
         nXAx5E1LH2lc3lkdcNYij+VR4lAeWMUqOQWsQsdS4P91NEtCc/2zYE7wS0/YgghzWFrw
         SPnVizTtEgppIEFuS0nf8onKnHCB+aFbBcSHTCdgGO04pNKudVitcEvLex0ZG7+WGf8U
         62YHijJeVk1PPvZsU7Dp96ZoGIRWtoEmErJ5AXLaV2bo6EeQHvBuqHYJsPWdP5Jm4vq1
         9nR3ciPeRFQnR74jQRwK17tDZMFo1Ut12jOHhKHpf98QSK+QZ5NGxpDYlUte74wYTehf
         wW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XKmhYvw9V304NfvgcggX4aoYAGA8Osycb2EP7vxgFHs=;
        b=BOLkHS0BpmYEppKTAyzGOsW8EppL2qAMLqqdCzYWuQtpir8DwwD2QVgt3BRRss5qz+
         8D1hK9eqIQAkviSe2+IdmkI9jH1niY85oqRQWKiRTV1hqkAcWDNZ7Tzi9aBjTk+nJD56
         3ddEhloVNCL6a8FwNoZeZlhgEOsfBLW2SKfLRiKyocglPiYoSiGeBfMWxd8WHhKnjrgK
         KnaCijNZRyR7+wtBFQTBU9unmdYi/foADVZ3M/l5l+/v20SjobucR5HSNsaf78wb91uH
         QP2eXxEe0N6pwMekmPpwf0IQ5rDD2fqgNsdzHE22m5XDUOI+PsfnV1r2u3a5rgpewH9X
         iCtQ==
X-Gm-Message-State: AOAM533xEm9jVsEgVy0ZicM4UtWyj+23cBHgwEKm4PGj15VCP+3c8ne9
        SHwMDuMhi9MSpeAjzt6UyllGwWF+kfw=
X-Google-Smtp-Source: ABdhPJzNUEaHOpCJSG98CaJIWfdCSLJi1SJEA4K31EYRAEdYAbtynIQSzGIdew1CyJtGM/tW/wWU8w==
X-Received: by 2002:aa7:8151:0:b0:480:9d40:8e38 with SMTP id d17-20020aa78151000000b004809d408e38mr16631708pfn.72.1636757205656;
        Fri, 12 Nov 2021 14:46:45 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm5647004pga.65.2021.11.12.14.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:46:45 -0800 (PST)
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
Subject: [PATCH v5 5/7] watchdog: bcm7038_wdt: Add platform device id for bcm63xx-wdt
Date:   Fri, 12 Nov 2021 14:46:34 -0800
Message-Id: <20211112224636.395101-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112224636.395101-1-f.fainelli@gmail.com>
References: <20211112224636.395101-1-f.fainelli@gmail.com>
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
 drivers/watchdog/bcm7038_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
index 506cd7ef9c77..8656a137e9a4 100644
--- a/drivers/watchdog/bcm7038_wdt.c
+++ b/drivers/watchdog/bcm7038_wdt.c
@@ -223,8 +223,15 @@ static const struct of_device_id bcm7038_wdt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, bcm7038_wdt_match);
 
+static const struct platform_device_id bcm7038_wdt_devtype[] = {
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

