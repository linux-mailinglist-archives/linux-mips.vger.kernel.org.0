Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69BEC79D1D
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 01:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbfG2Xz2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 19:55:28 -0400
Received: from gateway33.websitewelcome.com ([192.185.145.9]:33176 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728269AbfG2Xz2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Jul 2019 19:55:28 -0400
X-Greylist: delayed 1307 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Jul 2019 19:55:27 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id 92C125C872
        for <linux-mips@vger.kernel.org>; Mon, 29 Jul 2019 18:32:12 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id sF7khjCBl2PzOsF7khp2m8; Mon, 29 Jul 2019 18:32:12 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=KpUpOxxdU+KhG7Hocsjej/GA+sI7fVcCM88qfdZm4Nk=; b=z5f1wjJKlzs0jlKdEdS03CIAiU
        asTWm2FuWtrMWHm4TAL1uQg5hBgvO6HgRa04/BfwxMrtF6R5jI2Dldkl8uKPBcmF/vTyQL6rLQG3P
        p0VCBi5NJMns6GaJzkMrpu5o2wVHhDfML87lbncx5Ae2225YbDpu9Ul/Je47cwZ+6G/Tj1eVbjRcP
        qkTBzpYM6Z7+/Kqih/W7Haf0RjaVjF0Zuev8UCBMtaY8rEIu3g5Ggzhef2ywZbyilOJO261rHFaMV
        OpYDDGfFCIb1eqLmyksnaMGGn7wJIiNL1+ZauI9nS4YWdeopFgzxUpSDWMpzTKFJawByzwZiQRcAY
        7+ugJ65Q==;
Received: from [187.192.11.120] (port=33296 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hsF7j-002agT-EA; Mon, 29 Jul 2019 18:32:11 -0500
Date:   Mon, 29 Jul 2019 18:32:10 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Robert Richter <rric@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     oprofile-list@lists.sf.net, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] MIPS: OProfile: Mark expected switch fall-throughs
Message-ID: <20190729233209.GA28779@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hsF7j-002agT-EA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:33296
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning (Building: mips):

arch/mips/oprofile/op_model_mipsxx.c: In function ‘mipsxx_cpu_stop’:
arch/mips/oprofile/op_model_mipsxx.c:217:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfctrl3(0);
   ^~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:218:2: note: here
  case 3:
  ^~~~
arch/mips/oprofile/op_model_mipsxx.c:219:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfctrl2(0);
   ^~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:220:2: note: here
  case 2:
  ^~~~
arch/mips/oprofile/op_model_mipsxx.c:221:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfctrl1(0);
   ^~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:222:2: note: here
  case 1:
  ^~~~
arch/mips/oprofile/op_model_mipsxx.c: In function ‘mipsxx_cpu_start’:
arch/mips/oprofile/op_model_mipsxx.c:197:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfctrl3(WHAT | reg.control[3]);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:198:2: note: here
  case 3:
  ^~~~
arch/mips/oprofile/op_model_mipsxx.c:199:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfctrl2(WHAT | reg.control[2]);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:200:2: note: here
  case 2:
  ^~~~
arch/mips/oprofile/op_model_mipsxx.c:201:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfctrl1(WHAT | reg.control[1]);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:202:2: note: here
  case 1:
  ^~~~
arch/mips/oprofile/op_model_mipsxx.c: In function ‘reset_counters’:
arch/mips/oprofile/op_model_mipsxx.c:299:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfcntr3(0);
   ^~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:300:2: note: here
  case 3:
  ^~~~
arch/mips/oprofile/op_model_mipsxx.c:302:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfcntr2(0);
   ^~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:303:2: note: here
  case 2:
  ^~~~
arch/mips/oprofile/op_model_mipsxx.c:305:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfcntr1(0);
   ^~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:306:2: note: here
  case 1:
  ^~~~
arch/mips/oprofile/op_model_mipsxx.c: In function ‘mipsxx_perfcount_handler’:
arch/mips/oprofile/op_model_mipsxx.c:242:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if ((control & MIPS_PERFCTRL_IE) &&   \
      ^
arch/mips/oprofile/op_model_mipsxx.c:248:2: note: in expansion of macro ‘HANDLE_COUNTER’
  HANDLE_COUNTER(3)
  ^~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:239:2: note: here
  case n + 1:       \
  ^
arch/mips/oprofile/op_model_mipsxx.c:249:2: note: in expansion of macro ‘HANDLE_COUNTER’
  HANDLE_COUNTER(2)
  ^~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:242:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if ((control & MIPS_PERFCTRL_IE) &&   \
      ^
arch/mips/oprofile/op_model_mipsxx.c:249:2: note: in expansion of macro ‘HANDLE_COUNTER’
  HANDLE_COUNTER(2)
  ^~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:239:2: note: here
  case n + 1:       \
  ^
arch/mips/oprofile/op_model_mipsxx.c:250:2: note: in expansion of macro ‘HANDLE_COUNTER’
  HANDLE_COUNTER(1)
  ^~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:242:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if ((control & MIPS_PERFCTRL_IE) &&   \
      ^
arch/mips/oprofile/op_model_mipsxx.c:250:2: note: in expansion of macro ‘HANDLE_COUNTER’
  HANDLE_COUNTER(1)
  ^~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:239:2: note: here
  case n + 1:       \
  ^
arch/mips/oprofile/op_model_mipsxx.c:251:2: note: in expansion of macro ‘HANDLE_COUNTER’
  HANDLE_COUNTER(0)
  ^~~~~~~~~~~~~~
  CC      usr/include/linux/pmu.h.s
arch/mips/oprofile/op_model_mipsxx.c: In function ‘mipsxx_cpu_setup’:
arch/mips/oprofile/op_model_mipsxx.c:174:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfcntr3(reg.counter[3]);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:175:2: note: here
  case 3:
  ^~~~
arch/mips/oprofile/op_model_mipsxx.c:177:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfcntr2(reg.counter[2]);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:178:2: note: here
  case 2:
  ^~~~
arch/mips/oprofile/op_model_mipsxx.c:180:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
   w_c0_perfcntr1(reg.counter[1]);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:181:2: note: here
  case 1:
  ^~~~

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 arch/mips/oprofile/op_model_mipsxx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/oprofile/op_model_mipsxx.c b/arch/mips/oprofile/op_model_mipsxx.c
index 7c04b17f4a48..96c13a0ab078 100644
--- a/arch/mips/oprofile/op_model_mipsxx.c
+++ b/arch/mips/oprofile/op_model_mipsxx.c
@@ -172,12 +172,15 @@ static void mipsxx_cpu_setup(void *args)
 	case 4:
 		w_c0_perfctrl3(0);
 		w_c0_perfcntr3(reg.counter[3]);
+		/* fall through */
 	case 3:
 		w_c0_perfctrl2(0);
 		w_c0_perfcntr2(reg.counter[2]);
+		/* fall through */
 	case 2:
 		w_c0_perfctrl1(0);
 		w_c0_perfcntr1(reg.counter[1]);
+		/* fall through */
 	case 1:
 		w_c0_perfctrl0(0);
 		w_c0_perfcntr0(reg.counter[0]);
@@ -195,10 +198,13 @@ static void mipsxx_cpu_start(void *args)
 	switch (counters) {
 	case 4:
 		w_c0_perfctrl3(WHAT | reg.control[3]);
+		/* fall through */
 	case 3:
 		w_c0_perfctrl2(WHAT | reg.control[2]);
+		/* fall through */
 	case 2:
 		w_c0_perfctrl1(WHAT | reg.control[1]);
+		/* fall through */
 	case 1:
 		w_c0_perfctrl0(WHAT | reg.control[0]);
 	}
@@ -215,10 +221,13 @@ static void mipsxx_cpu_stop(void *args)
 	switch (counters) {
 	case 4:
 		w_c0_perfctrl3(0);
+		/* fall through */
 	case 3:
 		w_c0_perfctrl2(0);
+		/* fall through */
 	case 2:
 		w_c0_perfctrl1(0);
+		/* fall through */
 	case 1:
 		w_c0_perfctrl0(0);
 	}
@@ -236,6 +245,7 @@ static int mipsxx_perfcount_handler(void)
 
 	switch (counters) {
 #define HANDLE_COUNTER(n)						\
+	/* fall through */						\
 	case n + 1:							\
 		control = r_c0_perfctrl ## n();				\
 		counter = r_c0_perfcntr ## n();				\
@@ -297,12 +307,15 @@ static void reset_counters(void *arg)
 	case 4:
 		w_c0_perfctrl3(0);
 		w_c0_perfcntr3(0);
+		/* fall through */
 	case 3:
 		w_c0_perfctrl2(0);
 		w_c0_perfcntr2(0);
+		/* fall through */
 	case 2:
 		w_c0_perfctrl1(0);
 		w_c0_perfcntr1(0);
+		/* fall through */
 	case 1:
 		w_c0_perfctrl0(0);
 		w_c0_perfcntr0(0);
-- 
2.22.0

