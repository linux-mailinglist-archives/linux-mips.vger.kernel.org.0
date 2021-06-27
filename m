Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217233B5205
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jun 2021 06:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhF0E7e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 00:59:34 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:48611 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231216AbhF0E7e (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 00:59:34 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 487825807B0;
        Sun, 27 Jun 2021 00:57:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 27 Jun 2021 00:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=GAnaSXIS2U9Oo
        L6n9RdfOWXq51u5AS/yAPKDVJYSO1k=; b=EJSqC0Sx1pLhayfz1nXDdLgX5f1l/
        PK5xNYuepnlZVL4C/eI9rgvhzfWE88dPAcb2R7ImzaFxWFhT7mw0qJkgHQhPLbeY
        2A1tEq0oqQNqTlksmf/l+UXKdrbKckmKe9jqyit1qSR2AJXgb7v8F3U44KNcGrB7
        uZ+bGmn35R8maXMgjy/6nA0Gns4Hs5LAY8vnd6J69UCwKWu+4095KBVNeoGqj4fS
        J2ptgGjaBE4VufK7MaI/XOA6h598N2SFUafFB8FtBCbM1/xgcPzwNvW3A2w4BV90
        cqp+wKd3w97Yy0unnrefRLmu8RNyfZ2bYAe87aDNu5MooCXwEzAsdSoJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=GAnaSXIS2U9OoL6n9RdfOWXq51u5AS/yAPKDVJYSO1k=; b=RyBiLOm0
        4zfwfW9/OjEO9PwL9z3Rr/B/YlcvdDwsAX371MJvoOiatLTHtRtNE6qxezZ9uBZE
        m7BdZ6O8jFK+Oqu4zNJW9E6fHzZkcqtegPb55GZVarp4RHi0YZ7NKA4wxLPT9eAt
        ZWIcmc8jHyYD/2IN8x+g/Tl5w3Ub7Iu4vP/iueY9WClJXc7fwcBsyw3XkO/eesGv
        Q6+72KqhXSRR0Yg6KeknWZM8vDKKgMqbLb3M+6hprwdxurwJduwMy5/n+AeJDTlJ
        HWFjKUbal0k4tN4gqILyhF+Try7oAlDvmk/L0pZkm+6oVKYrrz4c7GD1FrXGoaJJ
        YM9RKU81TxwRdA==
X-ME-Sender: <xms:JgXYYAXz7UFHan8Hm9D5sPZM4vyEQonDbp5duSXWcPyYMznuHGAp5Q>
    <xme:JgXYYEkTOYEh6zcwCEORarZC8C-wLEYepn4NFLqv6rQuoW3ztJ1xL7eAawqKgJTly
    zT-hEox9v9NpvRyW4s>
X-ME-Received: <xmr:JgXYYEYkTVkBpz9piNQ403w5j7x_bki0thLEAj0uG0w_QLHbyxzKgvxBOgOgRScHOdbSOTC37oc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehuddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejiefhgfetleekleffud
    ektdehvedujedvgeekkeejfefhhffhtedutefgtdffueenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhm
X-ME-Proxy: <xmx:JgXYYPXB2r1qm--xrjw00r_WZ3ilZsA4VxhZMp_T5cqE4PR_t2mIIA>
    <xmx:JgXYYKl3huAd84xquF0DtPpjwjXa5KoC2c_keyEQim64SsHIyyZrhw>
    <xmx:JgXYYEdldcc7jJG5q34MSlgrgdTfz6VlFungxg96-ZDWQNhBSc6DHg>
    <xmx:JgXYYDdGDjg3qUJLUn5pHhiS5UOyfDxTZGi3XugOtAlKVjWMlrnlOw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 00:57:05 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 4/9] clocksource/drivers/pistachio: Make it seletable for MIPS
Date:   Sun, 27 Jun 2021 12:56:26 +0800
Message-Id: <20210627045631.2882-5-jiaxun.yang@flygoat.com>
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
 drivers/clocksource/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 39aa21d01e05..58ad7af8c673 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -234,8 +234,9 @@ config CLKSRC_LPC32XX
 	  Support for the LPC32XX clocksource.
 
 config CLKSRC_PISTACHIO
-	bool "Clocksource for Pistachio SoC" if COMPILE_TEST
+	bool "Clocksource for Pistachio SoC"
 	depends on HAS_IOMEM
+	depends on MIPS || COMPILE_TEST
 	select TIMER_OF
 	help
 	  Enables the clocksource for the Pistachio SoC.
-- 
2.32.0

