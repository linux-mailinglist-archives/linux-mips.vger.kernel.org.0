Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 833421E6163
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 14:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389927AbgE1Muk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 08:50:40 -0400
Received: from mail-m974.mail.163.com ([123.126.97.4]:42324 "EHLO
        mail-m974.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389871AbgE1Muk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 08:50:40 -0400
X-Greylist: delayed 911 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 May 2020 08:50:38 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=tqB8gk4cBM9ljJdG5y
        YuMl1Lq4aOSsx4vGFhMHDPSCM=; b=N76C7rWqeSGnMroCARmECLiTW8NNwvYqCh
        Ip1lki2CadzBviG5ECsSPG/mb64rZyn3h3RZoU0LGuW3+dHIak3CWfvXU5FnFSMX
        MTNQYCuyzrewpedCQkBd9QJ5UCz0jN2JdpN1c0QcEGYT01N9yH9OREpXsvFhSXQQ
        PT1veE+nQ=
Received: from localhost.localdomain (unknown [124.64.18.22])
        by smtp4 (Coremail) with SMTP id HNxpCgC3Qs37r89emFSaBA--.109S4;
        Thu, 28 May 2020 20:35:13 +0800 (CST)
From:   YuanJunQing <yuanjunqing66@163.com>
To:     tsbogend@alpha.franken.de
Cc:     paulburton@kernel.org, chenhc@lemote.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn, YuanJunQing <yuanjunqing66@163.com>
Subject: [PATCH] MIPS: Fix IRQ tracing when call handle_fpe() and handle_msa_fpe()
Date:   Thu, 28 May 2020 20:35:05 +0800
Message-Id: <20200528123505.4219-1-yuanjunqing66@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: HNxpCgC3Qs37r89emFSaBA--.109S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrWUurykKF4kZryxur4xXrb_yoWDWrc_Kr
        42v3yUKr15CwnxWr17tw4rW34Ivw4SgF9IyFyvvw1ayr45Wrs0krWvg3WkXwn3Wr4SkFWI
        y398G3Z2kF1xtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjT5l5UUUUU==
X-Originating-IP: [124.64.18.22]
X-CM-SenderInfo: h1xd0ypxqtx0rjwwqiywtou0bp/xtbBUQEyXFaD7QftBgAAsq
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

 Register "a1" is unsaved in this function,
 when CONFIG_TRACE_IRQFLAGS is enabled,
 the TRACE_IRQS_OFF macro will call trace_hardirqs_off(),
 and this may change register "a1".
 The changed register "a1" as argument will be send
 to do_fpe() and do_msa_fpe().

Signed-off-by: YuanJunQing <yuanjunqing66@163.com>
---
 arch/mips/kernel/genex.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index 8236fb291e3f..a1b966f3578e 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -476,20 +476,20 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	.endm
 
 	.macro	__build_clear_fpe
+	CLI
+	TRACE_IRQS_OFF
 	.set	push
 	/* gas fails to assemble cfc1 for some archs (octeon).*/ \
 	.set	mips1
 	SET_HARDFLOAT
 	cfc1	a1, fcr31
 	.set	pop
-	CLI
-	TRACE_IRQS_OFF
 	.endm
 
 	.macro	__build_clear_msa_fpe
-	_cfcmsa	a1, MSA_CSR
 	CLI
 	TRACE_IRQS_OFF
+	_cfcmsa	a1, MSA_CSR
 	.endm
 
 	.macro	__build_clear_ade
-- 
2.17.1

