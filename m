Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9389F1F81F6
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgFMIiR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgFMIiR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:38:17 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3EAC03E96F;
        Sat, 13 Jun 2020 01:38:17 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x6so12121890wrm.13;
        Sat, 13 Jun 2020 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xtX3WPJttrHzLtySOOYSGEdhsmb/EFMomQI97Y+oq1o=;
        b=tLVtudL6IHYrxFGEHA7K68mKObLrnTwh1NK4ZQPtvyWsrR1QTvB7F9UJj55Ca4fRaq
         kKj4Ie22Rr6y50KPHYRovPc08b5pUC9Th8IDJHwALyKzTpc+HTUiqMnnVzIvln20T3yE
         4+KCBNixuwINWSvY0sO0UbO4ODVjYKp4Pj7dKGv6As2rNoWB8vaNPorM0t0EYhWQHlDv
         ruVqshPrpC6GChUXFp5Ffb0JDlMNmDgKCGSvkEYipnkPtFfPLjnc259MHJVWIZ9oMGJX
         LMVBjMmrztHsjU9KekkeWMtleATbKKZQewotcEr9pZ3DEeBHvUzeLbs2x5VyPSC+mn1k
         tUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xtX3WPJttrHzLtySOOYSGEdhsmb/EFMomQI97Y+oq1o=;
        b=Qtps9s3jKs8xj0rXhupKMAQZsQXpZPtJXcSu98areTwfVCsdyNLrWT38K72AQKQmDQ
         Sh64DOA29nFpnEAp9wXiSgIZyBiEDFA7ESyNBQYyfnWiWAm6g696R6FkLzY1KLvgNHnM
         eaHNjsuir/uCrNCp4XitcIYRYA3If7ELZriFhLkiwrhhS7jzGkJFI5iF6hWZJjbD+8r5
         93AYWWONo7uPHQRtxt9DVW6n2JzBmlLflxg2kIggHYalKjMYOVhuE5g7QMK5YbjGclbl
         4wc43rkzGblDcrkvt0etLC12glEfiGCPeHzHZEhLO2QuF7xk7CisEjQHQ84YPYfbjS8s
         6GaQ==
X-Gm-Message-State: AOAM5320qHky3RXjxXtEzROKhPWTZv+STYppwx3pGsBq/5E/byDpReYM
        yz5gR/TNJyq1TpzBB2cg3LrS/vsP+Jg=
X-Google-Smtp-Source: ABdhPJxEnxEsI2wTPvv5T6VYAaZGvg92Xt6d/pt0m1N0vct09DAihiAWPObReioQihMwJE7+EHTYCA==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr20003195wrn.178.1592037495484;
        Sat, 13 Jun 2020 01:38:15 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id l17sm11622704wmi.3.2020.06.13.01.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:38:15 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 0/9] bmips: add bcm6345 reset controller support
Date:   Sat, 13 Jun 2020 10:38:04 +0200
Message-Id: <20200613083813.2027186-1-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200610172859.466334-1-noltari@gmail.com>
References: <20200610172859.466334-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM63xx SoCs have a reset controller for certain components.

v4: Fix device tree bindings documentation.
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

