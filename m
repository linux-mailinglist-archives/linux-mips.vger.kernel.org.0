Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C646444B4A
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 00:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhKCXQy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 19:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhKCXQx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 19:16:53 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5542C061714;
        Wed,  3 Nov 2021 16:14:16 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id r5so4145961pls.1;
        Wed, 03 Nov 2021 16:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QgdneeDr90CN8wmrFjpBUWohcdLao8N/cmueq0TcKH0=;
        b=kYgrCw/itYf1DyUHmC85XVmOgfikR5g1oKY8qljKcZg+DNujGKoOoqOEMYkwB3yALd
         6vKftH1RvbZX+XCh4UhuORXmforka7VaKCUTSDRirVLC811z9ZbJE9FfP/LwBV3r5bAz
         cpVrMwA872imTP+l98f8qKYhFeeG+zzy41+i1B0tM1tzElo3gWUCsi9QgH+Bxxz30BpT
         Qa6/kif0zMFt4spczV3X/CGogMXUaJrp3F8tZmFqNb7VjPUxHNhdCCZnYqUX6SFzAdPb
         iRS5qZ/yjh5oZCSEUNp5a2YhYLBrRJkbGC7LjJ7wQm8j+AGZ/q7H3utfdLQRTk5I3G9Z
         l7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QgdneeDr90CN8wmrFjpBUWohcdLao8N/cmueq0TcKH0=;
        b=JJHBOIdI4BtKZGB8iI5/gZloOm+ZT4EgPs0Ue8smADBA+CDA3eyXkSqDLPVmyBffnx
         6WxmISZ+Xl7Fg4NIa5wiT6r/m6H6Kf6bM0MzVydbb/h53zcpEoFjCE3qZUIzOh8gZ9id
         WguPh3wHh0ZojEot1dQh5jYRTAYFP7uaRGyJNpczhl/TuBz5FKSX9KLgc7xfOmJuhPed
         4zPuITR7HTIny4KBqb4UW3dIJx1lBv6Jac+z6fT+dB3I7P1sGnKbGFIRSJ4uZdAoN+p6
         a+LuByyLToXDDgnPUzCiaYGA1M1D5TmwxWHzf3NDBKk+FvEtsCE69RqVqhqaACLiAId4
         Ph7w==
X-Gm-Message-State: AOAM533h1U3TjriSe04kPnLwMNYbkELi8/NjiJuMjdanDEw/cG5pMxsh
        ncsr2/hm44I0VwsL/IbV3fY9FDmM0yg=
X-Google-Smtp-Source: ABdhPJwHYnoS/yIRBvYliCSglghkyY+zI/18DkpHnv2zHJPi2vbKb3hpL1gC83a8dgifTucALiNuNw==
X-Received: by 2002:a17:90b:128f:: with SMTP id fw15mr17938891pjb.183.1635981256045;
        Wed, 03 Nov 2021 16:14:16 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p7sm2613549pgn.52.2021.11.03.16.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 16:14:15 -0700 (PDT)
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
Subject: [PATCH v3 0/7] Removal of bcm63xx-wdt
Date:   Wed,  3 Nov 2021 16:13:20 -0700
Message-Id: <20211103231327.385186-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series prepares the bcm7038_wdt driver to support its bcm63xx
counter part, updates the MIPS BCM63xx platform code to provide the
necessary information about the "periph" clock, and finally proceeds
with removing the bcm63xx_wdt altogether.

This was only compiled tested as I did not have a readily available
BCM63xx system to test with.

This should also help with adding support for BCM4908 which Rafal is
working on.

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
 .../bindings/watchdog/brcm,bcm7038-wdt.yaml   |  42 +++
 arch/mips/bcm63xx/dev-wdt.c                   |   8 +
 drivers/watchdog/Kconfig                      |  15 +-
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/bcm63xx_wdt.c                | 315 ------------------
 drivers/watchdog/bcm7038_wdt.c                |  16 +-
 include/linux/platform_data/bcm7038_wdt.h     |   8 +
 8 files changed, 76 insertions(+), 348 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
 delete mode 100644 drivers/watchdog/bcm63xx_wdt.c
 create mode 100644 include/linux/platform_data/bcm7038_wdt.h

-- 
2.25.1

