Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357B724BD2A
	for <lists+linux-mips@lfdr.de>; Thu, 20 Aug 2020 15:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729082AbgHTNAb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Aug 2020 09:00:31 -0400
Received: from mail1.windriver.com ([147.11.146.13]:57318 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgHTNAQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Aug 2020 09:00:16 -0400
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
        by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07KCxkOl018093
        (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
        Thu, 20 Aug 2020 05:59:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 20 Aug 2020 05:59:45 -0700
From:   <zhe.he@windriver.com>
To:     <rric@kernel.org>, <tsbogend@alpha.franken.de>,
        <oprofile-list@lists.sf.net>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <zhe.he@windriver.com>
Subject: [PATCH] mips/oprofile: Fix fallthrough placement
Date:   Thu, 20 Aug 2020 20:54:40 +0800
Message-ID: <20200820125440.350184-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: He Zhe <zhe.he@windriver.com>

We want neither
"
include/linux/compiler_attributes.h:201:41: warning: statement will never
be executed [-Wswitch-unreachable]
  201 | # define fallthrough __attribute__((__fallthrough__))
      |                      ^~~~~~~~~~~~~
"
nor
"
include/linux/compiler_attributes.h:201:41: warning: attribute
'fallthrough' not preceding a case label or default label
  201 | # define fallthrough __attribute__((__fallthrough__))
      |                      ^~~~~~~~~~~~~
"

It's not worth adding one more macro. Let's simply place the fallthrough
in between the expansions.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 arch/mips/oprofile/op_model_mipsxx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/oprofile/op_model_mipsxx.c b/arch/mips/oprofile/op_model_mipsxx.c
index 1493c49ca47a..55d7b7fd18b6 100644
--- a/arch/mips/oprofile/op_model_mipsxx.c
+++ b/arch/mips/oprofile/op_model_mipsxx.c
@@ -245,7 +245,6 @@ static int mipsxx_perfcount_handler(void)
 
 	switch (counters) {
 #define HANDLE_COUNTER(n)						\
-	fallthrough;							\
 	case n + 1:							\
 		control = r_c0_perfctrl ## n();				\
 		counter = r_c0_perfcntr ## n();				\
@@ -256,8 +255,11 @@ static int mipsxx_perfcount_handler(void)
 			handled = IRQ_HANDLED;				\
 		}
 	HANDLE_COUNTER(3)
+	fallthrough;
 	HANDLE_COUNTER(2)
+	fallthrough;
 	HANDLE_COUNTER(1)
+	fallthrough;
 	HANDLE_COUNTER(0)
 	}
 
-- 
2.17.1

