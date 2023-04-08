Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E97D6DBCED
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 22:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjDHUd6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Apr 2023 16:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDHUd5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Apr 2023 16:33:57 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1035A277
        for <linux-mips@vger.kernel.org>; Sat,  8 Apr 2023 13:33:56 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id A0DCB320076F;
        Sat,  8 Apr 2023 16:33:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 08 Apr 2023 16:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1680986033; x=1681072433; bh=kp1w25ocKu
        67A0ug3nSKd4Qwflj77mRuBHS3pUUJoSE=; b=145OJAOV+Tq6QP4jbJWT868cfw
        3NIzeIeu5gxaMNK9Q0h4762s92DvPM/8+g/7ddtXaksPypEjlG6ylyiRD9FjHzOm
        QWC5thBKAgYckzI7sSQ/Be70Pcllr3j8y/SLQyROJNB0e3Q77BfArLpVHiQuwoTG
        81BpC9WClmOaM+IGFYbkm+2XTX4DLdDuOotf+k4FlWa2kZLsa8zP7cm+1XLPVw73
        5H/wctJydWRHC0mqHihbQbG9moQPwy0br74nY34IPt1OwUB4+HHnIuOO70gge9jx
        iT5D5BEjXpvxcVArynrgXIaVVKmor0HUHPRDw5hSualACjzRcb/+8XdIQm6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680986033; x=1681072433; bh=kp1w25ocKu67A
        0ug3nSKd4Qwflj77mRuBHS3pUUJoSE=; b=BwVG6OnEHCsbjZIY68QgfMhKUqtbz
        WVzdOnLf7J6fOCKyLTLTPbM474LJY8V+8ttcs69Qeza0qlD4vuWi1GLHrDOB+THa
        YGXmgYHzOlwV/GNP/HQJETuwdr91elOOjMaCp/AiqqR2MBQ1Cpt5DhrL6FSisFEJ
        iBylGOV91srT/PRd3X2A61bVlEvoqwRraSsrO3OU5oEWAxkZcvHSRMh66/dikeD4
        rb5j4uvJTjs22HfaGkxzcnf9cWjOCSujOFnF19ugYCyS5C0Vj7cperCm9J76jVCw
        rmSWlsOu+VXRDOAzp5rNpDJgHhxo0DucavANebzbeYB7dElC0ZH5gbZMw==
X-ME-Sender: <xms:sM8xZKCgmlE1OfNhKH_gvS42tgGLuvtHGl5iWQ3pHE9ur4WJLy93eQ>
    <xme:sM8xZEhAnMYMzA4mGzRQYezr9HhKMKMwlTg8oZWP9YKpVFJGVjpTalva992nOEXPK
    FeBqsWG0bYYkMcNRiM>
X-ME-Received: <xmr:sM8xZNlmCJwutLtayWWPq-8P3Quyx0VGlzUr_6kjRTEzHSAOG1NU44m5ipBN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejjedgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpedvffffgeejtdfgfffgtd
    elvdethfejfeeihffhteeijeehtdeltdegkeekleefjeenucffohhmrghinhepkhgvrhhn
    vghltghirdhorhhgpdhlughsrdhssgenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:sM8xZIws6j7xOs92xqmdz_7E5uDO0vOf0d_1Iq1ggNsMiMLVi1s3VQ>
    <xmx:sM8xZPSDDuOC_xGsGbHVWvVqoog8QenM8WNnrS5_PQKarVJd181S5w>
    <xmx:sM8xZDYDknXsugrr5yTQFuyS3TNcU8zBLV0QSymqtB_rt4JBfZ8I8A>
    <xmx:sc8xZKeb4qM8bp0BzqgC4m7j7k3ihDXuVvAbwXeJB-xfTF9gIhy_QQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Apr 2023 16:33:51 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: [PATCH for 6.3] MIPS: Define RUNTIME_DISCARD_EXIT in LD script
Date:   Sat,  8 Apr 2023 21:33:48 +0100
Message-Id: <20230408203348.28896-1-jiaxun.yang@flygoat.com>
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

MIPS's exit sections are discarded at runtime as well.

Fixes link error:
`.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o:
defined in discarded section `.exit.text' of fs/fuse/inode.o

Fixes: 99cb0d917ffa ("arch: fix broken BuildID for arm64 and riscv")
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/vmlinux.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 52cbde60edf5..9ff55cb80a64 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -15,6 +15,8 @@
 #define EMITS_PT_NOTE
 #endif
 
+#define RUNTIME_DISCARD_EXIT
+
 #include <asm-generic/vmlinux.lds.h>
 
 #undef mips
-- 
2.39.2 (Apple Git-143)

