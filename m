Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 121086DBF81
	for <lists+linux-mips@lfdr.de>; Sun,  9 Apr 2023 12:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjDIKn0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Apr 2023 06:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjDIKnZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Apr 2023 06:43:25 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAF44681
        for <linux-mips@vger.kernel.org>; Sun,  9 Apr 2023 03:43:24 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 50E2F320090F;
        Sun,  9 Apr 2023 06:43:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 09 Apr 2023 06:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1681037002; x=
        1681123402; bh=oJIJyJ+bdZ/ciPnkRGoLTZBvw3GeSSYm0yUguon+n48=; b=k
        MiFA/t0iI4l6ecHzSAWmdcu1+NsqTz87RaeDXSr/7V/Bb88VTgtLmndFsDDxV40f
        sWCc/4AkHk4CNCnnQcdm8adiaCZHHmL+tNtvOgEFL6l9qOgCmAHgGsHrfzkMU5O2
        meiar0Y9EFkPD9HXbqCgtF6Xb9o7y8wFZjbZ8acpvVPJ9d+PUm39SGDQ06/30W0d
        sbiJ6pBT7o5t8YSbUANNI7rohOI1Sb4Ccfok6go4N7wuAqTe1NeFXBQ7zdq+fyts
        LxEho5D5HwJaPeQGz/ef/zQP7sBlNaHfs+/7poXv1LDaUboRotFJGWj2130Mu3mi
        QZcS9iaZiYGRoug1H1dMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1681037002; x=
        1681123402; bh=oJIJyJ+bdZ/ciPnkRGoLTZBvw3GeSSYm0yUguon+n48=; b=Q
        50n3IPtP+Uu4g5VyUb6fjrQZcT6EXpE8UHS/ESmp2BPrjGS0AV4r90TGHplBizsj
        J0VJN+gpJB7LVBmQgLxGyXOGW0znIRsT9g+sIC0NV6SCmr02Ik4uinZmgpC+/nE2
        9jAjC0QdHTCiVh7JgUQQWDIC+lkZji45GqYhYXayr2n/qdj0GW4lvfw1V17Gc9/Q
        lTfh7kQQOdT+nJ/2z7CUXJK1o+n8mW+/5r4RpF0to744yTc9kC6IDWsCnfgmYYlG
        SqT4RGDRDTZtfRHD36lVVWmjjEzeSb/TpjKtfe+2d5kSWOlf/Jo9El/XOLDEROw1
        YZ+Ep+Volw5JQ5lQ2V7zA==
X-ME-Sender: <xms:ypYyZAuV3Hc_KOrKME0jQMVprAoeCWx-VIFtpafYKAwEO_k9cKKzsA>
    <xme:ypYyZNdz7W6KYejBamrocn9NbqkPJYTCt967Ck35HzYoZ2OAVd65WEruUyi2jppm8
    E_qKnNYIeKGHCvkkec>
X-ME-Received: <xmr:ypYyZLzUwcRvnQYR5HBYStp3BxR3GGjQ1An2X9dI3CeuInfpcgo792czsHQp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdektddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:ypYyZDPo21Vy9VJIP40mLUuuS9K9cK3kBkVW4MGYvu0sbe3T2jPpvA>
    <xmx:ypYyZA90h6Yld4IWHu_o_TNFnBIQ-tTqCkb7uifxST-UShVFNJat7Q>
    <xmx:ypYyZLWArBq2n2BqWggKL8TEVexw7P0rRv2TN4p_0Vbl2nAmijXWlA>
    <xmx:ypYyZEbnFKeb90NQytXJk__VbkeSGU-gtS26ed8YgAzTT8hOvfiX5w>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Apr 2023 06:43:21 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/8] MIPS: Set ISA level for MSA control reg helpers
Date:   Sun,  9 Apr 2023 11:43:03 +0100
Message-Id: <20230409104309.13887-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MSA instructions requires at least Release 2 to be available.
Setting ISA level here to make GAS happy when building kernel
for earlier CPUs.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/msa.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/msa.h b/arch/mips/include/asm/msa.h
index a9ca57e3f780..e13e538a7889 100644
--- a/arch/mips/include/asm/msa.h
+++ b/arch/mips/include/asm/msa.h
@@ -175,10 +175,12 @@ static inline void init_msa_upper(void)
 #define _ASM_UNSET_CTCMSA ".purgem ctcmsa\n\t"
 #else /* CONFIG_AS_HAS_MSA */
 #define _ASM_SET_CFCMSA						\
+		".set\t"MIPS_ISA_LEVEL"\n\t"			\
 		".set\tfp=64\n\t"				\
 		".set\tmsa\n\t"
 #define _ASM_UNSET_CFCMSA
 #define _ASM_SET_CTCMSA						\
+		".set\t"MIPS_ISA_LEVEL"\n\t"			\
 		".set\tfp=64\n\t"				\
 		".set\tmsa\n\t"
 #define _ASM_UNSET_CTCMSA
-- 
2.39.2 (Apple Git-143)

