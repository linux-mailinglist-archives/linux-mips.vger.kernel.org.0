Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE183D0710
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jul 2021 05:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhGUCY7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Jul 2021 22:24:59 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:52113 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231426AbhGUCWM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Jul 2021 22:22:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 722CE2B004FC;
        Tue, 20 Jul 2021 23:02:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 20 Jul 2021 23:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=juuqFtaoRobQQ
        sYNJO/H9QK58gSnRD3PdI9BHJOIPdI=; b=N3V4TmMuagRkUZ8V5vQ0mdpd46Zzb
        yYWMtJKFJoojLwgSATkjuDZ3ekBCPfMH23gt2FqRXDuimT8sqBjuG6jPvovxKurG
        W/QB5TNCNX+X88P5piqPckJn6UaZNHo81jj/8dbjO3ExyrB5h3p0uO9Qluic9Vag
        2qjNoD3as4UMqbRRjwxiDcpbJBudomKkx4CyvQkteS03oTjzeY4adVxdXm67Q0r9
        c71xuF5lGGz+AVBdIjoB1Yy14UcrrbWafJ9tZd3sRx6pE6NiebZADfrjE76yy6M+
        mKee7YoF3afZSv+vy48SLb+YBoDIp3i5M71tTvohoN4EEWUKUZVL9QuIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=juuqFtaoRobQQsYNJO/H9QK58gSnRD3PdI9BHJOIPdI=; b=Ah7eMR7f
        DbcWHT/5QGSJCGVe1cyzMPCMLZTDS5DmJhrIvemBcakIffHvaVy1HNpFztTzntjr
        rouvpfgk9k7R4ONIoD7luqJbyqD+eY8FKjDilm9RTGi4A96wH8kYG1sWSQ2xNBmp
        Pd6zDis4D+xEzjMTzF4ZispFlSSukqVJDX/ShQGmwqHcUqTvTSVOZW4ueHahfy7N
        u+FS8bC20Y5Un5ddX8M552NXwbojEgrRBuNuUv9zhjEEY26Di+jRBM2nKppKg0sD
        N6KVuwV+o3FXPoagtXDsY499iV1pLQmZPknDq81rgjuCJiLHJRWzYdXxypcJ1hav
        Cl593vFSkoHnuA==
X-ME-Sender: <xms:WI73YH5un-vJVw7sFD3QrpHhSSXmo6ySkWnZsZneFaPyr0LRHJnkbQ>
    <xme:WI73YM5bRfjwcMO7Il36rlfv2iDSEfaJ9yG7L9ceVLjzGH90gbvHHPjFP8HEIcdtG
    a2jDukyv7rKrMau8t0>
X-ME-Received: <xmr:WI73YOeCS0MAQkpxpW6wePjHoE0hj4BEZvjOwQ69UmHXuL8B3O23c_sVPGSmRkJY-S40PGeRgS4S>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeeihffgteelkeelffduke
    dtheevudejvdegkeekjeefhffhhfetudetgfdtffeunecuvehluhhsthgvrhfuihiivgep
    udenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:WY73YIKymcKrByOFVQ7T_4Wvr_LvzbI6A6GGjEGmuzOWltq85wJuag>
    <xmx:WY73YLKR7XlsU12E0BojPWj_pmWnyQ5o8zKpNsZPENpaQ9Gh-f9wag>
    <xmx:WY73YByRC4jhYajC3l3coqO_dzeMrAwI-RM2IBqN2Kx3a5I6cra_ZQ>
    <xmx:WY73YID0gyUfaSUGCoo1JT5tohEig7qivS52czNkXCJaVmyIdl5dZogTyl0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 23:02:44 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 9/9] MIPS: Make a alias for pistachio_defconfig
Date:   Wed, 21 Jul 2021 11:01:34 +0800
Message-Id: <20210721030134.10562-10-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
References: <20210721030134.10562-1-jiaxun.yang@flygoat.com>
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

