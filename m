Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F3C6C2F79
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjCUKt2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbjCUKtZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:25 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02E37DA6
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:11 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 9C15D3200C5E;
        Tue, 21 Mar 2023 06:49:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 21 Mar 2023 06:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679395750; x=
        1679482150; bh=qgAcqWfJH8k4dZH9u5DnU2Q7Vf0M5QmfxHEtvd37dZs=; b=Q
        4FOSQIHb/IXO/z+bOx8QEEEd6zmgze+I5BQzByWKzGM1zGlAvJSwNvgvJnk7lSBH
        G3WwVwAGOQxFv+kFgMQFMej8WMCazKvEeYVk1XJTs56BHizqpPixG78VjuwVwr1E
        uMiWkV5liyAzAVLXK9h98+n1Ra0VsnVs1ZYhhLRld0MNxQY4PK98efpgZcizK78t
        TWVHmTQnH5SQdAibatjDfRyht+7VXLm8wHjF7xX9c1P60/5B0Mb471WNn2wDfX3r
        3XPhQZQxxXUTjxO0l2eKNyf99K3N8dhhlz3qNyHeqS+IuVM0MKIgCdRWzrxuNaKm
        Prum3ST9mxs6iKCIfCfGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679395750; x=
        1679482150; bh=qgAcqWfJH8k4dZH9u5DnU2Q7Vf0M5QmfxHEtvd37dZs=; b=b
        9EqL3Pyri7ynF9amdRejkJ1tZP0y+MBZG8xC1I/snwitDVkKhFlfhmum2kIkXMgC
        F4L83wsicb6ZalWlcD+wayvrnCnMthGvjVEsa2bwHo4Ri873lHqYmd5HCAO9qx94
        ev+3NMmrKyFyxC/zzt9G48wiJKKHZR1XtsEjwycR07S0Mo8sRxdZf0ktSUewvJos
        P2joYY7eur7xMqhHPtKT/tNdwGs2Oza0RFTNM/ZeI3jEL7+SWcBOc2q64Uuu/Hcr
        objwJsO+weeF591cG2B5GFq8eBPNaocDchN7vqFx31jh56jgSHFKtNxDzMJjmVPI
        hrjYvBSV6/hPgRXLU4Aug==
X-ME-Sender: <xms:posZZF_pHKkXHQ5qjLqMKGmhCL_tioplIY9fC4JmAHptawUMBBQbTw>
    <xme:posZZJvThMjJ6eSyyIP0jtlBDWSYFU-rdMSFr1HC5LFINuFZMCia5vzpLoulFEOJJ
    qUxPPBA7OK0e1UXJEI>
X-ME-Received: <xmr:posZZDCz7ypM-UfDItthTnHYy0ulLV3fw6Duxs-OcSJfYwMdphPDmMjxYTAJFAuwPFEWM5POMEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:posZZJfXL7g_gu2SDmjySRtVjsj6Og82HF_YgnzpdB5BJ_904MT09w>
    <xmx:posZZKM5iFVI2FpSUqS9tYdS3cOMWT0XHLwmca9CHFDBgbZROTx9lw>
    <xmx:posZZLmY88t2qu673rSbUzWVEVckW2C-M_xV1BCXqX3IWbztrdXTQg>
    <xmx:posZZHq7-oMqu-fp5jWkk2tv0wfP6pLF-05oPBotSkSEXBxJNYJMaA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:49:09 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 05/12] MIPS: cpu-features: Enable octeon_cache by cpu_type
Date:   Tue, 21 Mar 2023 10:48:45 +0000
Message-Id: <20230321104852.25284-6-jiaxun.yang@flygoat.com>
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

cpu_has_octeon_cache was tied to 0 for generic cpu-features,
whith this generic kernel built for octeon CPU won't boot.

Just enable this flag by cpu_type. It won't hurt orther platforms
because compiler will eliminate the code path on other processors.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/cpu-features.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index c613426b0bfc..51a1737b03d0 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -121,7 +121,24 @@
 #define cpu_has_4k_cache	__opt(MIPS_CPU_4K_CACHE)
 #endif
 #ifndef cpu_has_octeon_cache
-#define cpu_has_octeon_cache	0
+#define cpu_has_octeon_cache						\
+({									\
+	int __res;							\
+									\
+	switch (current_cpu_type()) {					\
+	case CPU_CAVIUM_OCTEON:						\
+	case CPU_CAVIUM_OCTEON_PLUS:					\
+	case CPU_CAVIUM_OCTEON2:					\
+	case CPU_CAVIUM_OCTEON3:					\
+		__res = 1;						\
+		break;							\
+									\
+	default:							\
+		__res = 0;						\
+	}								\
+									\
+	__res;								\
+})
 #endif
 /* Don't override `cpu_has_fpu' to 1 or the "nofpu" option won't work.  */
 #ifndef cpu_has_fpu
-- 
2.37.1 (Apple Git-137.1)

