Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13AC66DBAB6
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 13:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDHL7z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Apr 2023 07:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjDHL7q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Apr 2023 07:59:46 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5D1D508
        for <linux-mips@vger.kernel.org>; Sat,  8 Apr 2023 04:59:45 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id AAEC43200907;
        Sat,  8 Apr 2023 07:59:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 08 Apr 2023 07:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1680955181; x=1681041581; bh=ma7N/IdC4J
        ayJa9Euedd9FmpDcN0ZPPl2Wnxn+0AHVE=; b=Un9/bLCXX42MQpY81B2EpD0n/M
        8Z/ve/jdbAa0jFf5AlmyQBPrMZFGEFCNczpxnnl2tZ07X8LP+zVZjPqHo+HPIHDu
        RXOtsT5cqiVnVattsh50y9Zm4n/tpTguAhCAW2/eE3rjECTKUVdsiVkoDopwwyM4
        /8VXghf5qVPlcDXWzrmZ4pNfkKMLsrSuZFjRHe5q9lL3fX7xX+65ITDUtyRZ8sT9
        8SnTKAhJ227iD7sAnNXsL03IrjqGEB+ClkfW+Ih2WMYbrYnqYQuWz+/2EMrVNLl0
        VfFCUcPcswtEQEtyod7BYHyHWKeVCELmzzOrfMHfWBN7ld4UZNkT9/OGaoXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680955181; x=1681041581; bh=ma7N/IdC4JayJ
        a9Euedd9FmpDcN0ZPPl2Wnxn+0AHVE=; b=bmlilAq4hozCEy37g0WVALcQHLZlN
        yfBFz6zkOFkW+pK8l7jfRA7DyJusxuOBZL8rT+Low+AHEvx7DGW0G+NbbHZU6+d+
        AJ6WombJ/LVRzSJijbE9pv3K2G21+zRObnRJzH746bH+Swm7myUmrL16k6H4DJa7
        NZQAcVloYZj4hoe+PAjAFf/Zm1CLd1/qKZ8NxsW8kUg3dPierlgAVG6nweFXHo9W
        0LpQNpzyyrrSBGs6T6dbs9OLC7gPG4G+GJidpt8/dIBmWQd3FueK6uth2p8MmIjr
        Iek0pt8KNM7/h/LSoF3YHPouBlfUA9KsiFJnZMif/MJOjcb5t8Jnn2D+g==
X-ME-Sender: <xms:LFcxZO5Aqyf-6qCpYx19kfWzEYAQOFYIjlePt36smKAFnMIZ7p9BHw>
    <xme:LFcxZH6VnkcNUfVEWlHV3xF0kyWA6a00FC7FFZWOLFa0U8t340GaHDCXeJaZDpbEg
    ykdShfgsR704Uq-mMk>
X-ME-Received: <xmr:LFcxZNcyXQS7X8ejUen4jnCzUSP0covSMzolmtmeLmQegfkmrQBAl7bMeqoH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejjedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:LFcxZLI7cyz9H6ek6089H9LDGQMk9EVWS6FGBssubZ_gRNcFY7buNw>
    <xmx:LFcxZCIbDhVWjx_TeO4zN0eYWzQ8mBr320gUitsK-lzapavUOSoSvA>
    <xmx:LFcxZMy1oKOVtTHaSaSilL94xB1rPQ1pJ7H8HtldVr6fGb9wqW-gFg>
    <xmx:LVcxZJWqYECcmkG3iRH5T8uWRcbcUkSb5HboriBliOf9n7yr89OlZA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Apr 2023 07:59:39 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] MIPS: Set better default CPU model and kernel code model
Date:   Sat,  8 Apr 2023 12:59:36 +0100
Message-Id: <20230408115936.6631-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
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

Set default CPU model to Release 2 CPUs (MIPS64R2 if 64 bit CPU
is present, otherwise MIPS32R2) to get better feature coverage
on various default configs.

Also set default kernel code model to 64 bit since nowadays it
doesn't make much sense to run 32 bit kernel on a 64 bit system.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ecc7a755fae6..1d681dd87bb0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1260,6 +1260,8 @@ menu "CPU selection"
 
 choice
 	prompt "CPU type"
+	default CPU_MIPS64_R2 if SYS_HAS_CPU_MIPS64_R2
+	default CPU_MIPS32_R2 if SYS_HAS_CPU_MIPS32_R2
 	default CPU_R4X00
 
 config CPU_LOONGSON64
@@ -2007,6 +2009,7 @@ menu "Kernel type"
 
 choice
 	prompt "Kernel code model"
+	default 64BIT
 	help
 	  You should only select this option if you have a workload that
 	  actually benefits from 64-bit processing or if your machine has
-- 
2.39.2 (Apple Git-143)

