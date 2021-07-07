Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEE63BE17F
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jul 2021 05:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhGGDTu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Jul 2021 23:19:50 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:37319 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230250AbhGGDTm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Jul 2021 23:19:42 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id D9455580452;
        Tue,  6 Jul 2021 23:17:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 06 Jul 2021 23:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=juuqFtaoRobQQ
        sYNJO/H9QK58gSnRD3PdI9BHJOIPdI=; b=UnNTlUns4nF4Sm60H29+2nOnMa8aB
        ujFlja4gyim5mdIgthZtrVM82T/Au2CQGWApBlNEJVxeJ6fOzwXnN/6j6vbpmlF0
        ZjrGCn9+gF7Jq6NdIDxwb+nvOdd40FVi7m30DcsX30oFeSxz45iBSVR6n8HRFU5b
        1xGL7oCXmc9eZDFRRStJ4Jlu1yTeVt7mnUFHuW4RibHH6iMX4QYR3emKcor1szaV
        UJjNvHdxsQqV3C2I6CC+wFS0ABxabPUDm20q3N8mXFbmT1bZrSP4YVQ55Gjm0dH2
        Y9w79boLX2LGoOzN2RejXiHE9IpkNqdH7O27iG++RbYoMNTXK7AVDj5pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=juuqFtaoRobQQsYNJO/H9QK58gSnRD3PdI9BHJOIPdI=; b=V38zsJJk
        r17GENdNywIXRqq2tpIgAqydXMi3A1dalLoYL+q3/D9XTiGF7phRMZu3nPK4O9Bm
        dADjTgDFvjFXTPO2LfJ/qWCdmwq5FQNFFqny1zGc3Sz1YzrgFLMiQ/9TLKKqfxIW
        NPQeufoGPgpZOEoNhhAQx0pDENrFiiLu3OhUWSqvUeyFNR+y4n3mM9imQBKzvcCs
        caUHsm3InkJ50si+LjQh5BONpwJEBCHRj8xBGhXHdKyNeHnEg5E9RBaGKM58AWnN
        /795qgBpvWvUNrvvuQR5gxJOYrk20CYIV569hxInMYqUksaL6FUOPJGptoClTSi+
        dQGXyOQeGHnlQw==
X-ME-Sender: <xms:rhzlYKP4kZqMi1sJLhFXdbLCnlsiqjR_6ZVWtXEljDOV-3o4Rvfi0A>
    <xme:rhzlYI9rw83llC2Aft_wTEPlzFJ-P7ahORIqn8JZVwF1j0Y1OpmuA8Eanzdij0YKH
    QnA9nOuKeNBNiNvObw>
X-ME-Received: <xmr:rhzlYBSeC1D_MwovPp0paPrzJZYBxs1x_t8ho0b54tVD1Vt6uABeHkLYFSWBIvOGyc9ZnRPmi6s8BiuxSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:rhzlYKuyS9yzXybC25Igtk2NRv6mq3ybw5gXSjsY98ye9rrKshsO7g>
    <xmx:rhzlYCd5qArvZXvXDWQK64Csb3kIowmGzoY9sGGM9FZG8Ke0Bp9Ueg>
    <xmx:rhzlYO07b-mMZBqWpaVUQufe0W_jAoO0eean7kCdMXQeP083eNB40Q>
    <xmx:rhzlYDWjyxu7iGsnrcLm2X2vvnZG61DrFKFOQQMlGFACDPEcIEM4jQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 23:16:57 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 9/9] MIPS: Make a alias for pistachio_defconfig
Date:   Wed,  7 Jul 2021 11:15:52 +0800
Message-Id: <20210707031552.20166-10-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
References: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
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

