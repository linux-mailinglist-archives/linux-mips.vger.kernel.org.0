Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E529E3D31C0
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jul 2021 04:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbhGWBqI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jul 2021 21:46:08 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:57971 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233391AbhGWBqG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 21:46:06 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 777B15808BF;
        Thu, 22 Jul 2021 22:26:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 22 Jul 2021 22:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=izRxClR9rmdMb
        QxNobmULuQgWdizJr1NuVHnqGsRHa4=; b=dxZe8SZM7O+eZv22hpdDR/tHV3sgj
        NYm73padoYX2wLS2C1SVX99ruV8RJuGEioIvUEz/pfd4HXxx0OZM0BpeWcKPCsws
        kVfkFRJEJsxr7FaC7OFVVJzKenSlTzIryjwP8LD0R3nuh80EWyUfDB6VDTgs0Tl8
        FjNU+f5qOgw1jxESb5HH6Mi1ANZukW0bC87dKpMsuAOjAP+NmStMjpNo3R560YW8
        pW25BW8UBIybl/hTqGmeIWuND7mCU3LUE87cSujt9K15xedY9rABENvlij2yLgwQ
        xfS/+50oLN/RezfC6s+0hy+82xGndJbNCAWCB1dpHy9tmuHngqBT8wMQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=izRxClR9rmdMbQxNobmULuQgWdizJr1NuVHnqGsRHa4=; b=mJH1/AS6
        JpeLmbXIqh6CvhGdCHX4rlBTDuzKWB1SzNM1ZJLTUKy7EUTYptdXYy20oK7ggaeD
        jMbx6tnrg0uxCS+VM6wgadgoCXwZX+93wSFPYxgZKX454Kzaymo4yoeOGHGGgkf4
        74pLbDecbNxDIiuYS/HunK3K8osmjvwxAN4Tq2789QWwNCBfM6GilAGDNR5HLmiv
        vjn9PHZ/SWiRyITz0PMHEbGw724XBbfhQGN1wZCnltFRU6f3vJxSVYj4bh24mNCD
        2lDGEym+h06f7dAiyCOFqnYvxSv/7K+RLwwq/EyH6zPdmb28A4VMl9kQcrTIma0O
        IzwLBh+Ck5hJyA==
X-ME-Sender: <xms:4Cj6YKel1ArWIVpSqR-Y7GJ_oXXpFhDJutTpw4c2zyTJL3JksYJ83g>
    <xme:4Cj6YEOuSHm22N-BLybcsh-AAjoAFjeAzqGP_hDHLmwvY-5BSSYJyplj2BX4R2dvR
    PqqpksT9m9HpvY6smM>
X-ME-Received: <xmr:4Cj6YLi8pqcgatXZjNJCvNokJU6Kfr_1H6XNw-24Z13kIhVjz-B4g9J8GrF4T0rJC3QlQoJ_567g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    udenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:4Cj6YH8WD_7PEaA7LASnaHtCZk_JjCIhuDKYcBJCAocMLipmPoazTg>
    <xmx:4Cj6YGty-tVCqGzdzhm0PxhnUWWr48NZh-J6PHyYN3UEMlhn0B1rlA>
    <xmx:4Cj6YOF1-ePaHSfJ08f7B4pYLKK-h3G1s-1q8EsqwD3mGvptv0C_Bg>
    <xmx:4Cj6YHl1XtJk9Qo6Fvz6P1EUUgjPti2pRIYWlgaBbyInqvrXBSj_Lw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 22:26:35 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v4 7/9] MIPS: config: generic: Add config for Marduk board
Date:   Fri, 23 Jul 2021 10:25:41 +0800
Message-Id: <20210723022543.4095-8-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
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

