Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B89C118FA
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 14:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfEBM1p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 08:27:45 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42878 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfEBM1p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 May 2019 08:27:45 -0400
Received: by mail-ed1-f67.google.com with SMTP id l25so1922335eda.9;
        Thu, 02 May 2019 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KjuhLndbnHfio43jUb8s1c3TkKyM8WF5w012zBcDtiI=;
        b=Fye5ffDhQsveH3LJAq/nfndQuQ0Litj0p2UPhBWpmyWsQaJeWwGlUF7oTP6QPsrOkM
         WPrxAiN5AYxLRO7UdFJlRE4SOA2VvlEcHdIjN1UhaL+9wG3g5jU1f5PR8DEhsA2lnB2k
         Pi4vml9/+rOhxwlJbr+2cXum/CfFEFysxjT5ZK6lnxeeZ6ITge7isVdFo+pN7D+xRuzT
         JwYZGJF/NtWp5DcCGPpQvGssOUkPmt+k1Pmqrzk/GbGPeMDJjyX4ieFLD7X1BNcxcjYa
         l5YC7kCO93JpgBu8TMKGSzWE+wgMauU/7F1xpHIxdFnVJZ9H1m1jM4HPvsO+9YYXt3cO
         2U8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KjuhLndbnHfio43jUb8s1c3TkKyM8WF5w012zBcDtiI=;
        b=o5giSljvtc/1ELKX+97KBMUPNKIPUPWb/5nk9WyJGax4yyp4CDTEs+iOTfwj+WRejg
         RRs/C5KIJ4rRqLKKyMY3J9HTtyZZD07983Oc8+JvWlGCAvRINyEuuiAUHNex4Py8dFDH
         nN/HpWenOEPz5bgU22dONJJ1uIFvdg5IDiY7yWqIbbG+/GTQB1BznQ9KrSIl9pRGZtG8
         HC9N3Eqy1qNVcuw+T1l8lLfgxHImMMXjbO1KdO5VyAB7lmnxYy64ulQCvOBZ/1sinsAK
         Xu9uXf3+yG/eFt5jRk1soduVBTqHs2NxnJcZxzt3NWlmP/guIsO3j2/wT1Et/PNsY5P6
         KQDg==
X-Gm-Message-State: APjAAAXgGFI2uKdtS87DVxKdgiSScagnRHNNq204ltXyu0d/eGKuk35W
        W9IVzv1OLiXxoMRmq8+p7x4ZSeQ7
X-Google-Smtp-Source: APXvYqx7yMWCZmd9KvNS2j1GBOL6klUkWnn9DUgPYGwd3jivoBKTMNpJs9WeTA2+oeb9CVj1CbjODg==
X-Received: by 2002:a50:ba8e:: with SMTP id x14mr2318074ede.211.1556800062687;
        Thu, 02 May 2019 05:27:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id k18sm2030453eda.92.2019.05.02.05.27.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 05:27:41 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Subject: [PATCH 0/3] MIPS: BMIPS: add support for gated clock controller
Date:   Thu,  2 May 2019 14:26:54 +0200
Message-Id: <20190502122657.15577-1-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patchset adds support for the gated clock controller found on most
MIPS based Broadcom BCM63XX SoCs.

The MIPS based BCM63XX SoCs have very little in common with the ARM
based ones, so a separate driver is necessary.

It's a simple register based controller, with one bit per clock, active
high.

Since BCM63XX/MIPS runs in big endian mode, the driver depends on the
series "clk: make register endianness a run-time property", or more
specifically on patch 3, "clk: gate: add explicit big endian support".

Based on the clk-next branch.

Jonas Gorski (3):
  devicetree: document the BCM63XX gated clock bindings
  clk: add BCM63XX gated clock controller driver
  MIPS: BMIPS: add clock controller nodes

 .../bindings/clock/brcm,bcm63xx-clocks.txt         |  22 ++
 arch/mips/boot/dts/brcm/bcm3368.dtsi               |  12 +-
 arch/mips/boot/dts/brcm/bcm63268.dtsi              |  12 +-
 arch/mips/boot/dts/brcm/bcm6328.dtsi               |   6 +
 arch/mips/boot/dts/brcm/bcm6358.dtsi               |  12 +-
 arch/mips/boot/dts/brcm/bcm6362.dtsi               |  12 +-
 arch/mips/boot/dts/brcm/bcm6368.dtsi               |  12 +-
 drivers/clk/bcm/Kconfig                            |   8 +
 drivers/clk/bcm/Makefile                           |   1 +
 drivers/clk/bcm/clk-bcm63xx-gate.c                 | 246 +++++++++++++++++++++
 10 files changed, 328 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
 create mode 100644 drivers/clk/bcm/clk-bcm63xx-gate.c

-- 
2.13.2

