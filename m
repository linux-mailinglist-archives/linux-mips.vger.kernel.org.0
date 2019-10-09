Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A494D1228
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 17:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbfJIPLF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 11:11:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:54086 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731593AbfJIPLF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 11:11:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D6BBFAD6D;
        Wed,  9 Oct 2019 15:11:03 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: fw: sni: Fix out of bounds init of o32 stack
Date:   Wed,  9 Oct 2019 17:10:56 +0200
Message-Id: <20191009151056.32289-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use ARRAY_SIZE to caluculate the top of the o32 stack.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/fw/sni/sniprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/fw/sni/sniprom.c b/arch/mips/fw/sni/sniprom.c
index 8772617b64ce..80112f2298b6 100644
--- a/arch/mips/fw/sni/sniprom.c
+++ b/arch/mips/fw/sni/sniprom.c
@@ -43,7 +43,7 @@
 
 /* O32 stack has to be 8-byte aligned. */
 static u64 o32_stk[4096];
-#define O32_STK	  &o32_stk[sizeof(o32_stk)]
+#define O32_STK	  (&o32_stk[ARRAY_SIZE(o32_stk)])
 
 #define __PROM_O32(fun, arg) fun arg __asm__(#fun); \
 				     __asm__(#fun " = call_o32")
-- 
2.16.4

