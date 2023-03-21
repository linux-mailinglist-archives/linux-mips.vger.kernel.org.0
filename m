Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D09F36C2F80
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjCUKuE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjCUKth (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:37 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D5A1351D
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:22 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 8827D3200C5B;
        Tue, 21 Mar 2023 06:49:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 21 Mar 2023 06:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679395761; x=
        1679482161; bh=sQsmx110mtSj7A/N82ZmdQXyO3YkTdBWoznmV2z2Brc=; b=P
        wizahJHOaC54hU6i9jMrFHBoEcHV3i2gmi3O6BonwRO/CkEZd/DK4XhNm387HGR6
        6HjtMc9WkPD4C9YdNT2ZhKw7IoRG2gyp2jOn2eZlYLyaMm7EoHLYAjoeTlQ8gm5K
        bM2LYfgsgWAOYB8+ZeCyc/18eNgbLsYZhcuQNvOk6nH2c1j249G2fTcKO3SoR8tM
        9qN5c4tv0ac1oMtqFgMl8Ct7VxepUtZGJo2Q8KsHdfdyLaJC8VV4nnran0S86R7I
        WEJVzV7d+Y7kzzfepVJG8jRv2wW5Af/0LCxaiEhNeWRZqdj/j4mvNqNM46OmqUKW
        8wi2M7+mbbFpAsRm72nMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679395761; x=
        1679482161; bh=sQsmx110mtSj7A/N82ZmdQXyO3YkTdBWoznmV2z2Brc=; b=B
        1ff7hK0YZJazltBFlM79vd2amZ3n29CMcDi89EwtgcRtWsTnT0Swg/WLleZ/p/mQ
        v0SM6fhutwK5/ZttR6j2YRv7uONi+puxLAtc2DkxJdhkoxOO7y6ezi8c33MBaw4I
        jQPjKi4OtVBMT+lM5tnqREcwB2R4808z0nxltj16dUQKx9gTKqb16a8ohEuOuiFs
        pwrJQDNinMD3yGFdJhzVcsJPMOSjix0OEGbmSVKbsHAMueW1jsnmC8oi4/w4Huly
        u/1QBHGdzoHRAhVA93OATkOU6UThez28gxk1i5DNUR3sAEQRjLLLS/FcWNcqXGbn
        Y3EWz7qd/Ow3VUoX+4bPQ==
X-ME-Sender: <xms:sYsZZLLJ0EYmQdPJORvmNadoC67gvPikz5R3stV0i8gqFhzaOwWDlw>
    <xme:sYsZZPLoKVBlmt7R6AJKUMxndRHSempix-rie-eqs0468eKcxK4KbpbfaVLFS7Akd
    B7RPVCBtqODlR5soH8>
X-ME-Received: <xmr:sYsZZDvzmVu3DI2XzDFQcw8rl1yAPnW2mA7daVlY96zlao4-RjE2s5o1TVQEwkcCpRhnxUQoIo4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepfeenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:sYsZZEb-WvrYZBIdLpG-tcW4WHnCkB_2UWL6DQiQIFPQQkPK8pMCwA>
    <xmx:sYsZZCbs_LEUKqLbF0ob-IKgCiymA_gNThy8zvuCWKtxrHLsgl5vIA>
    <xmx:sYsZZIBMySy7GJrxSjAVOJFTp-SD0v-c-USHJJvV_6uFSSDQ6ElCNg>
    <xmx:sYsZZJXtAZPpFqirjjwtVixDIbHMN7CZSLUc-KGoK3Ye_e6FXszIJg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:49:20 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 10/12] MIPS: Octeon: Disable CVMSEG by default on other platforms
Date:   Tue, 21 Mar 2023 10:48:50 +0000
Message-Id: <20230321104852.25284-11-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
References: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

QEMU can't emulate CVMSEG on generic platform for now.

Just disable it by default.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/cavium-octeon/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kconfig
index c1899f109e19..450e979ef5d9 100644
--- a/arch/mips/cavium-octeon/Kconfig
+++ b/arch/mips/cavium-octeon/Kconfig
@@ -14,7 +14,8 @@ config CAVIUM_CN63XXP1
 config CAVIUM_OCTEON_CVMSEG_SIZE
 	int "Number of L1 cache lines reserved for CVMSEG memory"
 	range 0 54
-	default 1
+	default 0 if !CAVIUM_OCTEON_SOC
+	default 1 if CAVIUM_OCTEON_SOC
 	help
 	  CVMSEG LM is a segment that accesses portions of the dcache as a
 	  local memory; the larger CVMSEG is, the smaller the cache is.
-- 
2.37.1 (Apple Git-137.1)

