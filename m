Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A993BE167
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jul 2021 05:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbhGGDTW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jul 2021 23:19:22 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:52723 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230197AbhGGDTW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Jul 2021 23:19:22 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 41251580452;
        Tue,  6 Jul 2021 23:16:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 06 Jul 2021 23:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=fK+K0d08qIRtz
        I5lRyrah+khLjr9G35dqtzXmEd/ZSQ=; b=K5yjgZDNObEfyD4FGM//8X5s2G5As
        Y2EXZ1U3uNhCVxKoOd6LJiBmJte15E44U6zEA+BbVAUSoe6M7JnF90Yj9gbZjNBi
        TpDR3b+vDnFb0ThWd+PNN0VUJxJxr+fwsI8CMUqtqyPZ4za8SSppHUBwAuGvNTwh
        ez+3zSOaDOxdjwSyvRU3fiqCd5YUDbYF52BcLY3dclWuoA3/Uotr++9v9z2wYFd1
        TtfEnf65scNUnn1CPhaluj1mDrtsqFSjQJoGxFW6u5/atfERLHcH67VT6Q3/L8k3
        Ps/RhlaTXqYslDxN1rV5P1xXPIEuhhEurBKHMhiC9DDhqBT6PDEUOY3Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=fK+K0d08qIRtzI5lRyrah+khLjr9G35dqtzXmEd/ZSQ=; b=k2OsDHsT
        kpSxf8m54WPa9oscjvIbsvS2Av30gScGSxr37GJEMywvGh7SNGNBRT7r3X7NKAj6
        8gg9Z3yinXxAAN4VgGcq6nvFTLJOa4ACnEU3DkX5Gk/funEkoiebTgbzpByPPLJ4
        5O7rtrmzyD2waVAS8rQ++4GiR+dBSDemxC6qYB3RvAtuTqRF54VEn9DDDyjZNzxB
        fCWLxfvrN2E5O+RwmU4UmusPFxS99wCD92oo3wR/sO1bR42MoDEu4yFIb5pVl7Ap
        NST08jmgBWq5G3Z6ACmR6HQzqkSUDj+cTXaj/zJ8dUMYm4XavwyBf266m0EpmpbV
        prCHkG17yaMYaA==
X-ME-Sender: <xms:mhzlYFX0YBGTG9_78v9Lx8T_TbKeQzCI0ALL8l66za8SUc6F7c_p-Q>
    <xme:mhzlYFmCHr6lfJgxdI0phmx3IHhycs64Vsex-VR2ZKoSHa8wnXBToaoAeYjVc0cwG
    0YG8K3A_l341AeYNR8>
X-ME-Received: <xmr:mhzlYBbOhatMYHF8fAHlBKPPK1PoTK7J0Ae5pwFEFbfzVPSTg99U8wWqVF7JrUtgnzrpkVer-9i0yMvMDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:mhzlYIXvS5Qzqkv6Csy7s-zFUW0t5-PaWofd_vjmUv4dVJtV3KUzeg>
    <xmx:mhzlYPk9Zr5I7IKa66bKG3DU_dHosGml4ZxAAcsMLj8UdXnj2yVr9g>
    <xmx:mhzlYFe1qH3dlNaSal0xOmDkAY-p4JOjRC3JlnixhmsQTHw8qAisBw>
    <xmx:mhzlYIdArCmSpaBbY0bw-9oB3S_L0iQDJg0SE-YkWd-MeVHZqg2FsQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 23:16:37 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 5/9] phy: pistachio-usb: Depend on MIPS || COMPILE_TEST
Date:   Wed,  7 Jul 2021 11:15:48 +0800
Message-Id: <20210707031552.20166-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
References: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

So it will be avilable for generic MIPS kenrel.

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

