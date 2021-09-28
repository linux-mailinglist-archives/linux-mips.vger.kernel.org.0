Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB99D41A553
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 04:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238592AbhI1C3U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Sep 2021 22:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238545AbhI1C3T (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Sep 2021 22:29:19 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F837C061575;
        Mon, 27 Sep 2021 19:27:41 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id k17so17625443pff.8;
        Mon, 27 Sep 2021 19:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sdoc9RGE6gS4jaJ958J2ofqibe80c4VFSM+XdfrkDLA=;
        b=mtX21lszSTfglc2i3EQDgr62JNajWdAY+JjGhXstTLqdg6lDiHN9h/TRcPu/dhq2oh
         Psj9h/SiYSS/PlFx2pjhludMpLWHw8OeRvHBrmDR7+6/E0qRZM8KD+HZlWD2C9K7CQvD
         jGjL4o7rHwJY46jyecF3GatRFaX0YOHs12+RxX+ODXBvLv/8h0SEXHOwiJ9wHUd+uVq5
         LxW9Stdt58ETnay+iafY+Yj4iI7NNJGjf+YZIeznWpljqUHRDi+sMo5zbsqs8y47Bic2
         Pu0fR4wbAbBJ3i+0S0KV0Sf6BLN0dPzAo7H7H+59+A7tZ0XU2SKY0wDNkIIOGDpU5cln
         ZeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sdoc9RGE6gS4jaJ958J2ofqibe80c4VFSM+XdfrkDLA=;
        b=xGRyhcEnNBiWAlmUq2ryDdH/4tGb/SWdklvoCbZb+39FosMtR/TZV+ZQKZ1t2cFHMV
         91nqZZMEFDx8Rdit0YEZNQyuNgciONAW8MEa83/AXZEYTjoOc9i6z1rtuC4nbEDKajBF
         rs4Lu/qoZu3i0eBlIy0gvPxUBbNd541kuIHrjKiclME0ObowKoHp6bzwZDbY4JnFwtkf
         z92Wv3uWTmPKc/bt6sOlQHyLXC1tT5M84evdnn3M/z3yRlYrjRE5tpWV5OWUVE1XOcx7
         oeyNByECiKiX85gaM1G8AapoTh7BsQ2+GVrRrnx55vdXGfWI5eO2WpVLkRu1jIMgjkLT
         TsjA==
X-Gm-Message-State: AOAM533yteBQiHLFYxJkAyjFC3S1B6UrsH1/oGCyiWVdzoShTx5Y/rOm
        VCVn2/G/XpCPFVOPcAFd8k03cDXBg0g=
X-Google-Smtp-Source: ABdhPJwLwl8KZAeBw6t/iXisbwEJ73khi+8+AhiS7gDicWv/Y/8Gt+bOyV8q5MpFH7fpuSBWUqh7fg==
X-Received: by 2002:a65:6a15:: with SMTP id m21mr1603064pgu.415.1632796060297;
        Mon, 27 Sep 2021 19:27:40 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm633261pji.45.2021.09.27.19.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:27:39 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
        linux-sh@vger.kernel.org (open list:SUPERH),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE)
Subject: [PATCH v2 00/12] Modular Broadcom irqchip drivers
Date:   Mon, 27 Sep 2021 19:27:03 -0700
Message-Id: <20210928022715.369160-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas, Marc,

This patch series aims at allowing the 3 interrupt controller drivers
used on Broadcom STB platforms to be built as modules in order for those
to be shipped in a GKI enabled system (Android).

The irq-bcm7038-l1 requires us to export a number of symbols, which is
not great, but there are not obvious solutions other than adding
accessor functions to get the same information.

Assuming you are happy with the changes though, please do take the last
two changes as well through your tree.

Thanks!

Changes in v2:

- avoid using irq_to_desc() and use irq_get_irq_data() instead
- re-order patches to avoid linking failure for irq-brcmstb-l2
- removed the use of .irq_cpu_offline() and converted BMIPS to use
  irq_migrate_all_off_this_cpu()
- avoid exporting of_irq_count() and use a platform device passed
  down from the irqchip platform driver registration code instead
- added kernel-doc fix

Florian Fainelli (12):
  arch: Export cpu_logical_map to modules
  MIPS: BMIPS: Remove use of irq_cpu_offline
  irqchip/irq-bcm7038-l1: Remove .irq_cpu_offline()
  irqchip/irq-bcm7038-l1: Use irq_get_irq_data()
  irqchip/irq-bcm7038-l1: Switch to IRQCHIP_PLATFORM_DRIVER
  genirq: Export irq_gc_{unmask_enable,mask_disable}_reg
  irqchip/irq-brcmstb-l2: Switch to IRQCHIP_PLATFORM_DRIVER
  irqchip: Provide platform_device to of_irq_init_cb_t
  irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER
  arm64: broadcom: Removed forced select of interrupt controllers
  ARM: bcm: Removed forced select of interrupt controllers
  irqchip: Fix kernel-doc parameter typo for IRQCHIP_DECLARE

 arch/arm/kernel/setup.c          |  1 +
 arch/arm/mach-bcm/Kconfig        |  4 ----
 arch/arm64/Kconfig.platforms     |  3 ---
 arch/arm64/kernel/setup.c        |  1 +
 arch/mips/Kconfig                |  1 +
 arch/mips/kernel/smp-bmips.c     |  3 ++-
 arch/sh/kernel/smp.c             |  1 +
 drivers/irqchip/Kconfig          | 12 +++++++---
 drivers/irqchip/irq-bcm7038-l1.c | 38 +++++---------------------------
 drivers/irqchip/irq-bcm7120-l2.c | 28 +++++++++++++----------
 drivers/irqchip/irq-brcmstb-l2.c | 16 ++++++++------
 drivers/irqchip/irqchip.c        |  2 +-
 drivers/of/irq.c                 |  2 +-
 include/linux/irqchip.h          |  2 +-
 include/linux/of_irq.h           |  5 ++++-
 kernel/irq/generic-chip.c        |  2 ++
 16 files changed, 55 insertions(+), 66 deletions(-)

-- 
2.25.1

