Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D891F81C5
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgFMIVr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgFMIVp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:21:45 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17370C03E96F;
        Sat, 13 Jun 2020 01:21:45 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id t18so12148813wru.6;
        Sat, 13 Jun 2020 01:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u96+rSBzcvuJKQmsLPT95WNJaRtQiHeNyjReZCDFzSY=;
        b=pnPQEFr4liss5K5xbfzMn1tzmUyypjIhnw3RSaB5blOyygSUBKCgBIpfvOy1MdJ3oW
         1adpoRXb4dccRnASiMIXjPuCtF1JEz571GMH2QWkRNAwlDAhjW42nKXqtVSeJAscvcNX
         2l+01+9YIWsNJzRA4EAbWSiDxq72uT4skM8n6R3WrpjCrrSi+b6xeYA0CcXf5TiDgBAV
         KF3hmVE4XF39GeRC7ofXwSNc3QFNpr/Cco+1cXJnS31TtNY1Z36yKe1Aa8KY8djx33y6
         dDnxjjtmjTje0wyKORz3XYA6NNaeaPOurlZLpP6MDwK6d01CPpPM8CFfyySZT1DOhAYt
         DTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u96+rSBzcvuJKQmsLPT95WNJaRtQiHeNyjReZCDFzSY=;
        b=hBGL/ta6od8C8NLrV42xuUXpri9dotzingucOq1cQY8QbpSWA5gnlax42pawSbyMS/
         3Ab40LMrwqJRfhfrPjHL2hnX9n7cLXnt8F3+ururNI2V5l8ShHGETxjnpZ6xvOqL5Ksx
         xxUhPOB/w5ODRx9gR+DWc5FhFTHjpL3lR0TC0yuEsu7YVl1hT5FhnsMqMWY5n7ZuoLhI
         jPaNKxgJyba+Sxpw/V7mdK+17TGHBZ9hdpedn8D1WvmEG/8pdxx1UKvcoluzyE6Gdz8D
         g6dfNE5Mwb3Mqoo3vL873C7BsJbMMsKC6tY0Q9ANFBajESSYVrDyGLE+Mnr4EqmGMBk7
         vJuQ==
X-Gm-Message-State: AOAM530t64dw6/soQBrMO/Uweh32ZUOw6MyQBY3Bn1qol8a+njrDvife
        cLeVL9KEGfobBrdsFrrSsmQ=
X-Google-Smtp-Source: ABdhPJw5CQuHg+8ucc6NHRSc0Qqxol1zn/CzcAseQTV40KLUTSXTJCWbJem1vvXYdaCLRmT8uSKI5w==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr19349679wrh.308.1592036503434;
        Sat, 13 Jun 2020 01:21:43 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id n189sm12243603wmb.43.2020.06.13.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:21:42 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 0/9] bmips: add BCM63xx power domain controller
Date:   Sat, 13 Jun 2020 10:21:31 +0200
Message-Id: <20200613082140.2009461-1-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200610171630.465579-1-noltari@gmail.com>
References: <20200610171630.465579-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
to enable/disable certain components in order to save power.

v4: Fix device tree bindings documentation.
v3: Introduce changes suggested by Florian:
  - Use dt-bindings definitions in power domain driver.
  - Separate dt-bindings definitions from power domain .dtsi support.
v2: Introduce changes suggested by Florian:
  - Add separate YAML file for dt-bindings.
  - Add bcm63xx folder in drivers/soc/bcm.
  - Update MAINTAINERS.
  - Add dt-bindings header files.
  - Also add BCM63268 support.

Álvaro Fernández Rojas (9):
  dt-bindings: soc: brcm: add BCM63xx power domain binding
  mips: bmips: add BCM6328 power domain definitions
  mips: bmips: add BCM6362 power domain definitions
  mips: bmips: add BCM63268 power domain definitions
  mips: bmips: add BCM6318 power domain definitions
  soc: bcm: add BCM63xx power domain driver
  mips: bmips: dts: add BCM6328 power domain support
  mips: bmips: dts: add BCM6362 power domain support
  mips: bmips: dts: add BCM63268 power domain support

 .../bindings/power/brcm,bcm63xx-power.yaml    |  44 ++
 MAINTAINERS                                   |   1 +
 arch/mips/boot/dts/brcm/bcm63268.dtsi         |   6 +
 arch/mips/boot/dts/brcm/bcm6328.dtsi          |   6 +
 arch/mips/boot/dts/brcm/bcm6362.dtsi          |   6 +
 drivers/soc/bcm/Kconfig                       |  10 +
 drivers/soc/bcm/Makefile                      |   1 +
 drivers/soc/bcm/bcm63xx/Kconfig               |  12 +
 drivers/soc/bcm/bcm63xx/Makefile              |   2 +
 drivers/soc/bcm/bcm63xx/bcm63xx-power.c       | 378 ++++++++++++++++++
 include/dt-bindings/soc/bcm6318-pm.h          |  17 +
 include/dt-bindings/soc/bcm63268-pm.h         |  21 +
 include/dt-bindings/soc/bcm6328-pm.h          |  17 +
 include/dt-bindings/soc/bcm6362-pm.h          |  21 +
 14 files changed, 542 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/brcm,bcm63xx-power.yaml
 create mode 100644 drivers/soc/bcm/bcm63xx/Kconfig
 create mode 100644 drivers/soc/bcm/bcm63xx/Makefile
 create mode 100644 drivers/soc/bcm/bcm63xx/bcm63xx-power.c
 create mode 100644 include/dt-bindings/soc/bcm6318-pm.h
 create mode 100644 include/dt-bindings/soc/bcm63268-pm.h
 create mode 100644 include/dt-bindings/soc/bcm6328-pm.h
 create mode 100644 include/dt-bindings/soc/bcm6362-pm.h

-- 
2.27.0

