Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C289ECD1FD
	for <lists+linux-mips@lfdr.de>; Sun,  6 Oct 2019 15:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfJFNMy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Oct 2019 09:12:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:46298 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726060AbfJFNMx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Oct 2019 09:12:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 44917AD31;
        Sun,  6 Oct 2019 13:12:52 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: include: Mark __cmpxchd as __always_inline
Date:   Sun,  6 Oct 2019 15:12:32 +0200
Message-Id: <20191006131232.12700-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING
forcibly") allows compiler to uninline functions marked as 'inline'.
In cace of cmpxchg this would cause to reference function
__cmpxchg_called_with_bad_pointer, which is a error case
for catching bugs and will not happen for correct code, if
__cmpxchg is inlined.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/cmpxchg.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index 79bf34efbc04..012dcf7046ad 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -153,8 +153,9 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long x,
 extern unsigned long __cmpxchg_small(volatile void *ptr, unsigned long old,
 				     unsigned long new, unsigned int size);
 
-static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
-				      unsigned long new, unsigned int size)
+static __always_inline
+unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
+			unsigned long new, unsigned int size)
 {
 	switch (size) {
 	case 1:
-- 
2.16.4

