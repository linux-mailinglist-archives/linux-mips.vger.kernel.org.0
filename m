Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D5444EF93
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235965AbhKLWtc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:49:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233013AbhKLWtb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:49:31 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3D1C061766;
        Fri, 12 Nov 2021 14:46:40 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id b68so9643913pfg.11;
        Fri, 12 Nov 2021 14:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jp3KiRr2rMJ3YUGceGV4+xrMQDuVuOjeFd+9teN2X8w=;
        b=bpYsJjP3Rq+4dEb++BhxaMclap2vlIMSw3XRbOg4nxOJkri6IdLEtM5c8hSD/ooXtc
         +m3N2enFugPUCgMrBY6kL0hml8Xz7vMmzeBADOX3t6/RXUApc/HTRhs5BwrHzJcMgdpq
         cuMszcVr/ae0yskDgk6DCIN+vy33Mi3XvDGaOJ7FObBK8yDha9/dZ3DoRjir91pOzHh2
         71R/BAe9/KXmIMviekJq1PUy0MRmSJ0C23kY0gISFBs2cxvpZodqByPSuZeIkk+Y+vta
         Jgo6ACtOodWCu77e+0B/wA1UC24rzs4u0x2v8GyWOljYfZlSlHmFarzNVjLm8nQIG0Td
         //Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jp3KiRr2rMJ3YUGceGV4+xrMQDuVuOjeFd+9teN2X8w=;
        b=Ijrt3dAigJ9rSMbFWViXgfZ3oiXAjpulK1qIdMapM0mmLsPcMiEqApM70pn+DhLdMm
         k/y0OapNCRCVCOytlPJlXwBtbMHgH72jUi9U62n2x8DSlApaXvIeq4m1h9be5PW46BK6
         W+02ym1OyrwsRWVtwRHxl8FwMEMm+cvh2K5mm4KgOz0OewsgWw6OQk3o2BND2BpKZNYE
         NXj11TSg0KNZ4eeEPdpqmaHEQSoyu4rjHbPbCyA2PI3g1qDl555mht0RxiH0AHu3zg/h
         jC9JKLOQ2LdQUx/R0smXHxbbhzLwAH9khsbPzopoUMk/BYpkWshegCMmIykoe7pTfKqy
         +cLQ==
X-Gm-Message-State: AOAM530a8bgWP1Cz9Lv/4VqluO75UT/Zvrfuz8Mj31eXSxhf90vZ8F6E
        KzTsQS2au79+NY/n0WpB9ff6YFzC1zQ=
X-Google-Smtp-Source: ABdhPJxq2StxGms/1eikYZoj9oC+yelr2K+M2kAzjS9qqKocgPVOpvOw68FwGfGbyCydI1zFHB7Btw==
X-Received: by 2002:a05:6a00:1584:b0:49f:e5dd:f904 with SMTP id u4-20020a056a00158400b0049fe5ddf904mr16905170pfk.55.1636757199734;
        Fri, 12 Nov 2021 14:46:39 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm5647004pga.65.2021.11.12.14.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:46:39 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
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
Subject: [PATCH v5 0/7] Removal of bcm63xx-wdt
Date:   Fri, 12 Nov 2021 14:46:29 -0800
Message-Id: <20211112224636.395101-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

his patch series prepares the bcm7038_wdt driver to support its bcm63xx
counter part, updates the MIPS BCM63xx platform code to provide the
necessary information about the "periph" clock, and finally proceeds
with removing the bcm63xx_wdt altogether.

This was only compiled tested as I did not have a readily available
BCM63xx system to test with.

This should also help with adding support for BCM4908 which Rafal is
working on.

Changes in v5:
- removed unnecessary "bcm7038-wdt" platform devtype
- added Rob's Reviewed-by tags to the 2 binding patches

Changes in v4:
- fixed binding patch (Rob, Guenter)
- updated Kconfig description title to mention BCM63xx

Changes in v3:

- added Guenter's and Thomas' tags to patch 6
- added missing initialization of id_table
- use Rafal's latest binding patch

Changes in v2:

- added Guenter's Reviewed-by where given
- update binding patch to pass make dt_bindings_check (Rob)

Florian Fainelli (6):
  dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding
  watchdog: bcm7038_wdt: Support platform data configuration
  watchdog: Allow building BCM7038_WDT for BCM63XX
  watchdog: bcm7038_wdt: Add platform device id for bcm63xx-wdt
  MIPS: BCM63XX: Provide platform data to watchdog device
  watchdog: Remove BCM63XX_WDT

Rafał Miłecki (1):
  dt-bindings: watchdog: convert Broadcom's WDT to the json-schema

 .../bindings/watchdog/brcm,bcm7038-wdt.txt    |  19 --
 .../bindings/watchdog/brcm,bcm7038-wdt.yaml   |  43 +++
 arch/mips/bcm63xx/dev-wdt.c                   |   8 +
 drivers/watchdog/Kconfig                      |  17 +-
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/bcm63xx_wdt.c                | 317 ------------------
 drivers/watchdog/bcm7038_wdt.c                |  15 +-
 include/linux/platform_data/bcm7038_wdt.h     |   8 +
 8 files changed, 77 insertions(+), 351 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
 delete mode 100644 drivers/watchdog/bcm63xx_wdt.c
 create mode 100644 include/linux/platform_data/bcm7038_wdt.h

-- 
2.25.1

