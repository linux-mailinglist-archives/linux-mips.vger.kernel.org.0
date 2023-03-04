Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2D96AACE7
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjCDWPk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjCDWPi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:38 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3556C13DDE
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:38 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 9DCE95C0106;
        Sat,  4 Mar 2023 17:15:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 04 Mar 2023 17:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968137; x=
        1678054537; bh=FyiMnbB7vO9pKAJ1t/+CxPIKESYZIYJEg2a1QH+wfQ8=; b=B
        HhLKo5GuHr1+dLVzEass+HU63KzURwi6TEFYfnkk4dq9dsIQ59+UnsssZJ+aK3sP
        qsSyJdnDxojaU1Fq/UT6FVPmMBik7jBSOeuRQsmMm3+cDWbLUCDSliuw4PuU2SzT
        4quzLeZYzwYlH4lrAvFbM96p9N0wsch1O0wfClpu9KGnziJwCvUaKizInucZkF+0
        INxuYAJnhe2Hh/QkvvnRw9vQg/3430Qh9pew6tynpyBAsHFqoizIRysX5ofNZRKd
        7y8MWeeQW1UD0zJVQAOLzTiZ5H56R+94Y6eg6YW6jlsWFiZDpQ53CuLtXrz1bkx9
        Qdwm84BWD7UuCaLU1f30Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968137; x=
        1678054537; bh=FyiMnbB7vO9pKAJ1t/+CxPIKESYZIYJEg2a1QH+wfQ8=; b=t
        a+m2WdbLYeQSTLijUzxhiv3/aCVA1D+LLAVK4JBbDiDl0tEp2cKAfduGP1rRDLbQ
        fqgEJRUnjmHIneW2TU8/F8hVEyOMvOUCQDBzplOzEr+KFUs5dMgoCmh65aRgYuhG
        8hsQC+y2mv9zPH8No94NOgRRNJzbbS+J2Pn7CWi44HrLxQZ2/G9TKiPYoM+MYtka
        OavMmf/DV9kzmFDBDd0PRo3YnTnjzL6zg1N7JkQyyHroUdLplck+j3fwkF7C9NDK
        9grqjwbLFTwkJANdASPVc3kAkENqf10OjLghqPo4BvhSxDeXJ7n7L72dTZDbCuo6
        /5OP2J4JvRx3w5HODJpvw==
X-ME-Sender: <xms:CcMDZIvan_-J6qwLCW8KLBPafKvMF53awAJhPuBGvd-uGAvDQQ6R0g>
    <xme:CcMDZFcLg7-aNwh_bLqsSS8_z_uuIwH2oth9UDoThqDfbe5gRgUj27q4xfrs_qRPr
    9kK87TM9jHE4GHmbRk>
X-ME-Received: <xmr:CcMDZDxWkCR5EUji84ZxbZjZPHnxfHyxZVVIcGO9KG5WuLJtp593BN7qc8Q3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:CcMDZLMLIgsgaFHXrWDA63PJu9tQ25UDaIyE5KFsF4SPqcjiS1orbQ>
    <xmx:CcMDZI-RSZMh1x2Es5LcLUvZORuwoILq1BK9ms0M879WUMeU1fd_iA>
    <xmx:CcMDZDUQ1IEqDKN5eBCPNcn_-_nqWPtfjodb8X3oaqkKF3FuczKOWA>
    <xmx:CcMDZKKhWUXLX-iSEc50XSqJHHPBUxUxGhXFdp7jQnJuiyyGd3SeMg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:36 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 03/12] MIPS: mips-cm: Check availability of config registers
Date:   Sat,  4 Mar 2023 22:15:15 +0000
Message-Id: <20230304221524.47160-4-jiaxun.yang@flygoat.com>
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
2.34.1

