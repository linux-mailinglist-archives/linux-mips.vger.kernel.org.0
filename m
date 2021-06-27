Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534633B5216
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jun 2021 06:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbhF0E7w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 00:59:52 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:60539 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231266AbhF0E7v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 00:59:51 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 587A55807B0;
        Sun, 27 Jun 2021 00:57:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 27 Jun 2021 00:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=izRxClR9rmdMb
        QxNobmULuQgWdizJr1NuVHnqGsRHa4=; b=pjiU1lZPyKQ5ZGq2Q8DaV42TZR+Jf
        LVClsPsvRrj0hs6+HaUK4L+C+eAMevYATS2ShZZWfBbinuPljUs9/CZ0qVRQ7AF9
        AFeMGJa3X+CLxXyUGIziicZuZTv95z6SvUEyCrnAX/Xc+dar5gcsoT2XBvl5WNHU
        UitiJ1fZyaaM38pPq1+M868FJEbxOtNAGen3UCh3fOfXCfGGTzsJpBA16tqac5zS
        rZxOkjKh35oghpgU9Sr0YCY3P8NBxxVc7qnR+CLJ1rhMDinF1flNMOWejaQfnLcK
        ZlXujjl6u8SS5LY0AeqW/C0Y7/esqrquM9TiD9uDqfEbJQOiGkCTc3Bww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=izRxClR9rmdMbQxNobmULuQgWdizJr1NuVHnqGsRHa4=; b=JUUnGXir
        KOB5g93jMrd0Ivv+ge++QuJyqMVvvgYtyjXJZnsMtuSW7RmNa0R88gqXzjZkVBh1
        6oLqf19I+WX7wvFeeet54e2g5MyNhPmg/zKhMlkoj5Qik6a52ndHO6ix0l0pLcYV
        DJtE9d1Qp3+HL5wbJB+1YMz0ZCrpTBrMQbrYpkNB8U805O9lqEOzi354Y4F9cHNy
        yLJvJCktO7Des2oxpUSmwEbTGbjHKEOZ6IyRiUtgMuDnzp9SnjPsiAOYfgAcl976
        wGF3qSWxDrZmPWDsB3DhRED5eukEAxGTJwkjCPI4pARuuUQA7QW+V9h2cxn93PZ/
        GB+X8YehsWxUJw==
X-ME-Sender: <xms:NwXYYHnt13JcMc2TRfR9RITPYTg3ZrxZmuRTAjezAbnI7Us04QlUdA>
    <xme:NwXYYK3uzAZov5dkmxDPVaW7sRAOzdoJ8Hh1Phf548S94zXSdW5hGZ38ZwD3FcfZl
    ZTR1N3X3B2Zo7GqLno>
X-ME-Received: <xmr:NwXYYNpljQju1B_wmlKGrJxH0UDyJAbM2el0ZZkyAgbXuiwUfM3FIgxrspXn44-qmkF84mBtR_o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehuddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejiefhgfetleekleffud
    ektdehvedujedvgeekkeejfefhhffhtedutefgtdffueenucevlhhushhtvghrufhiiigv
    pedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhm
X-ME-Proxy: <xmx:NwXYYPmlkeOMgsS3mLtUAlJ8dkFpAymW5xT8wRJEnZgnKs8NZOgubg>
    <xmx:NwXYYF0l8esUT5PSrs4fFy5WZcmUPuCn-ITp2i_s8Z5SGaDf25fhmg>
    <xmx:NwXYYOsS4bU0MjvTgx8eVMwDl-nmWBJtblx5DxWGOGPFrkGKUr33vQ>
    <xmx:NwXYYOvIDykGdf3U0v0diNLFLcpvvCPfaYBMfHXYbxzJ-pV0m8ureQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 00:57:21 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 7/9] MIPS: config: generic: Add config for Marduk board
Date:   Sun, 27 Jun 2021 12:56:29 +0800
Message-Id: <20210627045631.2882-8-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The config is minimal config to allow it boot from SD Card.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/configs/generic/board-marduk.config | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/mips/configs/generic/board-marduk.config

diff --git a/arch/mips/configs/generic/board-marduk.config b/arch/mips/configs/generic/board-marduk.config
new file mode 100644
index 000000000000..05ca34cd5a73
--- /dev/null
+++ b/arch/mips/configs/generic/board-marduk.config
@@ -0,0 +1,53 @@
+CONFIG_FIT_IMAGE_FDT_MARDUK=y
+
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+
+CONFIG_CLKSRC_PISTACHIO=y
+
+CONFIG_COMMON_CLK_PISTACHIO=y
+
+CONFIG_DMADEVICES=y
+CONFIG_IMG_MDC_DMA=y
+
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_PCH=y
+
+CONFIG_I2C=y
+CONFIG_I2C_IMG=y
+
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_PLTFM=y
+
+CONFIG_NETDEVICES=y
+CONFIG_STMMAC_ETH=y
+CONFIG_STMMAC_PLATFORM=y
+
+CONFIG_PHY_PISTACHIO_USB=y
+
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_PISTACHIO=y
+
+CONFIG_RESET_PISTACHIO=y
+
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_8250_DW=y
+
+CONFIG_SPI=y
+CONFIG_SRAM=y
+
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_DWC2=y
+
+CONFIG_CRYPTO_DEV_IMGTEC_HASH=y
+CONFIG_IMGPDC_WDT=y
+CONFIG_IR_IMG=y
+CONFIG_CC10001_ADC=y
+CONFIG_SND_SOC_IMG=y
-- 
2.32.0

