Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD9243E71D
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 19:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhJ1RZx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 13:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhJ1RZx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 13:25:53 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17132C061570;
        Thu, 28 Oct 2021 10:23:26 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id e65so7064538pgc.5;
        Thu, 28 Oct 2021 10:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9e1Xo7aw+M7k34WE27Yf8eDHXFg2naV2DoHTGHxoMYY=;
        b=LhWVSOB+0vWAj7uobQR5mF6TlnjP8kV3Kkv8Oo4cdHxvXdknr8iPLJ0N5JchZ+nGXd
         Race4CilUmpnrhDXOcCpLuiraFIGczGXyQ3B65NCXNj01QiX2BieDXibQ9wyQNX+IGCp
         vOS5r9KxeZsgN5fDmBICsChX3Afj40C48NQ8SViqJKcGXvj4n3rxG2I632Zq1aujwiEv
         yGJtzbDh4PLAsTVb/BAPdMyYdzKA1JanWM8aRXkr2XXGqzd6hF+q34MPux9iAiqZ99ez
         AidFeknBaY+IFXKBcPaZvodMdybNvLsJ99RQ5uDQBAizQZ18sQ1k1eVfgl7tPo+gK/Oo
         GG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9e1Xo7aw+M7k34WE27Yf8eDHXFg2naV2DoHTGHxoMYY=;
        b=yBK03xKWwlDp3HbEOQNabwpJNQU0IhyN8+0cyaQtjdPPQ98a0KpvB9nN2mmNwFD3bJ
         A02nmMlxfTxvZY+ZNg4ugeiNojRuZS8MnzCbbAmgzUfX4VzqVdw2SU9eQYMAVl6v1A7u
         fqTktGBN3mfIzmGvjcH3nkczNi+2VGP80DtmBU1+u2bhAnPjPhj7gaurMn5uHCOKVN+S
         vqCRDpmzmnJ/gQ0RuuLKDb7SYNw9wYFhsLbgbGpETiFHNAVKbxbar09KzW+bwx7wDXcw
         mIyAHhs5mhUlwg6tTkaurdY6ipzPtJOlUTcldOKUbGNaRb/N1bHQzMbhGnirAVfG3qz0
         r57Q==
X-Gm-Message-State: AOAM530rxPDJ6hxVbMdzrmzWsOOtKlyc/xbpfm5zA0xEg5Pqs721rlMm
        z/Srltip0gD3Vd8n2E2W1c7oGzOAadE=
X-Google-Smtp-Source: ABdhPJxEg9u2nOUqi4OQ2NOzZkBvB//2rB+wFl9vcLgMHNf5ufODpkJl47L6ZBhN8oDkY4USMIP//w==
X-Received: by 2002:a63:8541:: with SMTP id u62mr1670158pgd.279.1635441805160;
        Thu, 28 Oct 2021 10:23:25 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id l20sm3222499pgo.67.2021.10.28.10.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 10:23:24 -0700 (PDT)
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
Subject: [PATCH 0/7] Removal of bcm63xx-wdt
Date:   Thu, 28 Oct 2021 10:23:15 -0700
Message-Id: <20211028172322.4021440-1-f.fainelli@gmail.com>
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
 .../bindings/watchdog/brcm,bcm7038-wdt.yaml   |  40 +++
 arch/mips/bcm63xx/dev-wdt.c                   |   8 +
 drivers/watchdog/Kconfig                      |  15 +-
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/bcm63xx_wdt.c                | 315 ------------------
 drivers/watchdog/bcm7038_wdt.c                |  15 +-
 include/linux/platform_data/bcm7038_wdt.h     |   8 +
 8 files changed, 73 insertions(+), 348 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
 delete mode 100644 drivers/watchdog/bcm63xx_wdt.c
 create mode 100644 include/linux/platform_data/bcm7038_wdt.h

-- 
2.25.1

