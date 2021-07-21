Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9392B3D06E3
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 05:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhGUCV2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 22:21:28 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:35791 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230451AbhGUCVW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Jul 2021 22:21:22 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 830012B004FC;
        Tue, 20 Jul 2021 23:01:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 20 Jul 2021 23:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=GohC1Xd2UWQStJhSae6I3++vzG
        AiFbgghmNjmKdy6j0=; b=WkXI/MCbn1fdpcTgR+wb7KadJo2Vm9HCph5shcJ5fw
        LYRDLfRigLkGW0a0D0eca5+Io5zoJ+3AcC+MFGyAhfR580IPuGevvY+cCdjxUeH3
        upWSTgr1WxW1Bi7FuN7NuHWCGaNTTfzAAuGjP9uHLvHwoXYgLtL8eyfw6x0RKQr3
        HwjDppjmKqICiVBQtS/FUzGnQpzUH2rtQhEE6vLV46mDZC3Qfqr5dl3f4jFl2BLp
        7s1G41F1pKrT22dEqdDOb9wjED8koMRZMYO3U7yrJ1Z3MDIrSxAgEjDBAQAQy7Om
        hOUcsg4TfyB59O4hW+4o1/bEnEo4yUViVUQOMkiZOrJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GohC1Xd2UWQStJhSa
        e6I3++vzGAiFbgghmNjmKdy6j0=; b=d1SIOQXhNs3X+miPCQAPoOp2/pnho2Uy1
        pYjs9EtfY5f/oVC3b+pZ8LjDAoLHZd8yx1S2JbTPGJFEc+CeLidtYfYFlIena/Rs
        /8RVhnvd2gS0GAyhrUmbTEopQhKfeLS4k+FA0iuxTHiPcm28OVGA0gSjBFD2ALCI
        /RQCxalysJMESF6nAdXfJBLRRjAlPLUNHqU1MINCmYUvfuRbUvki0ADsg6AGURga
        6jdBvAUPbq4E+c3+hXT5kobyO/QpwI+j60qdu1CAfgirEjivU6Ld1PjmwwS6Gw/w
        WFfsSkcCFjpssqJ6P1zhmsdHnwzEUh9+j5tlb1oUb/kPRbkgbHXoQ==
X-ME-Sender: <xms:II73YGW0qEDVTEvZ2GJHRq1-sRxJyYBvZVvXVk6dLNFF2d8ADMJzrA>
    <xme:II73YCmp-UQ2Boiz39sGD21Sd4vdp37WhODwXIde9Zi4BtD0WVxZwMHKCtj770zIg
    yxsykfd9mer8ar6Cm8>
X-ME-Received: <xmr:II73YKY0dCPWU2gOMNBRy-WqIBuOScgs8xiFvT4FKQIhQirKFYBJ5g0vtHjmtPlOflyilZ3nj_8S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfejtdektdeuhedtieefteekve
    ffteejteefgeekveegffetvddugfeliefhtddunecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrth
    drtghomh
X-ME-Proxy: <xmx:II73YNX6skF8MxyWwDXkQV8EfMmJxDsAl5ACgjkilBL17nw0xtUh9g>
    <xmx:II73YAnvL_WmV8ybFDoPOz9DzLNbUG6BmiEPVdTrtFfD1qn1kszHJw>
    <xmx:II73YCd5XSHw6t3T1ojDmj_xC_0U4jFhgLbZQAONJHr3z8p704WP6A>
    <xmx:Io73YJdVhOEQzb6RKtplBhWoAxZeJyLLIUAKuJusIX0M5ja15XCCsfTCXhc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 23:01:48 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 0/9] MIPS: Migrate pistachio to generic kernel
Date:   Wed, 21 Jul 2021 11:01:25 +0800
Message-Id: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
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
 arch/mips/Kconfig                             |  29 --
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
 23 files changed, 114 insertions(+), 579 deletions(-)
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

