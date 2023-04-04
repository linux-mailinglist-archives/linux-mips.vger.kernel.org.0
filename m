Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67A7C6D5BFF
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234198AbjDDJeU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234179AbjDDJeS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:18 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9BB125
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:16 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 4866B5C00E4;
        Tue,  4 Apr 2023 05:34:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 04 Apr 2023 05:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600856; x=
        1680687256; bh=nlhpZBIwckOwEgQacs3F0gm3vpANDVDclb6m6ubz/+Y=; b=o
        n8R+ACKuzFpt6gK7YpveGQuC9Rlo3SGmHX8Z1ch3q3lzgWaYEUJ1Fc7I2+Hhx5Of
        j+TbXifZKev+mf+HHeetRzfK7G8nWyROpvQ0mFIL921MMG25FWiJ+m+XXln6k3qM
        dJvSQ19qIgseSNBUE7IsIw2YixdrDE797a7Ojv53TY1RM1id7F4iWJoWeWX4rAA+
        ge0FB8O4FAYrk3CbcJr3f75AjM0Lz/DiluN6pcQ440+nmMQVVQy4uB1znlwOslFv
        LPH/I9xQXDo+2QiS6mHvsxsCoRMxtHTCqyvvJma/+2HJ5wEUJw3+Akyy3VOQNJwV
        fNXDLlUwbpq8mwr7ovn1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600856; x=
        1680687256; bh=nlhpZBIwckOwEgQacs3F0gm3vpANDVDclb6m6ubz/+Y=; b=l
        NluRzsbqHgLMCvfI2KxbllWnVERQHUiEQzGj8KYuWo67ULe1fYUKD2u4s7iBPCTA
        7NjwCTEd+0XT1QFdMmW3kOpCchAaWPtPyOsl3ZKPd/FnJSWjIkaXvNd04SvY1znJ
        N0T5dMmDkFFEXUtsqjpFjrzYDYeqN5OAsL+5fWMgusrZcj2yBVotcxJDVYpjKFXf
        GrSxDY25LIuuAz+HboY3O1My+Mj1PvEDzj1o/hY7coIWEkaUtfpHH5Q3Kx3BcNAV
        j4av4auYcainS7PH+dzQvXyEKvYSI86aeCsvemSwMRxHmQj1CGapOgjpelRPvQEI
        N9j62mCclRpBdw8oSHsYg==
X-ME-Sender: <xms:GO8rZJAKhW4u6A2XnAC8tiNXbvlTMCTOGSB01r6rtNbqNw_4_2WWzg>
    <xme:GO8rZHj72HrqDAH8h7GJipO38gEnIc7cStrX-0zZHfnppBtcnASKnHKVIBkN9VvQY
    RfATjT60tQaMl3F_SI>
X-ME-Received: <xmr:GO8rZEk6URozYig-LeR1z9wLSULNMcdzgSF869ARqyyf47eWsUfdg62yZtuf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:GO8rZDzTIn2N4rZvvqoo46CAl7hQgZ55XQxJ7vqGCe0tkLjzyXUOFQ>
    <xmx:GO8rZOScL5FXXFdqszsWl7VYp5liG_JfTGmKYszUJ1O9L-wQDOhsFg>
    <xmx:GO8rZGZBUXO9A3-db9vSdnEWjqUz0Y7puTC0sFy7JiXnZL9V3gWROw>
    <xmx:GO8rZEPn4ZjmEdi2LqlcHZCxPKBNWVlipjAtkgB_SDbrXBlYBRYc-Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:15 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 03/12] MIPS: mips-cm: Check availability of config registers
Date:   Tue,  4 Apr 2023 10:33:42 +0100
Message-Id: <20230404093351.4233-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
References: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
2.39.2 (Apple Git-143)

