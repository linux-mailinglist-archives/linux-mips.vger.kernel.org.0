Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4E64465EF
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhKEPox (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbhKEPox (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:44:53 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF08CC061714;
        Fri,  5 Nov 2021 08:42:13 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id g184so8698015pgc.6;
        Fri, 05 Nov 2021 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lXIaObu/Py4YZyLKzOZro9KF/nVIU+g+Q8GM5ida1Og=;
        b=XNVoRkmMDXWP2ANhka/BFf4FjRXl1SRhdPt1FFrrPKTpXiaCQ1wdOf2LQSf8OQMeSk
         90DTYRAfXMYcIJ+RVyFpNoY6IPfN55z9JnXRFU2v/FoOx8SvIH/5EcgzTWnWgDdsaJaG
         +5XBkdlA1z9EWDR6iJBQfd3i24hGRhxWk2R3kG3VkuSAlH4zWIaEhaE2LL+xvL1VvxA+
         lElWvnJpDmw73fGVhwMKeX3TEtSl68zbnM7FKDeGP4TivBDwS5i0+fOmjAW2jimoU0lZ
         vwSNcnwot6I3N5uiWTtBX4BOqoPpAp8NO0y099/LKcXWwbi6LdOzEVBkMmrUya/0eqLq
         /7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lXIaObu/Py4YZyLKzOZro9KF/nVIU+g+Q8GM5ida1Og=;
        b=QywbjkD8RVo7IlTx+/j1oCUzhI4eNNjz4HZKHj/JGgVgxT9JXqPawiqtV5PyxUi7K/
         LzJ7dkktSOX8dmO0OPPvtMG31yWKMUc555joprWNoZk/mLF8fbdFBuEdEBFpmouisIl3
         sRhK6+lcswOlMOy0SMioRGaOFRGlET/7UFB7uRzdLyz5oA4OrAqv+ClxCU1iNCnYXNZM
         RXJK1aNiV+2BSvlr35V95NZFsAl5WgD0i8qFprXny47JMnCV65gTO2KVzpX1mX8mm2Pf
         W2Xh3URXa/GUNxlp3+e99Q1WPsl1C9rls5nq3kFWallokEOB2yobCI2aJsOJw4/bWJAC
         QVsw==
X-Gm-Message-State: AOAM531gDAeY07PYFQk12ECWuE0rP7GsDXJhEr8ruPrUiV9oalUpVPdM
        ja6w+G474khB5VDk8GvgnK0rMAoAW9w=
X-Google-Smtp-Source: ABdhPJykX0UAphaHVjTEhNy4GJmQz5vOgJ6x+INBsZhC+3Q1qOF4lXnHzRifX5Xli1w3v4tUbt6ZGQ==
X-Received: by 2002:a05:6a00:150d:b0:47c:1d28:4ef5 with SMTP id q13-20020a056a00150d00b0047c1d284ef5mr59893304pfu.6.1636126932868;
        Fri, 05 Nov 2021 08:42:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id b8sm7547097pfi.103.2021.11.05.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:42:12 -0700 (PDT)
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
Subject: [PATCH v4 0/7] Removal of bcm63xx-wdt
Date:   Fri,  5 Nov 2021 08:42:01 -0700
Message-Id: <20211105154208.614260-1-f.fainelli@gmail.com>
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
 .../bindings/watchdog/brcm,bcm7038-wdt.yaml   |  42 +++
 arch/mips/bcm63xx/dev-wdt.c                   |   8 +
 drivers/watchdog/Kconfig                      |  17 +-
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/bcm63xx_wdt.c                | 315 ------------------
 drivers/watchdog/bcm7038_wdt.c                |  16 +-
 include/linux/platform_data/bcm7038_wdt.h     |   8 +
 8 files changed, 77 insertions(+), 349 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
 delete mode 100644 drivers/watchdog/bcm63xx_wdt.c
 create mode 100644 include/linux/platform_data/bcm7038_wdt.h

-- 
2.25.1

