Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FA03B520A
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jun 2021 06:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhF0E7m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 00:59:42 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:48177 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231234AbhF0E7j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 00:59:39 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 083655807B0;
        Sun, 27 Jun 2021 00:57:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 27 Jun 2021 00:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=fK+K0d08qIRtz
        I5lRyrah+khLjr9G35dqtzXmEd/ZSQ=; b=q1C+VCGPHxnUMDH7Au9LpvmCWsxAS
        t22/zr5WL7pdgGAa4ntSZxSLvPMcWwpoCpgXgN4iQnxog/66vg3SK3EBbBFNFNB9
        HGqXRBRMANlsF//xeyxkNCnyFQa8yzMHx3R6P9/E6x5m21y31pIvj9ylUOcjBLbj
        dYJO9RTdJ/on72O6hoAuT85zUhPPVzIB9Kl6ttCoGkuQBc6OlBD6+PtyTkyfYeyD
        jbOeKJm64CQLlwP79g0Jb9Mv6FJMH9H544bis18QEEE8r53TxwgWBL3mOpQ1drNH
        Asf20BHnXik3XS8yZqyBvGyimUhrMOVGHCeX2MLH5ecw1swZkIcBr/ndQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=fK+K0d08qIRtzI5lRyrah+khLjr9G35dqtzXmEd/ZSQ=; b=dQbfSmaz
        MSCszFGb7Ix41sXtvwQRkEO8qv4s79xfggeDi7pz4OAiVbFfARMu78h7JoJQ7/rn
        bhGgDa0a1KQUv8ytnPlFihYJoDBLBd+2kpdLcxYyrA+lWSfN2WCgl9SMxDVxWnCO
        0sE0yZRvyEmXgP4CJZQLmLnyuQDpvRXxQwx0Xuu+7yKmX88RkSIGyrVGLRmr4rfG
        8YUJ+Me/a24fLNrfwwLyn8FqpXZ2a1ooDaGnNCjKI8srhxTNgpKK0mBnUtxF2x41
        pnDjyxRhFp0LC2aKaKWBn8hLKEmVrzVw6eQ0x//PTHmDa1B269w7OtfuRqmb7pUp
        EbcLEPGNAetRFw==
X-ME-Sender: <xms:KwXYYC-ptONTUJFqAfJK0_n7ioKefq_0AimLM_gHpW1ZeGVdsjutCA>
    <xme:KwXYYCtfNkXvN4XQlPwknRmr-i_8EZHP3lJ7-jvnHLZs8_d6QNPoOgvvtm3FQ4yIl
    nECDWx-woU39hxXyjo>
X-ME-Received: <xmr:KwXYYIB_q054hyB1A_psG8b8TcBCN52gLRoC89oLwmSdNdHLJVf0FIrPttX7wBOI6dO1oNdDBLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehuddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejiefhgfetleekleffud
    ektdehvedujedvgeekkeejfefhhffhtedutefgtdffueenucevlhhushhtvghrufhiiigv
    pedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhm
X-ME-Proxy: <xmx:KwXYYKe1dWKs_wq-BEgmDKlqW8fT8zA3XIyxRWGafqqUMw9LB5ZY5A>
    <xmx:KwXYYHMmijFehfSlKa5cvoCai1xLUM_9vB9VDd9jK0nvuTFTcVRVkQ>
    <xmx:KwXYYElNSONRcBq_qG6W7B0yk-zMfTBRSzXixLNpfgJ_ZXKcyjJOwQ>
    <xmx:LAXYYIE748Tt9PbSZ4RjfOdL2VXPtFF1iJB-X7lJf1MhgAJz4h8m1A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 00:57:10 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 5/9] phy: pistachio-usb: Depend on MIPS || COMPILE_TEST
Date:   Sun, 27 Jun 2021 12:56:27 +0800
Message-Id: <20210627045631.2882-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
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

