Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5049A6A4A28
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 19:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjB0Sqj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 13:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjB0Sqh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 13:46:37 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 079641EBC0
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 10:46:37 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 727125C014E;
        Mon, 27 Feb 2023 13:46:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 27 Feb 2023 13:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1677523596; x=1677609996; bh=tk
        YSi5juO1fpA/QTqFPOuO7luI8cWacMhKNoz2bpA6o=; b=l7mYq0OEMa8ouF3AeN
        pPmqz7zvHpvfWNZ/lj5GIs8sujjBEAc1BaD+gOvZkf4WCqMaaKMDj4qw6hgx6Noh
        2J0PEW7D6MEtu/YPl7vLcwIp/cxQ9b2NA2fed4iJtX0hiwsG/rhdUy/C2xrYDJio
        E4gcitJq7T6AW6s1XkSrlvlvDnk0Sel1e7Q92NRk9RXE6kaTdEUgmxQJ0F1opmF2
        eeJalbink0/pFiFZU4yvyWIgytmrVGpOkrp/9zvXXuG5zIHgZ6AzevVSa8ZhRoxv
        bnNIJW1icPgAooh+2QcMfSiRacCflk0OamI6ahTLxpzeLzWE9sYmr3bxSGiSD+LL
        k9Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1677523596; x=1677609996; bh=tkYSi5juO1fpA
        /QTqFPOuO7luI8cWacMhKNoz2bpA6o=; b=NSqsakHrhULhULJ1clJ8zDzQgSohl
        4oepbqfiet7nzxBc5smOuU+PfnVSvGYBCVDf5YPPw55aJDoG5WNgeofxH8FDvMs/
        jBRvL85ciBhR/wD4VlYv7tXbzkR2pN6duwcrNcpXktevkoAlMLlN+y+lHdYZcwXZ
        vWIzHnZIODtglkSPSyBnJtZMg5xwLH9ngnCvAYaZe3ngiyw5AFys2vV41afZVuLF
        H6fULmjtGTPM9/QTIkZH0yAQ8LWSjRn3Z2tJlI3j+XoYptlDnegyqZFwTd4b2Chd
        YINSj6Mipw6y8oY+NP/hSyONBooMtlFYtQRyy2f9f65UK5z2GxqdcLknw==
X-ME-Sender: <xms:jPr8Y6Nb9kNT-TLuDJ06VD1E9ybC3LVl1pxuvGQMT4dagC2sCKxslA>
    <xme:jPr8Y4-Sc2Jft1x0sJJqoztq9Q2h5lU8D38wIeAMHIZ67ZjIBVGbrnCY0T3PrmcdN
    J7EBmHHJcWo70qs25U>
X-ME-Received: <xmr:jPr8YxQ5FtZQNXKZdyTTNsLnYtjSbEHY9WKcZsuCJVTaGmTR8ImVzkWQVtH8fHWNGdHNjkM9dn8OEwO3Re1UaMzYXAodH6WfnVIS00s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:jPr8Y6uxEVqUs37EIUyjJujHM5b-2nQTXpr6xFs7Q-vqOILSiBIJiw>
    <xmx:jPr8YycMEI_PaScBBTsE-d82LPfUHFQaos9t6mjemS5B3BKSag2zcQ>
    <xmx:jPr8Y-3SmttEqHXd9VoSbdS1EndPDO4R_bWqhDy17N-qPsFBOFWQ7A>
    <xmx:jPr8YzrXCyAyXoG3N4wRcV8tKexnrvzb84wB-mF7vs89MbbbdQQBuw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 13:46:35 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 2/2] MIPS: cevt-r4k: Offset the value used to clear compare interrupt
Date:   Mon, 27 Feb 2023 18:46:14 +0000
Message-Id: <20230227184614.70026-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230227184614.70026-1-jiaxun.yang@flygoat.com>
References: <20230227184614.70026-1-jiaxun.yang@flygoat.com>
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

In c0_compare_int_usable we clear compare interrupt by write value
just read out from counter to compare register.

However sometimes if those all instructions are graduated together
then it's possible that at the time compare register is written, the
counter haven't progressed, thus the interrupt is triggered again.

It also applies to QEMU that instructions is executed significantly
faster then counter.

Offset the value used to clear interrupt by one to prevent that happen.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Don't touch value of cnt, just offset one
---
 arch/mips/kernel/cevt-r4k.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index 32ec67c9ab67..368e8475870f 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -200,7 +200,7 @@ int c0_compare_int_usable(void)
 	 */
 	if (c0_compare_int_pending()) {
 		cnt = read_c0_count();
-		write_c0_compare(cnt);
+		write_c0_compare(cnt - 1);
 		back_to_back_c0_hazard();
 		while (read_c0_count() < (cnt  + COMPARE_INT_SEEN_TICKS))
 			if (!c0_compare_int_pending())
@@ -228,7 +228,7 @@ int c0_compare_int_usable(void)
 	if (!c0_compare_int_pending())
 		return 0;
 	cnt = read_c0_count();
-	write_c0_compare(cnt);
+	write_c0_compare(cnt - 1);
 	back_to_back_c0_hazard();
 	while (read_c0_count() < (cnt + COMPARE_INT_SEEN_TICKS))
 		if (!c0_compare_int_pending())
-- 
2.37.1 (Apple Git-137.1)

