Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896B0249433
	for <lists+linux-mips@lfdr.de>; Wed, 19 Aug 2020 06:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbgHSEwc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Aug 2020 00:52:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:53654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725275AbgHSEwb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 Aug 2020 00:52:31 -0400
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D100220738;
        Wed, 19 Aug 2020 04:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597812750;
        bh=GLznDUKKZKgi2aEq0Zy87y3ImtPsM7YwW72FNOaxyOY=;
        h=Date:From:To:Cc:Subject:From;
        b=0O5cKw3BqHP71o2mkV1jzg3Fsh8EnMW0S+yAqD5Wc7Tprcks77TG1uf7KHbpow1fj
         6gwgmz2YIgL8hblkwvwc4pgzL7A4huihBYYCeYhQXeMIFi2Z9FAK7JncElBiqD1dUt
         r9CDw89Rz/UZdXhI5EYPAjArRR5rGc3VO26/SYf8=
Date:   Tue, 18 Aug 2020 23:58:13 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Robert Richter <rric@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Liangliang Huang <huanglllzu@gmail.com>
Cc:     oprofile-list@lists.sf.net, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH] MIPS: op_model_mipsxx: Fix non-executable code bug
Message-ID: <20200819045813.GA24181@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The fallthrough pseudo-keyword is being wrongly used and is causing
the non-executable code error below:

arch/mips/oprofile/op_model_mipsxx.c: In function ‘mipsxx_perfcount_handler’:
./include/linux/compiler_attributes.h:214:41: warning: statement will never be executed [-Wswitch-unreachable]
 # define fallthrough                    __attribute__((__fallthrough__))
                                         ^
arch/mips/oprofile/op_model_mipsxx.c:248:2: note: in expansion of macro ‘fallthrough’
  fallthrough;       \
  ^~~~~~~~~~~
arch/mips/oprofile/op_model_mipsxx.c:258:2: note: in expansion of macro ‘HANDLE_COUNTER’
  HANDLE_COUNTER(3)
  ^~~~~~~~~~~~~~

Fix this by placing the fallthrough macro at the proper place.

Fixes: c9b029903466 ("MIPS: Use fallthrough for arch/mips")
Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 arch/mips/oprofile/op_model_mipsxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/oprofile/op_model_mipsxx.c b/arch/mips/oprofile/op_model_mipsxx.c
index 1493c49ca47a..f200b97bdef7 100644
--- a/arch/mips/oprofile/op_model_mipsxx.c
+++ b/arch/mips/oprofile/op_model_mipsxx.c
@@ -245,7 +245,6 @@ static int mipsxx_perfcount_handler(void)
 
 	switch (counters) {
 #define HANDLE_COUNTER(n)						\
-	fallthrough;							\
 	case n + 1:							\
 		control = r_c0_perfctrl ## n();				\
 		counter = r_c0_perfcntr ## n();				\
@@ -254,7 +253,8 @@ static int mipsxx_perfcount_handler(void)
 			oprofile_add_sample(get_irq_regs(), n);		\
 			w_c0_perfcntr ## n(reg.counter[n]);		\
 			handled = IRQ_HANDLED;				\
-		}
+		}							\
+	fallthrough;
 	HANDLE_COUNTER(3)
 	HANDLE_COUNTER(2)
 	HANDLE_COUNTER(1)
-- 
2.27.0

