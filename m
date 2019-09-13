Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 597F4B25DE
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 21:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389876AbfIMTPs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 15:15:48 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:32975 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388860AbfIMTPs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 15:15:48 -0400
Received: by mail-pg1-f171.google.com with SMTP id n190so15745053pgn.0;
        Fri, 13 Sep 2019 12:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IbrgnnIi8mQgTBX8fvBLijtOJs8824mPLU4/EMPTvJU=;
        b=HMUUpeg7PwLa27pWDxfkHzPF/G9eoPiQiuC6zLCGPr/wWT7cxbQzAjvpA9Id3SWNlG
         C9XqKGnOT2ByhQ8REsy7VIigj2WVisjafv9wdy3l3TRnzTkzrSkwZymAwJCO+hHAnKsG
         Z2Om2qcJNMmTxwi+71heLCJGnJp7BWsOIC9iMcHOjP4MqQa7hPrEELUdOPDSXsOPGmYK
         bMzdrQ9Gc1avpE3lLQIkzOqzEeT+bGyQh3K6z7E5WnKBx6fgBhR/1RxKqWFPvAYieomI
         GECp0yEwtTgRo2hZ80HxWhuCEs6GppR5UNgvhtJIE/E3+GvET46fioc0EuSq9i4WFwkq
         O5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IbrgnnIi8mQgTBX8fvBLijtOJs8824mPLU4/EMPTvJU=;
        b=iUepHU6lbPVi1qQ8BMmbzi7a6Iwh2+pjRk/1jiAU7gk4KKbaNJ2oIU5a+vZUt4rRyi
         jeP9Ga6UEpjwTOWGYyI5GM+mdRS+RZpCGboD1dlZ6dE/vE814NV4uia4Ya/BVJvyANpJ
         38kkQezee3SBvzKhFWrizskA0PX4TVFkppDjJMDubwS/cxF/fQk3iugfBFpvuyCtba3q
         okPU/nvXBmrUKUxCiD6N88zzyEWSN6e2DhK4TcdB570NAXYJvSxhXRaMELo2gR1IB/yq
         W3GjG0LgrOwkAsREQgnV5zcxjqm30ZroNN632Ib6YPs+abPlbRPNui8ZWVzZ86scvmVu
         olfQ==
X-Gm-Message-State: APjAAAU6CRDKY7KX9msSWe5h8Qd/394gTHA8s1XycJlmyEGzcPz5lH68
        d1wyTtJP+86rKgR2MFS8A8VoRiaMPXU=
X-Google-Smtp-Source: APXvYqzvnmd7K/fJ4Hw+Ni1SoafIghqh8a4Vo5cum5IzRFEu2MpdRfin5IqW9ruB36JzPuGbbuTxwA==
X-Received: by 2002:a63:1046:: with SMTP id 6mr45800676pgq.111.1568402147186;
        Fri, 13 Sep 2019 12:15:47 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m24sm6988149pgj.71.2019.09.13.12.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 12:15:46 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM BMIPS MIPS
        ARCHITECTURE),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE)
Subject: [PATCH v2 0/5] irqchip/irq-bcm7038-l1 updates
Date:   Fri, 13 Sep 2019 12:15:37 -0700
Message-Id: <20190913191542.9908-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Marc, Jason, Thomas,

This patch series contains some updates from our internal tree to
support power management and allow configuring specific instances of the
brcm,bcm7038-l1-intc to leave some interrupts untouched and how the
firmware might have configured them.

Changes in v2:

- dropped the accidental fixup patch that made it to the list and squash
  it with patch #1 as it should have

Florian Fainelli (4):
  dt-bindings: Document brcm,irq-can-wake for brcm,bcm7038-l1-intc.txt
  irqchip/irq-bcm7038-l1: Enable parent IRQ if necessary
  dt-bindings: Document brcm,int-fwd-mask property for bcm7038-l1-intc
  irqchip/irq-bcm7038-l1: Support brcm,int-fwd-mask

Justin Chen (1):
  irqchip/irq-bcm7038-l1: Add PM support

 .../brcm,bcm7038-l1-intc.txt                  |   9 ++
 drivers/irqchip/irq-bcm7038-l1.c              | 117 +++++++++++++++++-
 2 files changed, 124 insertions(+), 2 deletions(-)

-- 
2.17.1

