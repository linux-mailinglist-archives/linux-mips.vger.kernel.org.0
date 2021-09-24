Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8086941793C
	for <lists+linux-mips@lfdr.de>; Fri, 24 Sep 2021 19:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343637AbhIXRI0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Sep 2021 13:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343589AbhIXRIZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Sep 2021 13:08:25 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D98C061571;
        Fri, 24 Sep 2021 10:06:51 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id r7so6846656pjo.3;
        Fri, 24 Sep 2021 10:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YjwIWJI4WiAn9JNxOIpnfCCCasVO98funIc1i+sVZU=;
        b=VnMUs10Z64fc5MnVVxLinqRw/2GxbPDll7a5uePijYe/MslkvCiW1ndNQj0FitH6lI
         L4BBNv+3dOWei2NvatRDoERayU5wubGsmkCZeTa8k+lEl4Eri2rO1vA28nTfrGxqFZWQ
         wJNltvIFRdXnF6ugGRn92SQujfIpiyym1qbFcSHH6hZnjZeVhsgjrKsLJlbLriarAEfr
         7iZNHrh9/D2z+rUAwLojzjo2Ls+xk4brbjGBNjNyNLWIAaFbwhuRR0wzlpllm3YcMF0v
         vyMyiq71nebQB3gE/F5+OYD4NN8ubVzAKu10oGqBK7T4Jxe+e42LpXvkSnSa/aDIZ3h0
         W6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+YjwIWJI4WiAn9JNxOIpnfCCCasVO98funIc1i+sVZU=;
        b=fn9DWMy8k1pxcMY7GnWzoC1YMXzoXbcN8MOsX9vZ3dpiIPYr726P7VhxIRkScfQQox
         SoHNk17bTapnFEdfpW3OJ7Khpygc9NUrpIeOBMZkHI0dlsUVsxr5PdgBGMvthD39h4/W
         uE5nUcYuuudyCu/K40pq41Fdj5GyKOGYxXIfwx0kN6jwtvvcF1CXEAyBjryg8lTdx1fc
         BFqVLW6/Zj8J5Xod8AWxO3DF/OWLvI84jfzt6HHV18Iiq+DxnP9K5YJ751j3s/wVW4Cb
         +1Wzq/+Fpjz5sJkzBG/Yz0SrXPiGyiCob2Kus51BGl34Vf6GeAvlQCDQ64QlHvmGxVx0
         xwEg==
X-Gm-Message-State: AOAM533a4eb4VWWcrh4+SEw0FGCUUZdXIv5XLFxtHjFkgKA+W9i41xaa
        TcTvx5R9BM+G7YBzYkKV0STD8o29dv8=
X-Google-Smtp-Source: ABdhPJwf14SoPtN5f+4wd2sMqO/DEVoPO9wlvGAdbWPcx5dSdBoP8h9nyv5Dpp4gy1POcQWhFpxlBw==
X-Received: by 2002:a17:902:ba8d:b0:13d:cb44:369c with SMTP id k13-20020a170902ba8d00b0013dcb44369cmr9981136pls.40.1632503211086;
        Fri, 24 Sep 2021 10:06:51 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k22sm9659312pfi.149.2021.09.24.10.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 10:06:50 -0700 (PDT)
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
Subject: [PATCH 00/11] Modular Broadcom irqchip drivers
Date:   Fri, 24 Sep 2021 10:05:35 -0700
Message-Id: <20210924170546.805663-1-f.fainelli@gmail.com>
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

Florian Fainelli (11):
  arch: Export cpu_logical_map to modules
  genirq: Export irq_to_desc() again to modules
  genirq: Export irq_set_affinity_locked()
  irqchip/irq-bcm7038-l1: Switch to IRQCHIP_PLATFORM_DRIVER
  irqchip/irq-brcmstb-l2: Switch to IRQCHIP_PLATFORM_DRIVER
  genirq: Export irq_gc_{unmask_enable,mask_disable}_reg
  of/irq: Export of_irq_count to drivers
  genirq: Export irq_gc_noop()
  irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER
  arm64: broadcom: Removed forced select of interrupt controllers
  ARM: bcm: Removed forced select of interrupt controllers

 arch/arm/kernel/setup.c          |  1 +
 arch/arm/mach-bcm/Kconfig        |  4 ----
 arch/arm64/Kconfig.platforms     |  3 ---
 arch/arm64/kernel/setup.c        |  1 +
 arch/sh/kernel/smp.c             |  1 +
 drivers/irqchip/Kconfig          | 12 +++++++++---
 drivers/irqchip/irq-bcm7038-l1.c |  6 +++++-
 drivers/irqchip/irq-bcm7120-l2.c | 11 ++++++-----
 drivers/irqchip/irq-brcmstb-l2.c | 16 +++++++++-------
 drivers/of/irq.c                 |  1 +
 kernel/irq/generic-chip.c        |  3 +++
 kernel/irq/irqdesc.c             |  2 --
 kernel/irq/manage.c              |  1 +
 13 files changed, 37 insertions(+), 25 deletions(-)

-- 
2.25.1

