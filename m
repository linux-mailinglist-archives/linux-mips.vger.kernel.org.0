Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3706AACEE
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjCDWPr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjCDWPr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:47 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E180199DC
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:46 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 765495C0103;
        Sat,  4 Mar 2023 17:15:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 04 Mar 2023 17:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968145; x=
        1678054545; bh=sGJmLjd5JbRIkRrjcWhhoRa3Yyv3+p46+kg1LIGSDKE=; b=C
        mN1C8Ifk9MH+3x6fJNCDPBJNkbU7OQvZLWaNe/bJmiZtAWqcX2tYREQyaEs85dAr
        SGgGx0nSXpjcYFYHY81hwFC8vcXpnHB0ceVP8NJlPTOxz7E56BYkwC4f5bM3Ik9L
        lVECmjJY0regDUN2P+TNjopfc+qzwCEXK8PsKeoo8zYZGz/+Huhe26kUjxuaf4nX
        uJx/1WN+6NkVsbNLujYBL4/GkAWOzqQ771yudM/4kU2gwq0wgr25YuccwXvM3biu
        iZPjXpzX01n67EoznS41UpTywwNKRBuQxnYqdfJxM8vpDM4/VVTPiHam9akHHmgK
        XulI7XXeoPxV3fyNoBNiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968145; x=
        1678054545; bh=sGJmLjd5JbRIkRrjcWhhoRa3Yyv3+p46+kg1LIGSDKE=; b=m
        BIB7eYacRhx7qdYLa+lBy1A6QcEhIUk6NKLiwG9QiBgZF51FwWV2PW1ykOFOAfQb
        gCHS15T4SOQR+8VWmHoIcCzn6YNn78UMfLrpC0Jtc5aj+1OtPx0Ad7P5tQHcjjjE
        Aibu50YM1plbeo5NBIyaabeHhy6PU5GSOTLfGaLLSSzNkVCjmaIM4tjnzqC4IYdV
        cZM2rcB9DAyK+YMaM9hfWhG2u6OtkIZMGsBBquvmAKG8REc7iZKDeIzcVS6mxo4s
        wL2fHEfxEdfyHlqRjymM1qBQJ0hEQ0Usgx+6Y6KKTkWXCzV6ptwsJe5+79oqCzVK
        8ESDfkHNB9Jwhb3x8QhkQ==
X-ME-Sender: <xms:EcMDZJlKQS2NAw2-u7o6-95oGUEZIQ4hwgUQbc6hpKj9MaEho5KVEg>
    <xme:EcMDZE1V1KjdvxqjddAMpEy4JQWb53O1SjsTOYS8mehJu6QZx856ai6wYXyJt-Y5g
    26Ve9xnolbyLLOcKtY>
X-ME-Received: <xmr:EcMDZPrXZwdAawHDZk7SdsOAQJtCVDRVmhR5GU2LTE1CZDmvWrVe5LaZkELa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:EcMDZJn9nJ5QTlpAennplN7zY3I95oh4Jcp5gYkXtP6za9Q8faAAgg>
    <xmx:EcMDZH00_0dAoB92-3F7mnzur8K4nvc8FwiNR46IemCNJIDZa8HgfQ>
    <xmx:EcMDZItD9Dqi6ujQeTKpuGVss9_c_1ZuhkfrhJxTwszAJw2y_EKmWg>
    <xmx:EcMDZFB0W79y8vjGsvi026Vq5vq96l9x2HlYiY3O1R-9mZP2v-jd-A>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:44 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 10/12] MIPS: Octeon: Disable CVMSEG by default on other platforms
Date:   Sat,  4 Mar 2023 22:15:22 +0000
Message-Id: <20230304221524.47160-11-jiaxun.yang@flygoat.com>
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
2.34.1

