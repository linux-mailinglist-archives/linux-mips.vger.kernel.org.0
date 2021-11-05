Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D47446602
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbhKEPpF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233477AbhKEPpC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:45:02 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29BF7C06120C;
        Fri,  5 Nov 2021 08:42:21 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id p18so11255119plf.13;
        Fri, 05 Nov 2021 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5tJguGsd/yhajMqKVQpl9RHTa8E0C6uvBpHGThfw2qI=;
        b=Ea3yMADmZmIS2dtEg/ThXtD2S5Bs2Z0UVK6FU/d5NURRF+L/iMdgJsYgIgU5iccQKg
         4WhkSmBoGSfzReZF8XiIWGKYsYdYITqEXGYy4W6C3sVyTZg8bDGeG/e0OQ1SWMEql8kj
         I6R9XaUCGoY59YWUZMwZp2x/Uc4hGENT1TN8cmdQyQMz+dXonHEWA0NZEJEcRwzQePA/
         3APBoGks+V8EjX63hL7GxaW4Nc8s8e3S4WmdZDBQcu/b3AN9qe7eAK0+ua+r1DA+T6Cd
         JePN6WJE3f+148lPhpwoQGbR1onAb5E/H65VlPg5FHohHe+UCaNMoa18P71VsPOxbb9u
         i1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5tJguGsd/yhajMqKVQpl9RHTa8E0C6uvBpHGThfw2qI=;
        b=KO1tA8rQD5izmfvVjPXgC9NUW4xZp2JWzRT2PHZPjEqwgtWrk3v+a7FW0JJqp4hsFw
         TrP9odvcjY2sJ8+eZV2VILPOPNJYsd2j663TKqy2FPDocXCXM/zzCLF0TkFtBmJ/Vm3N
         ZwrJOFe1UG0PsQYhXJsEoTaR1zNyXxiwwiyrfStXIyJA6qsUH6xnSASn32zVkIud7tW8
         fglMIIT9BytG+BmQcpiu5g2zImr9HxAZO31UqbErxtY4K121z8Z2Trz9NynU+iZszIyw
         R4ESbE6RuOrG+eqTe1WKSE2i/+c96ktqkNNF8EwRTyclROhH1/IVHbWahc6h+zY3DWeQ
         LGXw==
X-Gm-Message-State: AOAM532jLK2ZlX4diyeXMUtZZRv+2T17ZJNUFZDssUaO93/7/aImBwgX
        eNhRXs+aP3e/yvt+c5s+MMxP4FCgGm8=
X-Google-Smtp-Source: ABdhPJwirHuLA3Dxs9ZbG4h/i+OUmUOAhxmWTO33lSjWqpljyYYQD2h+Qnhe6mQrgU3oYpH3tEZdZg==
X-Received: by 2002:a17:90a:1283:: with SMTP id g3mr13812942pja.174.1636126940334;
        Fri, 05 Nov 2021 08:42:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b8sm7547097pfi.103.2021.11.05.08.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:42:19 -0700 (PDT)
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
Subject: [PATCH v4 5/7] watchdog: bcm7038_wdt: Add platform device id for bcm63xx-wdt
Date:   Fri,  5 Nov 2021 08:42:06 -0700
Message-Id: <20211105154208.614260-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105154208.614260-1-f.fainelli@gmail.com>
References: <20211105154208.614260-1-f.fainelli@gmail.com>
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

