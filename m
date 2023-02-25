Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C32A6A2C03
	for <lists+linux-mips@lfdr.de>; Sat, 25 Feb 2023 23:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjBYWKv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Feb 2023 17:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjBYWKv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Feb 2023 17:10:51 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95429144B3
        for <linux-mips@vger.kernel.org>; Sat, 25 Feb 2023 14:10:50 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 0D43F5C00A8;
        Sat, 25 Feb 2023 17:10:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 25 Feb 2023 17:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1677363050; x=1677449450; bh=1e
        QdSzSFqoTiPj1Bkk1jN4IjVVEv4YaL00W02oLxvHE=; b=fHRlIrALJZnbZXVdSv
        3hNIQqvaissxcg4kYwhLTUGwBLdeWpG5WMgyEEyI9DojSMJoHWph6POuWPZ8dGPk
        AZ2tLhsAKWazpwfVS5x9tErOPME1fko047J16uwDQSF2T+M53Pa4waQAGM0spNkK
        pDQbJNB9nnxR7436tLGfSL+ppGwMRl3HaalWKttU7duLmrYNUqQyhZlvOon9CsJm
        KfyKwLTlUX2IB+tEKVaDOGyhdwuss87kK8E3pbv+h/c553gJoiu0nb1kQESmX2jh
        dNmVOjdGAl/CN202uGKD6CaL6GMm0+V6mYXuFkmDl02Wd+8ZrYpwulJ/JGBnjngE
        k35w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1677363050; x=1677449450; bh=1eQdSzSFqoTiP
        j1Bkk1jN4IjVVEv4YaL00W02oLxvHE=; b=ZbU4CymJQuzs2Rk7o2PdqkEVvF8Rl
        ulugcZ3yGvaNlI2jMsOtK0tArkfb+unQIpGVdyKoGy02p9tkdT3A8Aj/O5qYold8
        PaAniEFrfDfv+bETPmzKthkBEqJTnDqdLftJUVahIODZo5YJlDAlWD1xYjB1j/f0
        6ScAgi/qw71JUnUm9qp0K9WbTL9BWvbmj6D9RZWRN3lcRqnr8MblsPyVJtC7KsNb
        FZs7WR1/hGkNFltzDxj+XKeN9OQ9ly77D9Lubp8jWA4O2GPpzmT6H3BcwZF3mg05
        PeEUkCw5NNtN7UuadepHTXr4QKmB8iMs8pzQWwRT+1SREu0VkqzU7/Riw==
X-ME-Sender: <xms:aYf6Y9VlISkpzote3_fn1neOFPfjIAHvSpOb6G3V9fMFks-RqbZaLg>
    <xme:aYf6Y9nVB2NE9mSc8A9LlsldkO6HhH4AOaLf4ZzlXzT6EX7KTYUHxQFYCruOwxrDo
    fKRSFrEiCgh14DAl70>
X-ME-Received: <xmr:aYf6Y5Zb4315eaojK1uybjBEjlluGGKESO1t5KLnySgqmSoAIMc1DW7ntIy8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:aYf6YwUvQqXQimABJXnYvEFJJyH12vug3zSI-agsbliJoCzKn4mY2A>
    <xmx:aYf6Y3lHTL6w7nwxlofc-pZgNR3Shb6uAkoBGRcyUxAqJ7suyCACUQ>
    <xmx:aYf6Y9fAI-HNFeLgnepnmgl-yxPhzovT-VRYrjhIv--Th21rxK0qIQ>
    <xmx:aof6Y_s1zGrhzjpfsVmK_bihhXgAP7pIGLCefELcvyO1eCbo_XW1QA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 17:10:49 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] MIPS: cevt-r4k: Offset counter value for clearing compare interrupt
Date:   Sat, 25 Feb 2023 22:10:08 +0000
Message-Id: <20230225221008.8520-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
References: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In c0_compare_int_usable we clear compare interrupt by write value
just read out from counter to compare register.

However sometimes if those all instructions are graduated together
then it's possible that at the time compare register is written, the
counter haven't progressed, thus the interrupt is triggered again.

It also applies to QEMU that instructions is execuated significantly
faster then counter.

Offset the counter value a litlle bit to prevent that happen.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/cevt-r4k.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 32ec67c9ab67..bbc422376e97 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -200,6 +200,8 @@ int c0_compare_int_usable(void)
 	 */
 	if (c0_compare_int_pending()) {
 		cnt = read_c0_count();
+		// Drawdown a little bit in case counter haven't progressed
+		cnt -= COMPARE_INT_SEEN_TICKS;
 		write_c0_compare(cnt);
 		back_to_back_c0_hazard();
 		while (read_c0_count() < (cnt  + COMPARE_INT_SEEN_TICKS))
@@ -228,6 +230,7 @@ int c0_compare_int_usable(void)
 	if (!c0_compare_int_pending())
 		return 0;
 	cnt = read_c0_count();
+	cnt -= COMPARE_INT_SEEN_TICKS;
 	write_c0_compare(cnt);
 	back_to_back_c0_hazard();
 	while (read_c0_count() < (cnt + COMPARE_INT_SEEN_TICKS))
-- 
2.37.1 (Apple Git-137.1)

