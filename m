Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFDB31F59F8
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729546AbgFJRQg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbgFJRQf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:16:35 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBF6C03E96B;
        Wed, 10 Jun 2020 10:16:34 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id g10so2538271wmh.4;
        Wed, 10 Jun 2020 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iL6JkaFSUDsP2cIBAqcTq5ZWB5YvEmykfE8Vq8awAQw=;
        b=bcaxtTLa6yaXrQr2WGhIcl4gQ4/S25pS4Pf3MrwSx1+HgqR+dZygxVMix77dSFWnty
         w0mkbgZtq8IggE5+g4Ub3WuVA5nffbm/f2X24HModSll9RDFYB9IJmpGrtGYRKzQTZ0s
         bo0wy+4IhxSu3mj7zOQgaF3sygoe7cOJs3wfAlQRDHpal2FGEg7vpWhIfvQmw7J2XCnL
         qnEbjEGeafrxz+O++Q48VDZeTXz22dfHPeRYUq1p+kvLy4Koo2Cal247UJA23SsC+Di4
         q21HXcJv8lQqDEUFEJ2RdpmTXxFqkt5cYXNfd3uqnWF52kNTONWbQTHucMPDFa3qyBv6
         KVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iL6JkaFSUDsP2cIBAqcTq5ZWB5YvEmykfE8Vq8awAQw=;
        b=slLMt1CR1WR0BkMZC6PbacUuVGxXrtse+pPF+cB9zjqIhlnMsg4JNp+P9Z4BX3mqxa
         PqMCByS24jokJiBNHYqmEgp8PBt5dSJ+zCtAxs6uadAzt7shmtXRFZuYuAyQFkQv//TR
         irAon1Arng4BKeNHMO8U8ULF/Ezz7QDGsPFMlptR8+9EoKR5q8HR0D4dp3uzX16QNkS9
         X7maB1BxziiaH94kTTKe/QMpy+LCPAlydRDWQ834VdRmGFfyEWQtmqLHStTNdyBKyiBq
         ou5H/yC+5Ws60QvcE+Cw7QeEeQH7YyDMaql7NqE4V2VsF0pmf/ettGCVjpjrAMzpOpXj
         UBQA==
X-Gm-Message-State: AOAM531vpiEGzb2w6wEXg1zWQNPyEBQHnlzcj5L+EJp0HmKDH+enbR3X
        h9/enTHlC2vtMHr4RaYMjZ4oHAjU0K8=
X-Google-Smtp-Source: ABdhPJwxgdE+sQMmQXCuZ/GRpKGHoC8dqENeYrpej3wStTwKD+EQDcCzPpXybdP9IDNRejW39sOmMA==
X-Received: by 2002:a1c:6606:: with SMTP id a6mr3979323wmc.37.1591809392680;
        Wed, 10 Jun 2020 10:16:32 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id f11sm589048wrm.13.2020.06.10.10.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:16:31 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 0/9] bmips: add BCM63xx power domain controller
Date:   Wed, 10 Jun 2020 19:16:21 +0200
Message-Id: <20200610171630.465579-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610163301.461160-1-noltari@gmail.com>
References: <20200610163301.461160-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
to enable/disable certain components in order to save power.

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
  mips: bmips: dts: add BCM6328 power domain definitions
  mips: bmips: dts: add BCM6362 power domain definitions
  mips: bmips: dts: add BCM63268 power domain definitions
  mips: bmips: add BCM6318 power domain definitions
  soc: bcm: add BCM63xx power domain driver
  mips: bmips: dts: add BCM6328 power domain support
  mips: bmips: dts: add BCM6362 power domain support
  mips: bmips: dts: add BCM63268 power domain support

 .../bindings/soc/bcm/brcm,bcm63xx-power.yaml  |  44 ++
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
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml
 create mode 100644 drivers/soc/bcm/bcm63xx/Kconfig
 create mode 100644 drivers/soc/bcm/bcm63xx/Makefile
 create mode 100644 drivers/soc/bcm/bcm63xx/bcm63xx-power.c
 create mode 100644 include/dt-bindings/soc/bcm6318-pm.h
 create mode 100644 include/dt-bindings/soc/bcm63268-pm.h
 create mode 100644 include/dt-bindings/soc/bcm6328-pm.h
 create mode 100644 include/dt-bindings/soc/bcm6362-pm.h

-- 
2.26.2

