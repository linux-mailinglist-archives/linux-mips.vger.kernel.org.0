Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384D543E732
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 19:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhJ1R0I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 13:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhJ1R0B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 13:26:01 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F198C061243;
        Thu, 28 Oct 2021 10:23:32 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id f8so4899505plo.12;
        Thu, 28 Oct 2021 10:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Wl3TUK3aCUY/WE6M31vfIUSYZE5a6wt51VNpZLD8VA=;
        b=kmNw/MN+gpxPUcTPOuN/pWTzakNMgWRdMYyc4PLuZJo+ZqVZcrYH6zIvh0XXz0BC0y
         2QXUvpMykOwULs0jyvCqlO0Re+XSUxK4FwAY1r8gocKooQn7yWGYRorGiM+lRCYLdp0L
         IL4/fC9DjoSTTuUd3nH+2cNsCjGjj0uT5WZeFDnVq9zOsX0dS/IVwXq3fBp47KXYCeD0
         UxqxKzb5+f/yXbrThTlfHTLbs4ob2RQVGyQPb5grQGLMS6eufLFsBkXS+O+r6SDuLS+n
         xxYrLFu0Yblt8TRoHr9WVVMr6Dqc5nzSdUGX+lPTou5VWBxZwWsfrLya64OWeBjANmgr
         31ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Wl3TUK3aCUY/WE6M31vfIUSYZE5a6wt51VNpZLD8VA=;
        b=s92c0u3uqNZ34Z8hD43XbRFG1kWvTMNuu2LxucgsXN50ax7M6NspOoThCX2xDysSkT
         3KCghs2j38cRGyPi3PHynE0gMgmJ556GfrTrHe7PFJU1oKNS5r/qS6oasi2lEAuPYPME
         i33qwP38vrJDVfw//R5V+kGV7jcDxBpRNLG++XQ4vI2Iq9raKrhV+AcJvoCiXLHKaBGr
         /+XG8Krj45iuGwauMBg5yGZkdH+PclH/YMFY2eaPxQj2pEs26sfqUJU5SlPwgNGb+w2a
         nktUqGZVLHhhioDWj+irLEYQ8sUqEGdYSwVJJ/2dXMPk1d5DURDOSMkRu1IoC9v5keCC
         r8og==
X-Gm-Message-State: AOAM531iUbJuTSdorJ5QnbFq46FXjyd7ZspSCIZWy8ReXaUlt/+M1ROg
        wARr3zpCXPVp1ZW9RRuLI+pKcpCMr78=
X-Google-Smtp-Source: ABdhPJwC9jCSOMcjBzLhb8HGU99F7nCWkJ9p01CV7EFTScT6TEJFC3EXEwKwi9sTXVATGr4S06u+Eg==
X-Received: by 2002:a17:902:d50c:b0:140:5f35:40f with SMTP id b12-20020a170902d50c00b001405f35040fmr4989860plg.39.1635441811487;
        Thu, 28 Oct 2021 10:23:31 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id l20sm3222499pgo.67.2021.10.28.10.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 10:23:31 -0700 (PDT)
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
Subject: [PATCH 5/7] watchdog: bcm7038_wdt: Add platform device id for bcm63xx-wdt
Date:   Thu, 28 Oct 2021 10:23:20 -0700
Message-Id: <20211028172322.4021440-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028172322.4021440-1-f.fainelli@gmail.com>
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to phase out bcm63xx_wdt and use bcm7038_wdt instead, introduce
a platform_device_id table that allows both names to be matched.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/watchdog/bcm7038_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
index 506cd7ef9c77..2535f450e8a1 100644
--- a/drivers/watchdog/bcm7038_wdt.c
+++ b/drivers/watchdog/bcm7038_wdt.c
@@ -223,6 +223,13 @@ static const struct of_device_id bcm7038_wdt_match[] = {
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
 	.driver		= {
-- 
2.25.1

