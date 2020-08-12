Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F5D24257B
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgHLGbf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgHLGbf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:35 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2556BC06174A;
        Tue, 11 Aug 2020 23:31:35 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id y3so938329wrl.4;
        Tue, 11 Aug 2020 23:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s+W2KNSfxt+TusGOoBlggzdrLIrra6LZ2EEZWr0qxxg=;
        b=h8Ljwbab37d7TOBhq1tXfSegVssJHdWNOoI+wFqC4x5QurtELxYWxhPF2zqNq1mXVU
         fJ9zbcTXGRB6SRZIpPWpNuwCE0wKl23/9JZh1JjVi//JHvUbCylMgww7xotqLJvf4+oC
         bmK7ZXkxyVvhNg9PC4XPs+u1aVnGMQE1RHEUe/Go6yppEH393EbF9SZuXVps5n051g3i
         j4jTBA5u89+fdow2n0Qlfv9L1dWFWgbXADLatGvDg0pxm80+ziooBJveZChdQSRXfn/T
         vBNCyV5Dbiw77RB8wQ5tSq0SvxxTcoIaBw49XCheCok9S2T8LlZnd04pOIRWfyMOU2Ni
         0HtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s+W2KNSfxt+TusGOoBlggzdrLIrra6LZ2EEZWr0qxxg=;
        b=hNgNSPgavnw+WYkfnwJxoJ/i368ZdcdNatIPw0FChl58N0WjymYXrjyiA3LYpGbZFH
         PvQPkFKdzV1xvFEfe4xO7kJoGZ7x44GGC2Q92hy9cVobtoXWYf2fwf6K8evFsWKngadS
         O0Jf276esV31hzQEiQRuC710Z05MXD+RO1PN2Nc98zHYrkwbrQ3vzkQI2PyFIozwZb09
         z1fqkylM2p7nECuMrgCt3y38cpNqSeZ2UW5z87V4oyVk8F3v4G6xSwSJvSv+QS/JKEIq
         WBDON3ovDjQ5QWprVolZDtgC/0NPGpe+G6PYuHPW7PCQG0l+d6irdwOKzW7R3kR5hfFj
         SMMA==
X-Gm-Message-State: AOAM533aJ9L2fNcXQb45owCRjOfDMydlhZ9ASG3E+A68JLhpERkOKETB
        7ysuTMfEmY6DuxWvNL52YhKSMbB+
X-Google-Smtp-Source: ABdhPJzNHsi5MhhPLOLNTQvdztPaMWIkUFu8BCtXisQJFx8zkIGGBTVR5eZ5XcuYRe+eHs7QdYyhmQ==
X-Received: by 2002:adf:ba52:: with SMTP id t18mr31838238wrg.26.1597213892758;
        Tue, 11 Aug 2020 23:31:32 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:31 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 00/14] mips: bmips: include dt-bindings headers
Date:   Wed, 12 Aug 2020 08:31:15 +0200
Message-Id: <20200812063129.361862-1-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Allow including dt-bindings header files and use them for bcm63xx.

Álvaro Fernández Rojas (14):
  mips: dts: brcm: allow including header files
  mips: bmips: add BCM3368 irq definitions
  mips: bmips: add BCM6318 irq definitions
  mips: bmips: add BCM6328 irq definitions
  mips: bmips: add BCM6358 irq definitions
  mips: bmips: add BCM6362 irq definitions
  mips: bmips: add BCM6368 irq definitions
  mips: bmips: add BCM63268 irq definitions
  mips: bmips: bcm3368: include and use dt-bindings
  mips: bmips: bcm6328: include and use dt-bindings
  mips: bmips: bcm6358: include and use dt-bindings
  mips: bmips: bcm6362: include and use dt-bindings
  mips: bmips: bcm6368: include and use dt-bindings
  mips: bmips: bcm63268: include and use dt-bindings

 .../boot/dts/brcm/bcm3368-netgear-cvg834g.dts |  2 +-
 arch/mips/boot/dts/brcm/bcm3368.dtsi          |  8 +-
 .../dts/brcm/bcm63268-comtrend-vr-3032u.dts   |  2 +-
 arch/mips/boot/dts/brcm/bcm63268.dtsi         | 12 ++-
 arch/mips/boot/dts/brcm/bcm6328.dtsi          | 12 ++-
 .../dts/brcm/bcm6358-neufbox4-sercomm.dts     |  2 +-
 arch/mips/boot/dts/brcm/bcm6358.dtsi          | 12 ++-
 .../dts/brcm/bcm6362-neufbox6-sercomm.dts     |  2 +-
 arch/mips/boot/dts/brcm/bcm6362.dtsi          | 12 ++-
 arch/mips/boot/dts/brcm/bcm6368.dtsi          | 12 ++-
 arch/mips/boot/dts/brcm/bcm93384wvg.dts       |  2 +-
 arch/mips/boot/dts/brcm/bcm93384wvg_viper.dts |  2 +-
 arch/mips/boot/dts/brcm/bcm96368mvwg.dts      |  2 +-
 arch/mips/boot/dts/brcm/bcm97125cbmb.dts      |  2 +-
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts     |  4 +-
 arch/mips/boot/dts/brcm/bcm97358svmb.dts      |  4 +-
 arch/mips/boot/dts/brcm/bcm97360svmb.dts      |  2 +-
 arch/mips/boot/dts/brcm/bcm97362svmb.dts      |  4 +-
 arch/mips/boot/dts/brcm/bcm97420c.dts         |  2 +-
 arch/mips/boot/dts/brcm/bcm97425svmb.dts      |  4 +-
 arch/mips/boot/dts/brcm/bcm97435svmb.dts      |  4 +-
 arch/mips/boot/dts/brcm/bcm9ejtagprb.dts      |  2 +-
 .../bcm3368-interrupt-controller.h            | 19 ++++
 .../bcm6318-interrupt-controller.h            | 84 ++++++++++++++++++
 .../bcm63268-interrupt-controller.h           | 86 +++++++++++++++++++
 .../bcm6328-interrupt-controller.h            | 68 +++++++++++++++
 .../bcm6358-interrupt-controller.h            | 38 ++++++++
 .../bcm6362-interrupt-controller.h            | 71 +++++++++++++++
 .../bcm6368-interrupt-controller.h            | 71 +++++++++++++++
 29 files changed, 504 insertions(+), 43 deletions(-)
 create mode 100644 include/dt-bindings/interrupt-controller/bcm3368-interrupt-controller.h
 create mode 100644 include/dt-bindings/interrupt-controller/bcm6318-interrupt-controller.h
 create mode 100644 include/dt-bindings/interrupt-controller/bcm63268-interrupt-controller.h
 create mode 100644 include/dt-bindings/interrupt-controller/bcm6328-interrupt-controller.h
 create mode 100644 include/dt-bindings/interrupt-controller/bcm6358-interrupt-controller.h
 create mode 100644 include/dt-bindings/interrupt-controller/bcm6362-interrupt-controller.h
 create mode 100644 include/dt-bindings/interrupt-controller/bcm6368-interrupt-controller.h

-- 
2.28.0

