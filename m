Return-Path: <linux-mips+bounces-14081-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGRcILxn1GnptgcAu9opvQ
	(envelope-from <linux-mips+bounces-14081-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Apr 2026 04:11:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D57AC3A8E6F
	for <lists+linux-mips@lfdr.de>; Tue, 07 Apr 2026 04:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1677E3030C8E
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2026 02:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F9B2236EE;
	Tue,  7 Apr 2026 02:10:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE5F274641;
	Tue,  7 Apr 2026 02:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775527833; cv=none; b=HqXnbaW5kwGagF9gSv9q2VplRvtCptfA51Hqm47PNkbH0GdDh7UA0krhbZtVr7phSWXYd1AkopfqYEknDOZ3GBhV28mDzcNtvUH3ufeuOtUMbwZ3sPR0O7L+Yoc2RnxkD3WJvgd5MBUXRRK+6mBWMx1NoHaud3h8QzoDTvq/0Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775527833; c=relaxed/simple;
	bh=3rvjttkEyQweBqVRbv41mv3Esj93jRPuU6FzMPkFkYM=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=ge73UFhb9ERu5URtC43lagej7pQ8rOoq7WrsP1FGm3uzd9XT/IDWUH/DiMobYdCVnLR0YFEIv46dIVtF6PR9Xu9z8h3iAUIjNW2p6JIMqhFQdd652WX9ksxagFh8JBrfQD+l/Ep1IM5FBqQ1MMbjV03q6gHjoRXb8Jhzx7kLFRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0002-mips-dt-bootargs-v2.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowABnC2eRZ9Rpt7R2DA--.63235S2;
	Tue, 07 Apr 2026 10:10:25 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Tue, 7 Apr 2026 09:57:03 +0800
Message-ID: <20260407120002.2-mips-dt-bootargs-v2-pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Sergey Shtylyov <sergei.shtylyov@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260403161001.1-mips-dt-bootargs-pengpeng@iscas.ac.cn>
References: <20260403161001.1-mips-dt-bootargs-pengpeng@iscas.ac.cn>
Subject: [PATCH v2] MIPS: validate DT bootargs before appending them
X-CM-TRANSID:qwCowABnC2eRZ9Rpt7R2DA--.63235S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy7uw18KF4xur17KF47twb_yoW8GF17pa
	yqka1DXrs8ZFy7Ja45Ar1Yvr45Xws3Jry7GFyqg3yvv3WaqryDXrsagrnFvr12vrWI93Wa
	9FWYgrW5CayavrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjiID7UUUU
	U==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TAGGED_FROM(0.00)[bounces-14081-lists,linux-mips=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,iscas.ac.cn];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_SPAM(0.00)[0.388];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D57AC3A8E6F
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
Changes since v1:
- use strnlen() instead of memchr() for the local NUL-termination check

arch/mips/kernel/setup.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index f9b228e33f3b..1ae6d0c0e1d6 100644
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
+		if (strnlen(p, l) >= l)
+			return 1;
+
 		bootcmdline_append(p, min(l, COMMAND_LINE_SIZE));
 		*dt_bootargs = true;
 	}
-- 
2.50.1 (Apple Git-155)


