Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968823B51FA
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jun 2021 06:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhF0E7Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 00:59:24 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:36035 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231157AbhF0E7X (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 00:59:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id E5D4C5807B0;
        Sun, 27 Jun 2021 00:56:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 27 Jun 2021 00:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=1LK9TbzR4mbFW
        wxa2DMjASOGjEHNStV5ARumpu+hHTQ=; b=c7OYYcw14+8aj+BL4UHqnK1GLyHT4
        DKHkGed2O4yKcp2q1t+BK44w0CCXb0rkdcMUug5JL7OeiFCHVbnDuA+SMlPKvZtJ
        7XdrJRQGW1LR0N1TBmNd7DJfQlmyl+oROF6X4pyy0YpvfS8G6LN13Y2w3sgkTqBv
        6GpS0YQw2kff7N3SBG6RZrrQw6fk1CUx4xXEtgG0G8JO2/Teh6RyZky8pJqXWJM+
        xEPqZP4MLe/MxmU0iIyzOf1JXyRCFweDjvFGTcq4azBgGTa3LmbDIFUafl7fAX/m
        s0konHJRpSp8WocrHJqdud9rl+1JB9n7N+pIOkEjU3hC4qIcXUl4hA+/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=1LK9TbzR4mbFWwxa2DMjASOGjEHNStV5ARumpu+hHTQ=; b=EvmWXRrL
        XDCwztrd58xOPXzY+1DkSW18tdlUqiMD3Mr5tAtZjB1/vFNX/hvMW6N93+2UOVLV
        oekJQtWnWleCZQypUIYV8Mr7jgpSx6oGC0oV3igqn0T8zEqmbBRcDONQCXNKOyyl
        UtQvLpqCbgJ6Ujuf782JZOU8afAwnFuk8PkToV8GLat+3fJ8vZkaUWxC996vMR6c
        6Z49oa5RHqXKvYbmjDT2G3qWGgdzXbITnsGobFgqspC+D8hz60oL1BvedM3XC3rU
        DxIC5u6485meCtk9Kh5DFqQ1TBfjnZL6Undch9F4nOQ9cOc6w3CIXyqRw7pCikSJ
        p0rrB5PphsmpfQ==
X-ME-Sender: <xms:GwXYYGSyjGMXjwzrh4a-JNGwn46crLuKpvXVFSPjyxgCW31zvDPM8g>
    <xme:GwXYYLzoUz8Q2h8BST9mf7UrCMeHaaghVN2j6s7nzwF1Q3JGUG4u2T9q2nI8UuzpN
    QryMKIxrMwRBwpM5Og>
X-ME-Received: <xmr:GwXYYD1Yg-aRG3qIn0PZHmeQZ_8nbw2HwjpQQpC6jN9LaE-poPusDGziboDVIvoIqi2bfAqK4Oo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehuddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejiefhgfetleekleffud
    ektdehvedujedvgeekkeejfefhhffhtedutefgtdffueenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhm
X-ME-Proxy: <xmx:GwXYYCDMUqolgxV28VQXn6eilaXxS7vt6eG5oI-466tqc_TXHq05YA>
    <xmx:GwXYYPhtaRJ_so5iuxXA0eYF84PlfnY7X9JJYJa93aY0E8gOR9oqOQ>
    <xmx:GwXYYOo-N4Fu61MHyihDbMTU8sA8oIWhKOXQzPC1Iwt-hHpxYfvVcw>
    <xmx:GwXYYEZuZ-QP8w0veIXWYdE3tdUaM3y_Kx2ZcH398AWlMAgBtU3anQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 00:56:54 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/9] MIPS: DTS: Pistachio add missing cpc and cdmm
Date:   Sun, 27 Jun 2021 12:56:24 +0800
Message-Id: <20210627045631.2882-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CPC and CDMM addresses are adjustable and we should tell kernel
how to place them in devicetree.

Note that MACH_PISTACHIO code hardcoded CDMM base to 0x1bdd0000,
however it will collide with GIC address range. As we don't have
any CDMM device on this platform it won't be a problem.
I found another spare range, 0x1bdf0000~0x1be00000 to place CDMM
instead.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/img/pistachio.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/boot/dts/img/pistachio.dtsi b/arch/mips/boot/dts/img/pistachio.dtsi
index dc3b7909de73..b1db8b8f446f 100644
--- a/arch/mips/boot/dts/img/pistachio.dtsi
+++ b/arch/mips/boot/dts/img/pistachio.dtsi
@@ -900,6 +900,16 @@ timer {
 		};
 	};
 
+	cpc: cpc@1bde0000 {
+		compatible = "mti,mips-cpc";
+		reg = <0x1bde0000 0x10000>;
+	};
+
+	cdmm: cdmm@1bdf0000 {
+		compatible = "mti,mips-cdmm";
+		reg = <0x1bdf0000 0x10000>;
+	};
+
 	usb_phy: usb-phy {
 		compatible = "img,pistachio-usb-phy";
 		clocks = <&clk_core CLK_USB_PHY>;
-- 
2.32.0

