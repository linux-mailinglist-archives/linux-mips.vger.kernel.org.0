Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76BA26AACE9
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjCDWPm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjCDWPl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:41 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6459913D4C
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:40 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id D06005C00A3;
        Sat,  4 Mar 2023 17:15:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 04 Mar 2023 17:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968139; x=
        1678054539; bh=xKLtOb+OCG0wlvXXdSELiGL5SM7bkhu1Ggfd/j2VE7s=; b=d
        Mt5t2CxBrlPJ9bUG/AkiVJPvJ4aQ7q7Z+lZyLaa7pvsvNgYp0MeUUlsY3MT9VLSQ
        XRuLYt6zMkxOsKWkv0vDJ1BER13c+2OmUWDxntq95tMymtBad6u56H3xzTV8xtH5
        QnM+OqvR9BQPuDFQg66dUkqjZXoLuQhbbfQJYdrZMWPPnsp5nWRg3IsoNkfp0jQZ
        XKhTjJm68Yv8eMuEL6+Jr1UfN8jcwX7iPPcmoLQEMJIEipY1z84aXwJVJJiI9VSb
        qgw5Kx5FEU2ahiaFKGb9vZKmsVKLzCa7tmISai4CAzlrtNgBx+0eV/ArshiXdUJx
        5hl2+vkXavsGTHX9KfdMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968139; x=
        1678054539; bh=xKLtOb+OCG0wlvXXdSELiGL5SM7bkhu1Ggfd/j2VE7s=; b=C
        ZVy6ezKfq48tgUac+kX38vuWypYmq8RRNdPiPNr5iqtionhJHUM4MZDE8h4cOGN/
        4Mj7AjPMLFCgyau37DJHtQzJ1VijPnFQYMikgS8FMDtG0ws71QQUKqKLtBLM+7Rg
        YkMoICH4bwYc0Us99fQH+HoPwjqp6+6UxDBKcCnxtHxwYALJGmrjJ3MwCC6uirgt
        oPdv2CHwvDqDMTJkIpiAlFRclWbn7dQ6UEPfunrpHLbk5Bw9ni9f91FPNVCG67ly
        tt8WkpVlqlma1EYaPo3rczphA9LvSHqOimT4fRP9zGUgM97DL8u7lU8AVAGHtOB1
        5uqZXp0Mrw29zEDVz4QFw==
X-ME-Sender: <xms:C8MDZLSjm8E1IVDy0pEkBi1fZYYr90GTJXRLn_9WXzSy2lyUoqi7eg>
    <xme:C8MDZMyHPo6dHtFBOPwNb6G2CilwEoAjYmYJm2mj54p4vYgesFgZ7l5eHosPGjYlo
    CD7-Psqp-DvP_VUvDE>
X-ME-Received: <xmr:C8MDZA1yEc6HVbVD1e0W9xI3V5xwd4MMXpfFWZgYkzyG6hI9cpwEQ8mHP1J4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:C8MDZLCpxBjcFXHcDyvd3TWB3tAWJbVtaSZfJkAJhzkv_DQPQmu5Aw>
    <xmx:C8MDZEgktIbSzMN64iY4ZhNPWXi5AgtkfiJ70ljGfGMoKyZiMj1Jjg>
    <xmx:C8MDZPq-kpYe9dJBMsZVW-XIPeEzmgTz2dwX9GU8p3nYQhFoUsUqZg>
    <xmx:C8MDZHty9PIQrnHj_IrJMkZHHMjvp19xFNTJXcsbIIoPQNetAhlQQw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:38 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 05/12] MIPS: cpu-features: Enable octeon_cache by cpu_type
Date:   Sat,  4 Mar 2023 22:15:17 +0000
Message-Id: <20230304221524.47160-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
References: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
2.34.1

