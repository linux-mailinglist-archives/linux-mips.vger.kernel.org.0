Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F263D3D319C
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jul 2021 04:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233233AbhGWBpa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jul 2021 21:45:30 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:38633 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233193AbhGWBp3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 21:45:29 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id EF8395808BF;
        Thu, 22 Jul 2021 22:26:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 22 Jul 2021 22:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=piA92a2BDHjHVta7hxYES50nPA
        VoWHmEd4CMr4Jw8yE=; b=O8i9iPg61BaVTDHJ+7F+p+K4obNfEWnV06plnrbs9V
        gz59nVBrnMGyyl4ydd+J6VQ0J4TL/YghErBXWSzSNMq3046Nbubiv+JZ0q6P6nFq
        AEo2wseY7rd/ysKnq402bSfCZCWUbAyt0fDZZK2XdgrlD+bIvOI1uXMaVHk5BKkv
        V20slIVEOaXATSB/LIQT0Ei3uVztAsXDia8PWZD9nNDmCSPs6sDvCvzfHVUHWEyd
        26qdkHb4CU1E1c87S4+J7ZeD4CjW7JvfgRn9tdbeWnUdVVQOBjUWZKS3Wav+BQ8n
        OEvtgqRfualemWnGtmNNynV40m828rbL5mFIN8QGMrbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=piA92a2BDHjHVta7h
        xYES50nPAVoWHmEd4CMr4Jw8yE=; b=ZQ6hpGobMwmOQxd1rEYvmPe5JHMCNGCeA
        nj0uOGapBXCKamXa7S9hx4ZDYMkNOeR31RrVUxnfBZok9j0uCYNfBlrowDEGn7eS
        lD0Nn+HSnzb6f9LtqwZP5ov12KjhSfJTKab8FnIwrMjiqvCmqmVCF9jI8Qztqsbn
        NFzdvGFIHg9Ls31RGrbGkmrV0Toa6PWq+ThyZCuMV4bbMCOrY0+2o2iOKwTzkj7b
        qgtsh+/UUZKdUwo3XhksbnRbpuCbzwJHX7B3lGRPN66yV1Hd0OK2ERfEOfobhozh
        x8CpBN1BhSxe+o1BA5/qIfBTgaINJGnT8mc+kxKUvTEEJwp5avMgA==
X-ME-Sender: <xms:uij6YA-berd2T20nD87zdunn_9Al21zaSp3J7v0CcuKYS37EEGWI4A>
    <xme:uij6YIubTYKKjM7bKFzjLLiUQLMQaFMiQZnG4CLzW1b84jxKyFyUqNIpCKEOMgfmR
    Uhs_Ph9UL3Mz2yt-mw>
X-ME-Received: <xmr:uij6YGB0ThpkdKp1pRLlKp9_BbCWtIAzRT6Vl8P1Ug_MnydkuF6j6vTIpYEVafLNsXMlKqwIjFxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepgeffjeeitdegieeujedvvdeije
    etkeefueevteeltdeiheffgfeuffduiefgtedvnecuffhomhgrihhnpedtuddrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgi
    hunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:uij6YAc5WX1sUpH0A6_9XYJ2magHEth3mi_UxIOnZ9WcTdWSHs-UOQ>
    <xmx:uij6YFNW8WirigQDIVu5EwN_Qz_zJ26lGiSNrcjU9pS0RGSfc_rb4A>
    <xmx:uij6YKnvupEuFHbKZ4Y1BuqcA43yIH0xTvcXo5MYo0lfhb-AiNpIRQ>
    <xmx:uij6YGEj9lVbGfrGG17fkIQTPbnvoVjYu-5pUSV1D4Hw7ZKBA9iXZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 22:25:57 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v4 0/9] MIPS: Migrate pistachio to generic kernel
Date:   Fri, 23 Jul 2021 10:25:34 +0800
Message-Id: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I'm lucky enough to get a Creator CI40 board from dusts.
This patchset move it to gerneic kernel to reduce maintenance burden.
It have been tested with SD Card boot.

--
v2: Minor fixes
v3: Typo fixes and 0day testbot warning fix (Thanks to Sergei!)
v4: 01.org warning fix

Jiaxun Yang (9):
  MIPS: generic: Allow generating FIT image for Marduk board
  MIPS: DTS: Pistachio add missing cpc and cdmm
  clk: pistachio: Make it selectable for generic MIPS kernel
  clocksource/drivers/pistachio: Make it selectable for MIPS
  phy: pistachio-usb: Depend on MIPS || COMPILE_TEST
  pinctrl: pistachio: Make it as an option
  MIPS: config: generic: Add config for Marduk board
  MIPS: Retire MACH_PISTACHIO
  MIPS: Make a alias for pistachio_defconfig

 arch/mips/Kbuild.platforms                    |   1 -
 arch/mips/Kconfig                             |  30 --
 arch/mips/Makefile                            |   3 +
 arch/mips/boot/dts/Makefile                   |   2 +-
 arch/mips/boot/dts/img/Makefile               |   3 +-
 arch/mips/boot/dts/img/pistachio.dtsi         |  10 +
 arch/mips/configs/generic/board-marduk.config |  53 +++
 arch/mips/configs/pistachio_defconfig         | 316 ------------------
 arch/mips/generic/Kconfig                     |   6 +
 arch/mips/generic/Platform                    |   1 +
 arch/mips/generic/board-marduk.its.S          |  22 ++
 arch/mips/pistachio/Kconfig                   |  14 -
 arch/mips/pistachio/Makefile                  |   2 -
 arch/mips/pistachio/Platform                  |   6 -
 arch/mips/pistachio/init.c                    | 125 -------
 arch/mips/pistachio/irq.c                     |  24 --
 arch/mips/pistachio/time.c                    |  55 ---
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   2 +-
 drivers/clk/pistachio/Kconfig                 |   8 +
 drivers/clocksource/Kconfig                   |   3 +-
 drivers/phy/Kconfig                           |   2 +-
 drivers/pinctrl/Kconfig                       |   5 +-
 23 files changed, 114 insertions(+), 580 deletions(-)
 create mode 100644 arch/mips/configs/generic/board-marduk.config
 delete mode 100644 arch/mips/configs/pistachio_defconfig
 create mode 100644 arch/mips/generic/board-marduk.its.S
 delete mode 100644 arch/mips/pistachio/Kconfig
 delete mode 100644 arch/mips/pistachio/Makefile
 delete mode 100644 arch/mips/pistachio/Platform
 delete mode 100644 arch/mips/pistachio/init.c
 delete mode 100644 arch/mips/pistachio/irq.c
 delete mode 100644 arch/mips/pistachio/time.c
 create mode 100644 drivers/clk/pistachio/Kconfig

-- 
2.32.0

