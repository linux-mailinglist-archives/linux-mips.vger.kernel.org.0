Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD7C361416
	for <lists+linux-mips@lfdr.de>; Thu, 15 Apr 2021 23:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235093AbhDOV1H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Apr 2021 17:27:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:59506 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234959AbhDOV1H (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 15 Apr 2021 17:27:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 071DAAF31;
        Thu, 15 Apr 2021 21:26:43 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Fix strnlen_user access check
Date:   Thu, 15 Apr 2021 23:26:40 +0200
Message-Id: <20210415212640.14346-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 04324f44cb69 ("MIPS: Remove get_fs/set_fs") changed the access_ok
for strnlen_user to check the whole range, which broke some callers
of strndup_user(). Restore the old behaviour and just check the first byte.

Fixes: 04324f44cb69 ("MIPS: Remove get_fs/set_fs")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/uaccess.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index ab47e597656a..783fecce65c8 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -614,8 +614,8 @@ static inline long strnlen_user(const char __user *s, long n)
 {
 	long res;
 
-	if (!access_ok(s, n))
-		return -0;
+	if (!access_ok(s, 1))
+		return 0;
 
 	might_fault();
 	__asm__ __volatile__(
-- 
2.29.2

