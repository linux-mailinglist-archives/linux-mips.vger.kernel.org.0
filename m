Return-Path: <linux-mips+bounces-298-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A8F7FB28A
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 08:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAC821C20982
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 07:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D0A1078C;
	Tue, 28 Nov 2023 07:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
X-Greylist: delayed 381 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Nov 2023 23:18:48 PST
Received: from mail.linx-info.com (unknown [121.69.130.50])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id B1F56B7;
	Mon, 27 Nov 2023 23:18:48 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mail.linx-info.com (Postfix) with ESMTP id 1771B3211A9;
	Tue, 28 Nov 2023 15:12:27 +0800 (CST)
X-Virus-Scanned: Debian amavisd-new at linx-info.com
Received: from mail.linx-info.com ([127.0.0.1])
	by localhost (mail.linx-info.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQQD6n4os8vE; Tue, 28 Nov 2023 15:12:26 +0800 (CST)
Received: from linx.. (unknown [172.16.0.253])
	by mail.linx-info.com (Postfix) with ESMTP id A6E683211A2;
	Tue, 28 Nov 2023 15:12:26 +0800 (CST)
From: Wujie Duan <wjduan@linx-info.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wujie Duan <wjduan@linx-info.com>
Subject: [PATCH] Mark symbols static where possible for mips/kernel
Date: Tue, 28 Nov 2023 15:12:25 +0800
Message-Id: <20231128071225.801111-1-wjduan@linx-info.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We get 1 error when building kernel with -Werror=missing-prototypes

Signed-off-by: Wujie Duan <wjduan@linx-info.com>
---
 arch/mips/kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 479999b7f2de..b99c0e9bb5c6 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -435,7 +435,7 @@ int protected_restore_fp_context(void __user *sc)
 	return err ?: sig;
 }
 
-int setup_sigcontext(struct pt_regs *regs, struct sigcontext __user *sc)
+static int setup_sigcontext(struct pt_regs *regs, struct sigcontext __user *sc)
 {
 	int err = 0;
 	int i;
-- 
2.34.1


