Return-Path: <linux-mips+bounces-14023-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFFXLKZVz2llvQYAu9opvQ
	(envelope-from <linux-mips+bounces-14023-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 07:52:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF639138A
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 07:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 674803025F23
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2026 05:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310A136074F;
	Fri,  3 Apr 2026 05:50:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0839221D96;
	Fri,  3 Apr 2026 05:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195409; cv=none; b=FU8kh4FQvVCAWZX4vNeXg4nc4xvX6qxn5XnyAIw1Q3zw/Zs88+i0jM47cencgBNTTSb9+RxZNuF0lhocnmD4IlyuG8ezFaHU05dHtbXk3wSYBFlKJwuCiocWNBsTJmhH2gT/xZ8woj6TBewEp9hrI8GrBBIsfTYolFDp7xRZtbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195409; c=relaxed/simple;
	bh=6hMw2462psJBfcZnHt80dYhSv7lwuzNULzZXeNi9vAU=;
	h=From:Date:Message-ID:To:Cc:Subject; b=OI/+L4934U44uRnNRX8wnhRrFzBf9OwRSfXFFAfy4bhBrebIpaj5xp+bzSJn2QGguKIeCvbucgXteR0okhA1xechWRR8cLi4UoCf6TKyzoJ0ecZXM9V0cE3LCfKVSaBwdCUQS9R/tqg//nviILEYc96toXIWgb20OFCJMdhNv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0001-mips.eml (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAA3VdwLVc9pKYm7DA--.32546S2;
	Fri, 03 Apr 2026 13:50:03 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 13:41:47 +0800
Message-ID: <20260403161001.1-mips-dt-bootargs-pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] MIPS: validate DT bootargs before appending them
X-CM-TRANSID:rQCowAA3VdwLVc9pKYm7DA--.32546S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy7uw18KF4xur17KF47twb_yoW8JFWUpa
	yqkF4DJr4kZFy7J345AF1YvrW5Zws3Jry7KFyqg3ykA3WaqryDXrsa9rnFvr12vrW0k3W5
	uF4Ygry5CayavrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUya14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj6pB7UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14023-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B9DF639138A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

bootcmdline_scan_chosen() fetches the raw flat-DT bootargs property and
passes it straight to bootcmdline_append(). That helper later feeds the
same pointer into strlcat(), which computes strlen(src) before copying.
Flat DT properties are external boot input, and this path does not
prove that bootargs is NUL-terminated within its declared bounds.

Reject unterminated bootargs properties before appending them to the
kernel command line.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/mips/kernel/setup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index f9b228e33f3b..dd7915110820 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -31,6 +31,7 @@
 #include <linux/of_fdt.h>
 #include <linux/dmi.h>
 #include <linux/crash_dump.h>
+#include <linux/string.h>
 
 #include <asm/addrspace.h>
 #include <asm/bootinfo.h>
@@ -541,6 +542,9 @@ static int __init bootcmdline_scan_chosen(unsigned long node, const char *uname,
 
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
 	if (p != NULL && l > 0) {
+		if (!memchr(p, '\0', l))
+			return 1;
+
 		bootcmdline_append(p, min(l, COMMAND_LINE_SIZE));
 		*dt_bootargs = true;
 	}
-- 
2.50.1 (Apple Git-155)


