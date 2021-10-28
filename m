Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6DEF43E738
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 19:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhJ1R0M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 13:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhJ1R0C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 13:26:02 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F5D4C061226;
        Thu, 28 Oct 2021 10:23:33 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id t184so6683011pfd.0;
        Thu, 28 Oct 2021 10:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bxPuQkzCjr4bMQ3izqSZWCgKaBxIVRYi/TUmbbXS7uE=;
        b=P5KKMvNX1bJIQkbQ0KIWsN4VVsDaUpp4iRMBRmN1fQTu747kODxzth1c3h5mGtb2MQ
         xd3aZpqVaRe2XEgYANkMlXeZQRHvheHaS8d8HRoBsQCT4Goyl8x6YDyB1ZPEqFpBafls
         bjW82WrWlA+Xs8dxbtBliRRRWL2bPjk4ry8ATSCvFbNXMvA02EmtlCB7dqVpNB/HLOIa
         6NCCi+Os1KF6LIlnYbNbbdd0v+MSV6PruGzfI+Bwu5n88EPkXSd9fvTuAhnSAAwqLcP6
         F2msEek4uzVKZV+RNOA9loTD3uE+jKeBh6Js1f74bLgAafgKhOjv80fNCWZ7fxHeU5vD
         0MAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bxPuQkzCjr4bMQ3izqSZWCgKaBxIVRYi/TUmbbXS7uE=;
        b=g5YJIagffsCLwwt/eb7wTFLrf3lCsoAa+MzMPj7kfJfNxwlFNAMMRCD6Vs7rZ9qRvi
         CUao2uSmaj0oh6zP3NATr5WYUe2x4dDjngW/dFiYj6peYqPNHbHj9tFZsTB8bG+p5/CF
         bxUxhhpnnERtTII1ClfSRclmJyckYTseT4ASTLPLfasOKsnPo6vIcWDEYOYJMxuc4uXb
         K/US++yS/qbEdckmKFQVTPCE699FgTqdSYtNJuOFoC6Oli0hvto3bEt8jr5EKRX5HC5f
         LAWGZm1IVU2e0s1fjf/DdaXvdSTvq6P+HFRzzDUvzmy5OiIreK1ysPVh1dT18Ki90vzf
         QQxg==
X-Gm-Message-State: AOAM531+HM9kBSPR5TWkezvm5hecTJjuCOZiW6Pzd7T0ixq46koPZVeW
        Balw+tisxzT0KX7xTr5165NkdYYLUc4=
X-Google-Smtp-Source: ABdhPJygsi4s2rhQ4DJ9mTsOsL11IEbUC4qsAnXWI7VLCqPiGHiV8+dI5YPPuVUkgA0d3iDs6S+IlQ==
X-Received: by 2002:a62:4ed2:0:b0:47b:f2f9:8812 with SMTP id c201-20020a624ed2000000b0047bf2f98812mr5662908pfb.5.1635441812759;
        Thu, 28 Oct 2021 10:23:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id l20sm3222499pgo.67.2021.10.28.10.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 10:23:32 -0700 (PDT)
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
Subject: [PATCH 6/7] MIPS: BCM63XX: Provide platform data to watchdog device
Date:   Thu, 28 Oct 2021 10:23:21 -0700
Message-Id: <20211028172322.4021440-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028172322.4021440-1-f.fainelli@gmail.com>
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to utilize the bcm7038_wdt.c driver which needs to know the
clock name to obtain, pass it via platform data using the
bcm7038_wdt_platform_data structure.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/bcm63xx/dev-wdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/bcm63xx/dev-wdt.c b/arch/mips/bcm63xx/dev-wdt.c
index 2a2346a99bcb..42130914a3c2 100644
--- a/arch/mips/bcm63xx/dev-wdt.c
+++ b/arch/mips/bcm63xx/dev-wdt.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/bcm7038_wdt.h>
 #include <bcm63xx_cpu.h>
 
 static struct resource wdt_resources[] = {
@@ -19,11 +20,18 @@ static struct resource wdt_resources[] = {
 	},
 };
 
+static struct bcm7038_wdt_platform_data bcm63xx_wdt_pdata = {
+	.clk_name	= "periph",
+};
+
 static struct platform_device bcm63xx_wdt_device = {
 	.name		= "bcm63xx-wdt",
 	.id		= -1,
 	.num_resources	= ARRAY_SIZE(wdt_resources),
 	.resource	= wdt_resources,
+	.dev		= {
+		.platform_data = &bcm63xx_wdt_pdata,
+	},
 };
 
 int __init bcm63xx_wdt_register(void)
-- 
2.25.1

