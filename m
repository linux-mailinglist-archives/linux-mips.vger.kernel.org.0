Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66CE1F5916
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 18:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbgFJQdG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 12:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728730AbgFJQdF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 12:33:05 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34ACEC03E96B;
        Wed, 10 Jun 2020 09:33:05 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id y17so2984022wrn.11;
        Wed, 10 Jun 2020 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rpDBv2piDn9Q2J9N0i4yiYrjSsor/HRxSClbwdprklk=;
        b=A3hfbvJ0Q7Jn4eZle67FwEdc1leGYOb7+BdYCoCHSOl/51k/clt4ipp2BpCuRSaJOY
         IntQmAlLDFuBi7LIqjtK/EZ7lOChoCk9Erp8HeTY+mgeJY/p5FH8whi/Ja+X+h9wSF+2
         l40McgBrBH+dHEAGJHZOcpQwNhSdHelxmC2KTXvX8/Oah4Sm2aXMfBV6e/QTd1OVxhM+
         Z44PTtiDGEWbnB5TLwiM76V2TyUvPNzN2K1qXrJWANbzQuWlF5cIeKTSw3gVG+sLnakS
         nMSZRVnPE42vI2DYHsZsJeat3ylQu/OHrzZ4dvKALwd6czAYv/DHSPaQx0q6MQQOa+LR
         gIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rpDBv2piDn9Q2J9N0i4yiYrjSsor/HRxSClbwdprklk=;
        b=ZfxfHW1/tXqkpMijzX7tCVZ5I66JC3SKYaqARaq12uqFHrylk4PAcKqlQvVHzJXAQG
         l61gqKy2RF/HucSyiBgMoZsnIkPQCFEfeKE6MImHluoUGxP7zfianmYBooY+XTxpgfEh
         dz7SjA7xZazEtT1yU4Lae1LlhlHeZycljnoPkKgMUpNAomVaUurcXO/ZMB781q+D4+gZ
         Anwcpw1+vToXMGrSu8qBc3GC/RIMA78eg0h7wgLmgr/snPzLGquNvyHKi/a3qasARMJ2
         mtiK1hDie7K3qxJqLDOC3tXu2fev6wOoo7JehIWdogmA/SD6vAb4/UCGkP5pipEkTFH2
         ao7Q==
X-Gm-Message-State: AOAM530rEOC7jnA2CvQeFDz5D6YGFdMU4h9QFzM6Wj9a7cTmxfltL1fi
        MmLlpBsjZz0UBbjERnh1mb0=
X-Google-Smtp-Source: ABdhPJw986CQrWCSJAue58mSsilDl/bEgvJUv0KDGG7CDlhYCSLRXNUnEBFvAgfX9ezIlWDuASlMEQ==
X-Received: by 2002:adf:e588:: with SMTP id l8mr4944794wrm.255.1591806783485;
        Wed, 10 Jun 2020 09:33:03 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id t7sm414430wrq.41.2020.06.10.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:33:02 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 0/6] bmips: add BCM63xx power domain controller
Date:   Wed, 10 Jun 2020 18:32:55 +0200
Message-Id: <20200610163301.461160-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609105244.4014823-1-noltari@gmail.com>
References: <20200609105244.4014823-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
to enable/disable certain components in order to save power.

v2: Introduce changes suggested by Florian:
  - Add separate YAML file for dt-bindings.
  - Add bcm63xx folder in drivers/soc/bcm.
  - Update MAINTAINERS.
  - Add dt-bindings header files.
  - Also add BCM63268 support.

Álvaro Fernández Rojas (6):
  dt-bindings: soc: brcm: add BCM63xx power domain binding
  soc: bcm: add BCM63xx power domain driver
  mips: bmips: dts: add BCM6328 power domain support
  mips: bmips: dts: add BCM6362 power domain support
  mips: bmips: dts: add BCM63268 power domain support
  mips: bmips: add BCM6318 power domain definitions

 .../bindings/soc/bcm/brcm,bcm63xx-power.yaml  |  44 +++
 MAINTAINERS                                   |   1 +
 arch/mips/boot/dts/brcm/bcm63268.dtsi         |   6 +
 arch/mips/boot/dts/brcm/bcm6328.dtsi          |   6 +
 arch/mips/boot/dts/brcm/bcm6362.dtsi          |   6 +
 drivers/soc/bcm/Kconfig                       |  10 +
 drivers/soc/bcm/Makefile                      |   1 +
 drivers/soc/bcm/bcm63xx/Kconfig               |  12 +
 drivers/soc/bcm/bcm63xx/Makefile              |   2 +
 drivers/soc/bcm/bcm63xx/bcm63xx-power.c       | 374 ++++++++++++++++++
 include/dt-bindings/soc/bcm6318-pm.h          |  17 +
 include/dt-bindings/soc/bcm63268-pm.h         |  21 +
 include/dt-bindings/soc/bcm6328-pm.h          |  17 +
 include/dt-bindings/soc/bcm6362-pm.h          |  21 +
 14 files changed, 538 insertions(+)
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

