Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE291F38BB
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 12:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbgFIKwx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 06:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgFIKws (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 06:52:48 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6E6C05BD1E;
        Tue,  9 Jun 2020 03:52:48 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id q11so20790361wrp.3;
        Tue, 09 Jun 2020 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aWQLYPhqDKfx5oH7hlkSk8K6QKJGKV4Umxbuf8XuqKE=;
        b=ETaulQJlvjWg8li+bf8I4pofjSMqWGlkLMgkMX5FNju/527xa21LUwKQu8Llko4xu8
         1POYDiY/fXGnQ6ArUbsP5OU9bFODfEW9vFnIymXfEOSlU39mbbW4G0d4d2JaBquvoeOA
         NMSCtsZGtaSELMlzpvnxMXTAv1wKQiWIheudPB6/GMk+7MVwyU0G1S3lz73vGu87DOUH
         DLS0+lymKa1C07kpMIcSCF4MulmCG2QgjNsTnNz6zcWRNxf3s4t746RbxM8n7Ye2OIjh
         FJaNxqzpv32T4Vj3XKqlxoOAFCnv0yDBNAO5L9LL1uRnlBwEfPjwNil+YW9yyu5A4VjQ
         SgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aWQLYPhqDKfx5oH7hlkSk8K6QKJGKV4Umxbuf8XuqKE=;
        b=YrwO5YvRUbHDbySOnUezjv+imNrF1pbV9OuVhlACxeCzrVfxr6Imu3zXWPO/EUtZiL
         mausiKfiaXrFg5bE/KuyPkc9467wZcMZDEvGohgRK1UXEIf24aXGAGy7H6Esbg8kkBNj
         r+J2PPxc6k9O/LaXrmqU5CF4QKMnVQuU+AAeUWH8MvW/FJ5LEVvVDyHPhQ3NyWiSPXCb
         F4qCMH5biDFIp/PG2QenjALGV/suYCp0lMETfgkaOiwD/fJaglHUV2b0ZvfptFYsj19W
         NkqqpYkeVG7+c+tJNoVcJ1JucwC2vAEEBiDh30BDNPcPXat4WeDsIiU/8PvMFPNv0nck
         b9pA==
X-Gm-Message-State: AOAM531rrFr+th0tTS9Uzr0NtrO9WYVuS/lg0dIq8AHUZb8Q/ZcAQZBL
        yIuEe9liRQU20ilNvkpRnf0=
X-Google-Smtp-Source: ABdhPJyqUX3Bx31cC0wuBVeFSjp63SpZIOZJhoutiFLUR3QrxeRzWtC4QVjzdYdNVFWTohvOnicSdQ==
X-Received: by 2002:adf:a491:: with SMTP id g17mr4002353wrb.132.1591699966641;
        Tue, 09 Jun 2020 03:52:46 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h5sm2949931wrw.85.2020.06.09.03.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 03:52:46 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 0/4] bmips: add BCM63xx power domain controller
Date:   Tue,  9 Jun 2020 12:52:40 +0200
Message-Id: <20200609105244.4014823-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
to enable/disable certain components in order to save power.

Álvaro Fernández Rojas (4):
  dt-bindings: soc: brcm: add BCM63xx power domain binding
  soc: bcm: add BCM63xx power domain driver
  mips: bmips: dts: add BCM6328 power domain support
  mips: bmips: dts: add BCM6362 power domain support

 .../devicetree/bindings/mips/brcm/soc.txt     |  17 +
 arch/mips/boot/dts/brcm/bcm6328.dtsi          |   6 +
 arch/mips/boot/dts/brcm/bcm6362.dtsi          |   6 +
 drivers/soc/bcm/Kconfig                       |   8 +
 drivers/soc/bcm/Makefile                      |   1 +
 drivers/soc/bcm/bcm63xx-power.c               | 374 ++++++++++++++++++
 6 files changed, 412 insertions(+)
 create mode 100644 drivers/soc/bcm/bcm63xx-power.c

-- 
2.26.2

