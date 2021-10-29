Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEEF440200
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 20:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhJ2ShH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 14:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbhJ2ShE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 14:37:04 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51A4C061714;
        Fri, 29 Oct 2021 11:34:34 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id q187so10727008pgq.2;
        Fri, 29 Oct 2021 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tJtWsMfTuWNkqI2KGHKeq26M8Pj/p0fEp+4EA8AivqU=;
        b=PmtXvXUrkviPErP11aIP33MQVCpqkhT+eCHReaUp9R0QxL6WNqOIs435gjjQu2JNbb
         AcVgykGbDC1ctyVi86WEbyDrNlSPzhlX5b5Ah7DAEUQOJQyrIhDBKQl4CQdHV52PmLZs
         MsJuPJteWYM9Vkoo+Rt0NzBx1h7Oafavs8WbedW8FulUJ/WDfe8RBq/ZqYU7v37dY7w6
         YOg9kG4lB4WEO3+x4HBf6oRYrmxPsMmecQodhNXdBCJF+NVWuEnDK7bBOwxrXCXq2pAX
         7o9gPYwNZdLGIuozFLohZSIWJCBEloTioJIONJ+hgY4e11RjlbIi5uyOZ4YN3K4Z1MhU
         Dv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tJtWsMfTuWNkqI2KGHKeq26M8Pj/p0fEp+4EA8AivqU=;
        b=6gk/SaWMUla/SpqiL6DWl21S4JKM9xiZsLaRgwEFcD0BJLgdmS2S0gbyc9rSDKdwxk
         V9u1h3aEYMNkOGmJ2XOBQIlAuh/OJ56b/rWXd77PF1nSip3/q74ak85oVzimKU6ey/9m
         SaKb+0sOLcnVvHEE9aY7Ilx19GnB4MMOata00MsPhg73zAK5xAoJa6C8/iIlOjPn80HC
         fnQgsKMff97vZUshMsPNqRzok/zSkra8ycNOA8em8SsOi6o/Wz0+Tv9QB8BzhEdMGhlK
         M0BS8KjYl9syptyjVCV/Qp6v58bneMxRpc23BOYjy5pDNnF0z19rj2hj6g2ubnhAeydj
         7EGQ==
X-Gm-Message-State: AOAM533C9D+W1L6FwSxkxRzKNf7r1j2Fbp9zUFfuC9rHCLZMHwEOUpIT
        25LsRAW6pFaf+A0kugXDczFpIsNeAfU=
X-Google-Smtp-Source: ABdhPJyA63CGQ+6Rq6cYF2fAjjzecxO/kapg7cC6XQXLjssTWVAfisDBgUfC9gbficAi34Z1a7NfhQ==
X-Received: by 2002:a63:2aca:: with SMTP id q193mr9467525pgq.211.1635532473912;
        Fri, 29 Oct 2021 11:34:33 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j15sm7730868pfh.35.2021.10.29.11.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 11:34:33 -0700 (PDT)
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
Subject: [PATCH v2 0/7] Removal of bcm63xx-wdt
Date:   Fri, 29 Oct 2021 11:34:23 -0700
Message-Id: <20211029183430.4086765-1-f.fainelli@gmail.com>
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
 .../bindings/watchdog/brcm,bcm7038-wdt.yaml   |  41 +++
 arch/mips/bcm63xx/dev-wdt.c                   |   8 +
 drivers/watchdog/Kconfig                      |  15 +-
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/bcm63xx_wdt.c                | 315 ------------------
 drivers/watchdog/bcm7038_wdt.c                |  15 +-
 include/linux/platform_data/bcm7038_wdt.h     |   8 +
 8 files changed, 74 insertions(+), 348 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
 delete mode 100644 drivers/watchdog/bcm63xx_wdt.c
 create mode 100644 include/linux/platform_data/bcm7038_wdt.h

-- 
2.25.1

