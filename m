Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4867E1B47A2
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 16:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgDVOqF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 10:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgDVOqF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Apr 2020 10:46:05 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08419C03C1A9;
        Wed, 22 Apr 2020 07:45:53 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id DCE7D204A1;
        Wed, 22 Apr 2020 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587566752; bh=d4zdAfEVk89xMUtjnc1CAZCW8CYh3ZX5UtenqK1aYyM=;
        h=From:To:Cc:Subject:Date:From;
        b=F1zcTfO8Mux96/JF7N855buoiaKxCULu4jKp1Gy2a3/O6jtiC7+wuyh1Wcwi1Xl5M
         AdaFMHufg6R4ogVoxw2d5VObTM/pEHZRchmnApq4IPei1HphotM9IYUCEOkE5yuunp
         a7BXxIwNhKe0mQolLxDUYNDSHi9GGodkjg+6eBA3COqHTK7DFKGV5oYbMjMbF01tux
         Nd8pqCnlW6MZHIn3Av67xtkQGVXxtlJ7qKa7JRRn15uN+qMJdPprEusNeX5ERTKCJl
         k+0uJg9ySPnO/J8qA+A6tuipD0ZWH9591K7Cdj1Ib5UDSNX4uMXLsu6Wnc9rU2Ak+I
         F9ErtmmLg6JeQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Clear XContext at boot time
Date:   Wed, 22 Apr 2020 22:45:34 +0800
Message-Id: <20200422144535.1253459-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

XContext might be dirty at boot time. We need to clear it
to ensure early stackframe is safe.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/kernel/head.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 351d40fe0859..3b02ffe46304 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -132,6 +132,9 @@ dtb_found:
 #endif
 
 	MTC0		zero, CP0_CONTEXT	# clear context register
+#ifdef CONFIG_64BIT
+	MTC0		zero, CP0_XCONTEXT
+#endif
 	PTR_LA		$28, init_thread_union
 	/* Set the SP after an empty pt_regs.  */
 	PTR_LI		sp, _THREAD_SIZE - 32 - PT_SIZE
-- 
2.26.0.rc2

