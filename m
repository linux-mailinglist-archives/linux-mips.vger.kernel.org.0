Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2060F3BE151
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jul 2021 05:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhGGDS6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jul 2021 23:18:58 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:60127 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229989AbhGGDS5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Jul 2021 23:18:57 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4E0FC580452;
        Tue,  6 Jul 2021 23:16:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 06 Jul 2021 23:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=HD7fvV++lnXN3rWSs6B1vaR05h
        KL8vwruZu2/KPFdDg=; b=dj8L10ljRLCEcw+rfR2ejvc6zdTYI+p+Xn2SwyyWuw
        ntiKEItS8aL254dXSMWkpKa2A347Zwz7c7zJsCsa5FYKa3+U6aMta7j7e+GEELoJ
        5ZPAGDpeAStzV8mfAjvKHNBy8rp/yIFA14v8NabkU48y42lDklecfN3mRQ1CEny8
        vD9uQl2v/th+mAJ86fFU0i3B/SLiIqyZOyp6wbE3V3JbXBbJYB6tbA86kApzXVsL
        F+fl0SRoZ4UNEAvQ32yDpG2f9kMLJTtrQrDm2pCRRAXlyNbR5YzpImNVyM3fugb7
        7mzMEFt9m39Ja4K27SfGxdzQFpJzyuq7+AmnMFInYjjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HD7fvV++lnXN3rWSs
        6B1vaR05hKL8vwruZu2/KPFdDg=; b=ozmbQtH4h2Sj+pL/aMBdxZF/d5DtSU4Z6
        yNy7stbILDPp69jViWm5njGhRww/vDYERVhHSyxX6TI2cZjqsng6EeDQx9wGZoNo
        hMuOq7SeVAJIacoaBgdqQ5nCpY0E2eU2exdPbQ6YQtq7YTqjVMjwyF1nRrLGfGZ+
        jpGA7vHgQ3YABvyUQclqdvabSmTR3DG/wcY2oNh4WGhHsZsHWHvqody+txoBFJj7
        K7BsMeX0CZPo/j1J8QBrO+3+nM4mJRkCS+GRkwy1fqYOGmSTp+sH2FolPo0AVjuN
        pkp9D0F9symNSSVhhKJPDAzqtfUfhyb56hzYUgHUcjgAzHeP2DDdQ==
X-ME-Sender: <xms:gBzlYBHdlhQRho6k4ijWjYwacYx--7Ov9ZjgvTpjleeFScrMCooLGw>
    <xme:gBzlYGWCeyDpCu1pDV6egxDoCyrCvSjVSn2hjPmHzh3EVHdw0IpKg4JqcTxV3j3U7
    0Y8jLkVBHUbgnjhuhY>
X-ME-Received: <xmr:gBzlYDKbOY7alhDYGtLIC6xk3YWUXNbemo256-9KRD49HrW8OSVhovd1VxWRe9H8N9qQRoMiziH2ntR_Dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfejtdektdeuhedtieefteekve
    ffteejteefgeekveegffetvddugfeliefhtddunecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrth
    drtghomh
X-ME-Proxy: <xmx:gBzlYHFs8QKGuLvAvW_8az0nOFaVcUwhX5MnJn4XA6i3dxWnpMGVbQ>
    <xmx:gBzlYHV2qFrnn5Vm3DkrBZ116MHFOwUD3KCMHCy3Muj_DUIkLpJlKA>
    <xmx:gBzlYCMq6h6GIrsanFERjP_BfgWHUqIQKG2WnW7BUg1TK1YCN7RquA>
    <xmx:gRzlYAOQHXOYkkstFkuhEuEGElfB0hCiVI3w1BFU0bwjtVk-DfO65w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 23:16:12 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/9] MIPS: Migrate pistachio to generic kernel
Date:   Wed,  7 Jul 2021 11:15:43 +0800
Message-Id: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
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

Jiaxun Yang (9):
  MIPS: generic: Allow generating FIT image for Marduk board
  MIPS: DTS: Pistachio add missing cpc and cdmm
  clk: pistachio: Make it selectable for generic MIPS kernel
  clocksource/drivers/pistachio: Make it seletable for MIPS
  phy: pistachio-usb: Depend on MIPS || COMPILE_TEST
  pinctrl: pistachio: Make it as a option
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

