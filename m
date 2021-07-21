Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5893D06FA
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 05:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231702AbhGUCWP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 22:22:15 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:42857 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231432AbhGUCVs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Jul 2021 22:21:48 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 779282B0050A;
        Tue, 20 Jul 2021 23:02:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 20 Jul 2021 23:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=NmMGZALgUPfiC
        ccQxTOVbNtmDLubEwgB51Zr56BaCn0=; b=PcEaaYDu52lvwFxg5OyLeD/V10jvi
        RDRHWOI0ewk2d9okT13W8mOIpTSDMS4M/+IfY3ppQ3zqFDaDW4SNiuZ2IXQoZU5m
        FQGA+31XVxYRBK8ppPIEfWTR6n7jTCT1wNSJfNn47okps5LWnlGJMHa7YuRYjNrn
        KKdiCVboIkMRlnADvxN8zj9FHqdUdJxdlpVjpi8Z+tFi/036Q3Yx2nixo9po5ue0
        nZEpuZzCvLGBRcCzAxUVIkBWL7tN11laZcS25qUTsNie9xhI8lduMJ2Kmc/gDl0r
        n3QeX6Qowcb5FtAaP9mrvXfg64QocqwQHhzevzfvxGquTT5iestbsr5Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=NmMGZALgUPfiCccQxTOVbNtmDLubEwgB51Zr56BaCn0=; b=Px378Bsg
        GWj8+NsXIduf199Dd+W51fFOuAcWpskFNbUeNVuDwN2iTMnb8/7tvq6Ptw3Ytpr8
        0s1DeetpJpX0SLTGSA3sLY2E89584v2kSaSeowJiTBntkJnqz6GIKZJel9PPTqoK
        fuaIwuK/KuAfl+PJW4sEpJBQUA9YLUaoUwTq6Dz8V3G8AjQEmsvwuUIUlcOgi6Hy
        RUxDDjXGeOYakNZvZJEJ0ixNMl37O1DdwsJBgQoZid6lWwrBJC4/GyPN31Z9pkdI
        +Z+XbCI9zzRxbDVUcY5WjkLWpv2CNjmQfpCD1Bnzthp/sotOAd6vNzgmZ2o0yNVw
        Nj+RIYOgoWi/ug==
X-ME-Sender: <xms:QI73YHP3wcek5iGG1S7B1sAVo8MB7rAmSJiokaKdEd3ymig630QKGw>
    <xme:QI73YB_K4XGihIZDxcarNfgda9ByDxnHsAhEjmQWQImwPPBTrGDjro2Vpz4F4fQDS
    V6Hgs9jgVsznYjGenA>
X-ME-Received: <xmr:QI73YGRBr4Y6QhY1b_7aQ9aTfq7IyAsaBOpckG16VmXbTsqCBZK_Lc9grK8vjwCesbcuBYWPC7ym>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    udenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:QI73YLsbchLa6d1rxTFxqJxF5omI4W3eo-bi5KgXStnaiaIRpqjcCA>
    <xmx:QI73YPeUJ1Y9yigbY-NyxW9Y4IM26TtCqGSrfQ_FPUDuWWJk4TZADg>
    <xmx:QI73YH3zSkVjTGfmCUzFnOklV6WmPIgWbhUUstxmHyOpFgU4VzSjwg>
    <xmx:QI73YAVTid84vKVRvSblxq9crjVv3T0W9qh2cl3dX7rZ1SdfsonRwNAkigc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 23:02:19 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 5/9] phy: pistachio-usb: Depend on MIPS || COMPILE_TEST
Date:   Wed, 21 Jul 2021 11:01:30 +0800
Message-Id: <20210721030134.10562-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
References: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

So it will be avilable for generic MIPS kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/phy/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 54c1f2f0985f..f3b08722261d 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -37,7 +37,7 @@ config PHY_LPC18XX_USB_OTG
 
 config PHY_PISTACHIO_USB
 	tristate "IMG Pistachio USB2.0 PHY driver"
-	depends on MACH_PISTACHIO
+	depends on MIPS || COMPILE_TEST
 	select GENERIC_PHY
 	help
 	  Enable this to support the USB2.0 PHY on the IMG Pistachio SoC.
-- 
2.32.0

