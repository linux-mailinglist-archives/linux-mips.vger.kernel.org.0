Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF703B521D
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jun 2021 06:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbhF0FAE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 01:00:04 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:48611 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231159AbhF0FAC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 01:00:02 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1959B5807B8;
        Sun, 27 Jun 2021 00:57:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 27 Jun 2021 00:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=D/gKKIJSLN8Sd
        LCMMyZTPruVUhA56RzKVtRcpwkT3HE=; b=CbC0jLOOUJrKwxTA9B9lfptslTpuP
        qOrKXvOFbsv1o58X0dQBjfOMuhQB3M/LzTmR7nMg9qRwLf7OWYkdDatj8kMC8KKe
        Kp94KjR7A7v/BIYD0kfOw1jlTMGG4VvkEhQ+A6DpqnpiRxDaYhEqhdgLCUb+bP+b
        Dkfec7n6ruwzd/9ahxzboc9UThJcfoB2islIJQiZCIgAarSUFLCMZ05Faja2+Y5j
        FnW5vNSV5Nvi/aAZt9/q6GdMQEHcs51V8SNBoo7CVU+sufFoevLENOzMOG2Vx7/Y
        1BSOhW6u1+qoeFckrMfWkcpoilwUVFmqrWEWrqJlJ3k+19yXaYG0CzEdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=D/gKKIJSLN8SdLCMMyZTPruVUhA56RzKVtRcpwkT3HE=; b=FPnBxpRC
        mexCjznjvWGxOlpxtMV9xFYxIao11HJxxzFAtqcZhnDEDzTr/T7XxTWOREirB0YY
        tRfrCM048cMxJgbakxs5Betl+Ma9IWswFW0G+Vsk4V9RMzDaTHAPMoRVblayru7W
        /ZvL4kDejwQ3slHfDwjis01t6iAdyT9a5rvpy7EbyS4jBSEryLM5/6rtTHubmcUN
        V9VKdhtgLIM16ofqTnbg5xqGB9wglvdADQWNoYGvxOPNWBhzxyjRoNA/WxOuOR/1
        98ztGEzIRAX1Yj5gn4mNl1roYjilm+jp45BLC2pz25U4pAYnpYT2oKnsH77CtvlL
        1msDEzcr0SxDtQ==
X-ME-Sender: <xms:QQXYYAOJdOgzhNFFzXWIZe3vfgN3mZx2bam8xLXh_MElnYVLLYFYmw>
    <xme:QQXYYG8kcd2tguf6KZ1WVrDMegDZIeCXID2iZPSSd2D9bH61kaaYKlHaGTOwUqmtv
    VLSWC8iarEBu7uaa_c>
X-ME-Received: <xmr:QQXYYHSVnL_7KERuoVd_jAq-Es7QHo6LPzPSMAJzrRlQFjfDnoXp6RyboDOgmbpsExcP8xWxBsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehuddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejiefhgfetleekleffud
    ektdehvedujedvgeekkeejfefhhffhtedutefgtdffueenucevlhhushhtvghrufhiiigv
    pedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhm
X-ME-Proxy: <xmx:QgXYYItGxefVzu_40xvPKGDeujcqWzK1z9jCY36M_nhquBffKDweZw>
    <xmx:QgXYYIevx7rlTyRQriQSH9IYiUn6zLveEuYArgO1_BWlRVvs06X6LA>
    <xmx:QgXYYM2iE1IB5ImW2RclwpmoAXdq4j8Uup77FTf2EBePSoE77gp5dQ>
    <xmx:QgXYYJUxpbWwUmrsYH0QU1LuKvsCw3PS81IlW3BD1i-LfeNoL4TW4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 00:57:33 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 9/9] MIPS: Make a alias for pistachio_defconfig
Date:   Sun, 27 Jun 2021 12:56:31 +0800
Message-Id: <20210627045631.2882-10-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For those who miss the old defconfig, make a alias to generic
kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 258234c35a09..9713f8d2fc99 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -563,6 +563,9 @@ sead3micro_defconfig-y		:= micro32r2el_defconfig BOARDS=sead-3
 legacy_defconfigs		+= xilfpga_defconfig
 xilfpga_defconfig-y		:= 32r2el_defconfig BOARDS=xilfpga
 
+legacy_defconfigs		+= pistachio_defconfig
+xilfpga_defconfig-y		:= 32r2el_defconfig BOARDS=marduk
+
 .PHONY: $(legacy_defconfigs)
 $(legacy_defconfigs):
 	$(Q)$(MAKE) -f $(srctree)/Makefile $($@-y)
-- 
2.32.0

