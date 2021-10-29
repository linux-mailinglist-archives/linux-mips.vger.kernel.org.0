Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAF9440212
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 20:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhJ2ShO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 14:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhJ2ShK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 14:37:10 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E9CC06120A;
        Fri, 29 Oct 2021 11:34:41 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id in13so5422047pjb.1;
        Fri, 29 Oct 2021 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Evr7N5kMFxVWl61tojIQcMmQ7hRRSJNw1OGzpeBD/UI=;
        b=p5fAVPj/yMhxSSyVDhufMakw6AkE5Za0+peL5uzSyULK0brWfIG5R84ArdCgclXOA/
         EraNDv7KUjU4SWJDRoPuwlGnnUehgXNilUKDkq4j4ssh+sndtm4alODwa3oI30mrAM+i
         8FR66oT8EUJWmrM1auY04Y7UG7yG9JDxNi01iun0PRtFPyVUtVF2Vha8BDrS1VXwIDmA
         jg8Hi4MCxeai4hSbXiuEhdySuryehukB6RpVT9QA/LHL7mag8LV5OYkZO6QejecSfZts
         SGW7XXl83dDCNqEZabfhwzqPs9pkvlAkuzqvIY7MZKlrpZAFTIHNdZ0wo5rvKFolYdSt
         ywhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Evr7N5kMFxVWl61tojIQcMmQ7hRRSJNw1OGzpeBD/UI=;
        b=ugc9PdybnS3hiDOyTN5hHJHt0duDGob6Sb9imH2yTNVHXvOIMmy+tO/BmdQe+eRvAo
         oeop/GWPoRvxtMVTyaLz+aAqiCgoXrfpLqiAD+4pwjiVMQhoIRM5dJgbF6aZWL6diqNJ
         cF9o/+4ZWaoQBHz+KB5S13NowfDqbtNqhScAKqA52XRmybPFYv1ogHZlAzkHNPgZnTyR
         olpfBSlVj0FMS4Y29LBnDmnxLZbgVs+NjXtQ8PP5oFQeidXVN+5KR2sxTnNb93YMsaLK
         NteccYW5dp1F3Yz4NGwuLn7vvFG8LavRiVkpEdGwCDXJZFB4tvi4UYEWoBf3szkF0o4O
         YjUA==
X-Gm-Message-State: AOAM5326JZ386nADCFJcReD4sHWy7QPtHEWiP8/e9VuTAM57D/kBYfEr
        gk7Nqho4koXsKWhMyoDN3fdErpnn9vk=
X-Google-Smtp-Source: ABdhPJz/1dGTabz/xd3DJgKJRoAfkUDx+2n9SMd403306qqafc5rrY8DskT5qrvp7YVg+sAjEsLSZw==
X-Received: by 2002:a17:902:a410:b0:141:be1a:53d1 with SMTP id p16-20020a170902a41000b00141be1a53d1mr1304815plq.71.1635532480950;
        Fri, 29 Oct 2021 11:34:40 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j15sm7730868pfh.35.2021.10.29.11.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 11:34:40 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     rafal@milecki.pl, Florian Fainelli <f.fainelli@gmail.com>,
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
Subject: [PATCH v2 5/7] watchdog: bcm7038_wdt: Add platform device id for bcm63xx-wdt
Date:   Fri, 29 Oct 2021 11:34:28 -0700
Message-Id: <20211029183430.4086765-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029183430.4086765-1-f.fainelli@gmail.com>
References: <20211029183430.4086765-1-f.fainelli@gmail.com>
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

