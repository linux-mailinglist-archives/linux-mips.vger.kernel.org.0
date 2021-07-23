Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB183D31CA
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jul 2021 04:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbhGWBqV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jul 2021 21:46:21 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:48897 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233431AbhGWBqQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 21:46:16 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9DE765808F8;
        Thu, 22 Jul 2021 22:26:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 22 Jul 2021 22:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=juuqFtaoRobQQ
        sYNJO/H9QK58gSnRD3PdI9BHJOIPdI=; b=WD+/CNOL4Tj8cOY3rCwkLPprvpwv4
        F9/jhl/8RPxwuwKMp/9H0q6TktLhnvIpc0OG+QNrImnB2m+4LqdphOcqwqHZOYqm
        URtcHzbSlTPqDpTOpXW+19LUFB21rT/akKPIGxYew/U5jrSb+pwXluhoHSobSzsL
        lH/9bP+cEBGO1aWNbrpPY/ATq/sKLCrtXfKlpGurolQryuWxZb+jWQ5UhcSxyNZJ
        6C6Egtmdfr9mMPN4QidCTGjjk7TBwg/g6QBZwVRaMYu8I00XgAt8WdqFfDLvRx02
        7aayw95iT2xs7MMHvQtFxGrTALTiUfBDkLG/NNMnXvHB6QXFShKiPqN3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=juuqFtaoRobQQsYNJO/H9QK58gSnRD3PdI9BHJOIPdI=; b=Q29a+WcP
        OJavTcyfz8HR53GEm2PkFci2iTe+umbHt0JGc2C1rjlM/A85jW04/t2I4Uia7kPe
        s1fwGuGh7pFlFT8sgp3mp8awZUp1KsHsT6tmycdIW0s7+mn79YEIRW2qPNjdTJzI
        OI1z6iLaHJz8ugcMBPYx+2hSojn90cN92abYoW+/CELcg2eQhguYToVCUNtt6nQp
        Nt+rFTQGZwbfLJrqzucVWkLDKp9wgBKpdgwnT6JN+eJUeL8WCcowREFrhj+rjB0g
        tmuX9tHR8+nBPB4XmOepIbUrva4X+26nW5kNAi3G/VKZdA8Hh+umUpV4hUoWxUrE
        hJ5ajzGvF6Copg==
X-ME-Sender: <xms:6ij6YGnecj1OGVZ3-n-Du0Qjip82Ux-uSRW2trFzgv3PIO8XkdgmSw>
    <xme:6ij6YN0kfbziA9gshifFLPm2GLyo99ptn554BHL_2b8I2ORjeekAOce7zXD0MsrUt
    F-BPgv0IOnOegCnG5Q>
X-ME-Received: <xmr:6ij6YEqYg0k1TLefHX0abE2Py6kQyJwNdz6igHrgjiaJapGz79UOVBQaCfYAwEi1dkHy5ZVZQHdB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    geenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:6ij6YKm_9Vz8zS1GGm46TE-5-XwnhZTiS7YKbkr13i6gOGGlihKHEA>
    <xmx:6ij6YE015Nht7OrqP2JinJtlKz9KAgfEGy2KN_Xcj0B1fSAh8Uim1w>
    <xmx:6ij6YBt88MpoEZZ52gVIZRBumkYca8Il7zBhnzPno-Ew0Rbia-qf1Q>
    <xmx:6ij6YNu0pnF_JshIOUkh1KYwS27jVY1yExIIGCwM0LeyrGkVq8rqLw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 22:26:45 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v4 9/9] MIPS: Make a alias for pistachio_defconfig
Date:   Fri, 23 Jul 2021 10:25:43 +0800
Message-Id: <20210723022543.4095-10-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For those who miss the old defconfig, make a alias to generic
kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Fix typo 'xilfpga
---
 arch/mips/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 258234c35a09..c299c6ae91af 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -563,6 +563,9 @@ sead3micro_defconfig-y		:= micro32r2el_defconfig BOARDS=sead-3
 legacy_defconfigs		+= xilfpga_defconfig
 xilfpga_defconfig-y		:= 32r2el_defconfig BOARDS=xilfpga
 
+legacy_defconfigs		+= pistachio_defconfig
+pistachio_defconfig-y		:= 32r2el_defconfig BOARDS=marduk
+
 .PHONY: $(legacy_defconfigs)
 $(legacy_defconfigs):
 	$(Q)$(MAKE) -f $(srctree)/Makefile $($@-y)
-- 
2.32.0

