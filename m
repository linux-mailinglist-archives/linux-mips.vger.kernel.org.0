Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A38C2CE124
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 22:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502139AbgLCVrr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 16:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729550AbgLCVrY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 16:47:24 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D4FC061A54;
        Thu,  3 Dec 2020 13:46:43 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkwR0-00GJSS-6u; Thu, 03 Dec 2020 21:46:42 +0000
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 06/10] mips: KVM_GUEST makes no sense for 64bit builds...
Date:   Thu,  3 Dec 2020 21:46:37 +0000
Message-Id: <20201203214641.3887979-6-viro@ZenIV.linux.org.uk>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201203214641.3887979-1-viro@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <20201203214641.3887979-1-viro@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Al Viro <viro@zeniv.linux.org.uk>

it's always been about MIPS32

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2000bb2b0220..32ce052aa3b4 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2179,7 +2179,7 @@ endchoice
 config KVM_GUEST
 	bool "KVM Guest Kernel"
 	depends on CPU_MIPS32_R2
-	depends on BROKEN_ON_SMP
+	depends on !64BIT && BROKEN_ON_SMP
 	help
 	  Select this option if building a guest kernel for KVM (Trap & Emulate)
 	  mode.
-- 
2.11.0

