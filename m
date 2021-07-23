Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDDD3D31B4
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jul 2021 04:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbhGWBp5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jul 2021 21:45:57 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:46711 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233148AbhGWBp4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 21:45:56 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id A8B945808BF;
        Thu, 22 Jul 2021 22:26:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 22 Jul 2021 22:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=NmMGZALgUPfiC
        ccQxTOVbNtmDLubEwgB51Zr56BaCn0=; b=Jgu2qJ3wjekbLEgXW4gXUCn88sIjK
        0N3xMnD4wTqdX7/s4rPEO069w+3yn8+EAQVneIpschX+sx3CQZyZz9oHQTI6hz0j
        usEX4gYd+QVkQaGbQKR+q8rq1VFNvcKiDkLSxO+ESB3GqUo4ESbPq/QHq6Rae8Nb
        qZMj9iKHI39ljr49AkH2EOoa0Y+GYxgBS/mINdp98NM9BRG34T7SAsPPam0sxF/l
        +cYjmVqfY9R7Gx4KU5XcxA7s3NrCEtLfBfKQ6CHYKMRM+GlBeuT4pVM31NvhyT5Y
        siZMHpLtKll8oRBhz190yRKGARsW228rcvKRwITXBUfT5Ey0Cir2WkeAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=NmMGZALgUPfiCccQxTOVbNtmDLubEwgB51Zr56BaCn0=; b=GS6JCRq4
        W+wCbSfmopuRG5MJCa9sTCAg0/9NhOLoi3V+xn8GZrftLibgyFa0fQOHbRWgFOt+
        43/qGJltsFSaz4vtlGr5vx+t8u/nmmmDK+NBLM92W0/0B4wcodhKP5S/PDQJgpGW
        hhTLVT6L5UpXLDQHUddGNecY1N4Ejmt6J6MM0vIvbjzyKr4Bx/OoVtli3vtr2ava
        5mUWtiPobvKm9tBJ7MzQpZs1Frq6ic8nmCkjgG8xagX+IR96I3EIx8vEPUZE6KY7
        hSevnqijk8+/agkyRnP5xXxqbjAsa9dop7j3V53nfqgidhZB/Xu7iUUl5AuGXPg5
        /iKVtpv/+dfKIw==
X-ME-Sender: <xms:1ij6YDujmzkf_HXYflgcquUGwjjXZOc1bR0Ri_BMSCW0l8DsKuSikA>
    <xme:1ij6YEeeRUi-cLiwCIFxlM3tugDfsHJONLguNOazbN0HfVQbzZjyZzR1R9eXgpUxO
    azXbq6nHe7Phs7pfSM>
X-ME-Received: <xmr:1ij6YGyGrMQ_D6GuIAqqLEvlRU0iafUmmBhOY2t6yzDTmnaPFHfBVNXqghgH1Xo8Wp0qfIIHPsO->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:1ij6YCOwrZZjT5EuF2W6J6FgX9dOWtjMYgEnmDYwJSwhTy5IXQu6Yg>
    <xmx:1ij6YD81uyrGXNENWVN5fUti-Y3Ol9eMoOmbIC5T0-AjMe-F9wvKAw>
    <xmx:1ij6YCXihpzATywmfTY9jB-ePsyz9p3_vnjDnVe_VZ4G8uyY2eDmIA>
    <xmx:1ij6YE2V5aD2OeAsk6CuXb-eb3C37GXtFA8Kk83iRbk2HZ6StC7wrg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 22:26:25 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v4 5/9] phy: pistachio-usb: Depend on MIPS || COMPILE_TEST
Date:   Fri, 23 Jul 2021 10:25:39 +0800
Message-Id: <20210723022543.4095-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
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

