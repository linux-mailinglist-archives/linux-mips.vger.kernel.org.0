Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 864C86C2F72
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjCUKtV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjCUKtS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:18 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A22BDFB
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:08 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 4E4253200C5F;
        Tue, 21 Mar 2023 06:49:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 21 Mar 2023 06:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679395745; x=
        1679482145; bh=rTHY247DFpsXOU4JdgDPbAsMY3eSq8R3BNJj4ZqVXME=; b=O
        IllVAGpdDu2cKQiTf0lW85bVagprih4FfReHA1IGWtAQQ+3aw/B48Uopw1TF2O7W
        C26ysbff1eTXbG3le+w6TJUYFDMlk2b86yaD88nVydMK+k6JRA2wtNKppUA1+ftU
        a2VHK80HJx3slaGLZ864zUVNBBqURHmN2z2bVOu1zcNR6FeJ1jIwx42B0wXk1XVY
        tA36TNIECovVMdf+eKiBlik3HZhVYPAVCbLYYnriEdiFV5SANp3uRQqxppKZ5mCP
        YeLMjbTvebz9dwWpNuWkUXYGtsFSudWhlatdwpdw868A8lqEA1bxKyldbLD8XhOL
        cmXAn4ksqECPNiGkXnHHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679395745; x=
        1679482145; bh=rTHY247DFpsXOU4JdgDPbAsMY3eSq8R3BNJj4ZqVXME=; b=N
        sM/FJuiFe6Lqk2Y9jsySHGpUxzake+CEwHBr/vs0d1NC/hXro+5bCFb1O8WJtvuX
        ADtOKM85xsPKJLzvwIZDNrVNhvPwG00b466ytLPrxYkx2Hz4ZYKn3wO8ZeQwY+DV
        ni9l9sKZU9CRUcoBO6JGaO+sQzP9X40/j384qNApzsp7Jze71vqKFoV00/H0F9mx
        ea/Al+RqWylDB11HWdNng2wz/+MRZK2CuVS9xdv/9D0LLgQAo6mc3nZm8g1mHVAc
        n2TwZJAuCzAAR1DnuXN1TP7V/QK7J3zZpB7MBV+Mly1/6rJuByRQupBhGMSLgLZY
        /dJrvHF7xfS2ES6CNEvTQ==
X-ME-Sender: <xms:oYsZZOGmZrlvs4QEYhuUSEHCeHHSrn_Zu1S16JNmY7mt7TnCYWhGyA>
    <xme:oYsZZPVPBWgxgQkicGoG_EBmhJE1Wo9ch5s5tRIpDrRrDbSj2onbJaBWWsWLRJTsS
    QMAyKr67RCVNMFpWQE>
X-ME-Received: <xmr:oYsZZIKBVTP9BKLxVcrJQNx3VffEHOlrgWMre4hoLT7tS_l6ICyajQtgTTBnlR8FTWBrTdCXBlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:oYsZZIFcfhIgjiv1X7L9nMfYJYlbG3Y1TMTi5-D3bqiAMygYRaOTVg>
    <xmx:oYsZZEUNGcgyxx8Mj93dAaCBCg0Whu--oXCZeBOrDVuuXK8hQnLGeA>
    <xmx:oYsZZLNAGUeFlJANkV0Zj7EGbxQTaym64jvJc3-YlbHmSs-wi2ZdYQ>
    <xmx:oYsZZCzZCekESxccXlzWtq3AY9o8lEnnOIwUAbKHgHltHrf2Rlm7gg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:49:04 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 03/12] MIPS: mips-cm: Check availability of config registers
Date:   Tue, 21 Mar 2023 10:48:43 +0000
Message-Id: <20230321104852.25284-4-jiaxun.yang@flygoat.com>
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

Prevent reading unsupported config register during probing process.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/mips-cm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index b4f7d950c846..3f00788b0871 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -181,11 +181,16 @@ static DEFINE_PER_CPU_ALIGNED(unsigned long, cm_core_lock_flags);
 
 phys_addr_t __mips_cm_phys_base(void)
 {
-	u32 config3 = read_c0_config3();
 	unsigned long cmgcr;
 
 	/* Check the CMGCRBase register is implemented */
-	if (!(config3 & MIPS_CONF3_CMGCR))
+	if (!(read_c0_config() & MIPS_CONF_M))
+		return 0;
+
+	if (!(read_c0_config2() & MIPS_CONF_M))
+		return 0;
+
+	if (!(read_c0_config3() & MIPS_CONF3_CMGCR))
 		return 0;
 
 	/* Read the address from CMGCRBase */
-- 
2.37.1 (Apple Git-137.1)

