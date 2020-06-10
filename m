Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81DA1F5A7D
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgFJR3D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgFJR3D (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:29:03 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C16C03E96B;
        Wed, 10 Jun 2020 10:29:02 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l26so2579048wme.3;
        Wed, 10 Jun 2020 10:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4fr+UL9O2HF9K/lBv8pVMY6XaRGJvWXm1sUH2VFByQY=;
        b=ICDG62e1fP7sxVuWYjU4w++AldrRE/9kmK61YNF7cdPmqrwYd9/ju2jxHEvWTZdZXx
         DV6oDoTm1MZmmgD/jDCT0mLjdSdmQTVNEC958giX5T51ZUoE6a7xnMg+jAyjlKOyr9Bm
         CF6MuB4fXtlLjUZqrhbM3KzmRvNNZ9kpfxzNRorJ+H6tWfBp4pRP2wiEfsWyXlsSETIL
         jqhM53H0+xW74JdyHhm4mmBwitDr0WuwAzc6csb5M8Fm0V8M/KaWf51UPDfHp2lda8Kp
         5necvjI1Ncuh4b7P/SbP3qyDkCFdzmYJqrfhQphqjejBXcIQ/8mAI7K4h2EmcoEt8VC6
         m9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4fr+UL9O2HF9K/lBv8pVMY6XaRGJvWXm1sUH2VFByQY=;
        b=i6HLattSK17YbWHAKP0eyp6wMXecYLDYTe2o6I9982H1B+KCWLt+nxWU1RPT9wBqZj
         IcscFcfxamidHlVQcAma7N4gO8na85kTwxBsjTzFFO/HRJ4PGo7RuUhl5dGn88OHteli
         IrB326ESmLYVQwFVe29O9eGa8v/ahyjR7ImGkx6vS+8ig0vUgPJ6wFeN5Tz84tlkdTNY
         M25c8/RGPQX095AWbejsJRbU5NiWpBQVXjMg61vPwQrSYkVol3593NltiWwHIEW5IBju
         S4nsyYcqBfsCqcBTCMbC7lFTwNjY2SxiOchHSJGK2quy0JhWV9muW7gP7JUt3yA9zAS7
         3JKg==
X-Gm-Message-State: AOAM532g419S0l+uPbij0fCzRycsnjBcWctgXHVC50wVoffHAL1SNHEd
        RPF2ig/sDs6kQXrcUVsOHQA=
X-Google-Smtp-Source: ABdhPJxJAXhHMNsMi0fgj9mX+Pbnob9fP2EQmYvwQkhuo/R5EWo4rp96a+jkyScYU/aT3XEB2VQ93g==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr4378632wmi.66.1591810141255;
        Wed, 10 Jun 2020 10:29:01 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h188sm568551wmh.2.2020.06.10.10.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:29:00 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 0/9] bmips: add bcm6345 reset controller support
Date:   Wed, 10 Jun 2020 19:28:50 +0200
Message-Id: <20200610172859.466334-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609160244.4139366-1-noltari@gmail.com>
References: <20200609160244.4139366-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM63xx SoCs have a reset controller for certain components.

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
2.26.2

