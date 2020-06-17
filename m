Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6ED1FCB4D
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 12:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgFQKur (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 06:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgFQKuq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 06:50:46 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E27C061573;
        Wed, 17 Jun 2020 03:50:45 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e1so1828684wrt.5;
        Wed, 17 Jun 2020 03:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gVHDBOPRXArHHDkY2uOMur9n6Fvr2bId3wooHg7xFFg=;
        b=j8LC+vJKYkQyMlGKdE8C0hDXNsQX19o7n2SAcSMWkBjEe4GmSL4iQrGBA9zhxlAdy3
         Ouw7G/EC7X+OKhDdj70jCCbQ+I6+NH9US6JiK1/L5TNK3fXyxw0XQmD/hHGr4PIr485i
         st/9gVZc/SOZJ7BqHUlRS2aLVjkkvX954+5fDB2C9OYYh0fOjWOH+FgqB0rqwwJDNFvu
         Aq2tEQUrTQFISMsst7DvqcwX4nc8cbOhi4A3lx6YWLrelE/GcC5LhSe5rvRzifdpap7l
         mGZkTtqD4PvMMcVptUvxVCf2vZWnWaNYIQzBC71yF6L3yyrUVvlw0AgUQYyPkbG8uUq0
         cnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gVHDBOPRXArHHDkY2uOMur9n6Fvr2bId3wooHg7xFFg=;
        b=mqxcYeH3u9D3nf7oydyhrFTjZKg6Li46udS1ddr5oly1mqEkgQgqp8KLNki41Kcrr0
         doDqq69XHtaxCt+K7zaYMwlL5GeGYK7oVzl1cZC9hcNdvlZ0Oof0QZqWwg2sNZ3937ai
         TwrwseFpi4R/l2pFUjHFiRXV/fPzOgD1Knwa9JtrR0sgO0y/2/f7MkWTrnEVCLgE4jkM
         KL95Gsr5KPF1xwIg9aLAVAG8qiP5CtYhXpt8GuKk0y0uFENJmlLYsZy1TLcDuiJ/+OYr
         +HwIXAvGdTAIWGDdXwAny4AwdxmhF4m5yRg1tO5HKzH07E5oD/j5CXNTiH39djPGGrQh
         G6ug==
X-Gm-Message-State: AOAM531DZgXFzJwMhWlIQEnvChH9p8IUJNz4VN2wyKaAiNpaNJWSU1pK
        52siRVy66T00qmHZKv14WtQ=
X-Google-Smtp-Source: ABdhPJzIprqE0+h+Q8QPqdaa6yfC9eShqkNqOXIfMXgG3VfIM567xSARgAQEpBzvkSH8adL3v1V5Yg==
X-Received: by 2002:adf:f00f:: with SMTP id j15mr8636571wro.347.1592391044252;
        Wed, 17 Jun 2020 03:50:44 -0700 (PDT)
Received: from skynet.lan (90.red-88-20-62.staticip.rima-tde.net. [88.20.62.90])
        by smtp.gmail.com with ESMTPSA id u12sm33331927wrq.90.2020.06.17.03.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:50:43 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v7 0/9] bmips: add bcm6345 reset controller support
Date:   Wed, 17 Jun 2020 12:50:32 +0200
Message-Id: <20200617105042.3824116-1-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM63xx SoCs have a reset controller for certain components.

v7: introduce changes suggested by Philipp:
      - sort Kconfig alphabetically.
      - return 0 on bcm6345_reset_update.
      - add second sleep comment.
v6: fix BCM6318_RST_HOSTMIPS value (12 vs 11).
    driver improvements:
      - use devm_platform_ioremap_resource.
      - simplify bcm6345_reset_probe return.
      - introduce and use to_bcm6345_reset function.
v5: fix kbuild robot error (drop __init).
v4: fix device tree bindings documentation.
v3: using reset-simple isn't possible since sleeping after performing the
    reset is also needed.
    Add BCM63268 and BCM6318 support.
v2: add compatibility to reset-simple instead of adding a new driver.

Álvaro Fernández Rojas (9):
  mips: bmips: select ARCH_HAS_RESET_CONTROLLER
  dt-bindings: reset: add BCM6345 reset controller bindings
  reset: add BCM6345 reset controller driver
  mips: bmips: dts: add BCM6328 reset controller support
  mips: bmips: dts: add BCM6358 reset controller support
  mips: bmips: dts: add BCM6362 reset controller support
  mips: bmips: dts: add BCM6368 reset controller support
  mips: bmips: dts: add BCM63268 reset controller support
  mips: bmips: add BCM6318 reset controller definitions

 .../bindings/reset/brcm,bcm6345-reset.yaml    |  37 +++++
 arch/mips/Kconfig                             |   1 +
 arch/mips/boot/dts/brcm/bcm63268.dtsi         |   6 +
 arch/mips/boot/dts/brcm/bcm6328.dtsi          |   6 +
 arch/mips/boot/dts/brcm/bcm6358.dtsi          |   6 +
 arch/mips/boot/dts/brcm/bcm6362.dtsi          |   6 +
 arch/mips/boot/dts/brcm/bcm6368.dtsi          |   6 +
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-bcm6345.c                 | 135 ++++++++++++++++++
 include/dt-bindings/reset/bcm6318-reset.h     |  20 +++
 include/dt-bindings/reset/bcm63268-reset.h    |  26 ++++
 include/dt-bindings/reset/bcm6328-reset.h     |  18 +++
 include/dt-bindings/reset/bcm6358-reset.h     |  15 ++
 include/dt-bindings/reset/bcm6362-reset.h     |  22 +++
 include/dt-bindings/reset/bcm6368-reset.h     |  16 +++
 16 files changed, 328 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/brcm,bcm6345-reset.yaml
 create mode 100644 drivers/reset/reset-bcm6345.c
 create mode 100644 include/dt-bindings/reset/bcm6318-reset.h
 create mode 100644 include/dt-bindings/reset/bcm63268-reset.h
 create mode 100644 include/dt-bindings/reset/bcm6328-reset.h
 create mode 100644 include/dt-bindings/reset/bcm6358-reset.h
 create mode 100644 include/dt-bindings/reset/bcm6362-reset.h
 create mode 100644 include/dt-bindings/reset/bcm6368-reset.h

-- 
2.27.0

