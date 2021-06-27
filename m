Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21953B520F
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jun 2021 06:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbhF0E7r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 00:59:47 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:46519 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231266AbhF0E7p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 00:59:45 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id AD1E05807B0;
        Sun, 27 Jun 2021 00:57:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 27 Jun 2021 00:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=E+Q3jJXoaXwDI
        JPG6GplM8tmB+spkJC75M4I54KAlkE=; b=cnEEeFz/v0/wfFsR7voQuxp3u4LLu
        6/8Hb+WTUfPpTdtaCfF/ZIYY9sr1KNBe5l2k0xjsYzY0h3TJjcku1jb7W/bpY9nr
        GubYrLEhxQn4LDNvYu8F/UGK/zdybIHVJ15QoFRZln4dpwVf+/2j+7yVVOKAcS2B
        8DeHbkuUaxev5dO5DStrbkT5MMo/Yq9s57c7oFFiK/mLAVvzMI7ZQXSQ5x0qZ+fY
        b+/VRvSIRyalqQSqOG+dz/Dhjxnhs/fMv8c83OUTI2B8o40nyM33EUCiSSYNThjg
        4W10GD1ETxYBHK75KEwfl39mI55+30rVBRE/2GeXoDGgv/hWERrssJ3Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=E+Q3jJXoaXwDIJPG6GplM8tmB+spkJC75M4I54KAlkE=; b=FvFqOQKg
        phFVA+3VYqh6xsFL9sYPcZBI+cAAiUB9KNdhJJsqHKtPHUhoZfZQSFryDE0/5yMZ
        Mj2DU3MduK4I9r0yz0tZ/pGjt3s5E9zHhx6Da7fWdOiDHvyLc4sEQ+4N9fdvsFb8
        4KjqXxQ8fUguJrBSbIwnWl/pU4Ui3roNxT5HJPhJEgEwZoehC8IBV0wHBHr3c51/
        jOXT3WqQeEeQX36giBGpugcGXCfwZaW7yc4u/Kfay4LYuVVP2eRfUXgMA2xo0vjt
        tiSSu9L+eqM+TvPHKIn+q2Xg0OvDjrglJM0FYllVtLqbrwac+UWN9ECFe7/L8Eaq
        TNblH9qJYnNKbQ==
X-ME-Sender: <xms:MQXYYDF46BXANxfEz_M47gJUxM4iZydnI4O4KFQwntMcujKOfXvISA>
    <xme:MQXYYAVPGcMK7rEEt7VgbUXLy2sKseBpx3VjixbhmcfNxlRrmMP0BFJUrx4ilmfcA
    or8Bm9CoGQXaQ7aAg0>
X-ME-Received: <xmr:MQXYYFJ7wfQhcmY0jolzoSbzfbc4l5Oy-TS----2ZkKU6dg6QlN-6OX8mHnZPwU6LUEQQENIlCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehuddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejiefhgfetleekleffud
    ektdehvedujedvgeekkeejfefhhffhtedutefgtdffueenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhm
X-ME-Proxy: <xmx:MQXYYBGaqBtBMqy5Gq_fFxgejLJhcJyH9_0GJPEFiR5UW5lf7gTQGQ>
    <xmx:MQXYYJWjJEPbcXakXsgK79DuxBxgCTD5b6TYehiksv-k8I2TaO71BA>
    <xmx:MQXYYMMg1AULTheLmU7UyRGcdGS4NNfMnQ7I8UblCePGoTcNBZ384g>
    <xmx:MQXYYCNFf-UowdSHepomlpxf5LDmhm8oWio3d2DzyuMjZhl90tznYw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 00:57:16 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 6/9] pinctrl: pistachio: Make it as a option
Date:   Sun, 27 Jun 2021 12:56:28 +0800
Message-Id: <20210627045631.2882-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

So it will be avilable for generic MIPS kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/pinctrl/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index c2c7e7963ed0..a189f1b3da5c 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -248,12 +248,15 @@ config PINCTRL_SX150X
 	  - 16 bits: sx1509q, sx1506q
 
 config PINCTRL_PISTACHIO
-	def_bool y if MACH_PISTACHIO
+	bool "IMG Pistachio SoC pinctrl driver"
+	depends on MIPS || COMPILE_TEST
 	depends on GPIOLIB
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
 	select OF_GPIO
+    help
+	  This support pinctrl and gpio driver for IMG Pistachio SoC.
 
 config PINCTRL_ST
 	bool
-- 
2.32.0

