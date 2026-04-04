Return-Path: <linux-mips+bounces-14043-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBETK7TJ0WmaNQcAu9opvQ
	(envelope-from <linux-mips+bounces-14043-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D50F39D1CC
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64801300CE79
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 02:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D789327C09;
	Sun,  5 Apr 2026 02:32:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F9C1FF7C8;
	Sun,  5 Apr 2026 02:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775356334; cv=none; b=oeAaU2rmAzGFqEumRXhExY9l7fMvheGgT4hoI+3NyQYkYTvNcnx0aglgdpQ08FZ6d88/Oaq06TD3DM8zfad6ZdARcfbK3eNyF33vcZguyr1vlbT7pkkak+RBHXS0bfZisY/tI4MLv9twdCVfqSc7b8EWjDflIKx1L4kLjGEbRQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775356334; c=relaxed/simple;
	bh=Q84Y8fu+kq+dKV65V1nC7y2jkclD1Fyfp2VvcEVqDFQ=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=Zovxu0a4tJ9iMRqmwM//k5ZHHSOM9L9Npxki74AQ/DItnAIXh5anndx/6iPEiVfOVXecb1XopTelrV8T6JlYZGqOrq9mtoK0XQf7ZiikItEQ/hbgRCM1B+ulVN7USA7z5x/+HIIUAnTb2xrqujEBZ4IVCYUgOui4IT247F7l2mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0002-MIPS-sni-bound-PROM-command-line-appends.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowACnTGiqydFpTVU5DA--.4655S2;
	Sun, 05 Apr 2026 10:32:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sat, 4 Apr 2026 22:06:16 +0800
Message-ID: <20260405102002.2-mips-cmdline-pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
References: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
Subject: [PATCH 2/8] MIPS: sni: bound PROM command-line appends
X-CM-TRANSID:qwCowACnTGiqydFpTVU5DA--.4655S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWrXr45ZFW5urW3Ww1kGrg_yoWkZFcE9r
	90g3WrZrWfWFnrXan3u34Fqryava98KF9xtrs8tryrAry3Aa1fGrWrGrWfZr4UGr97Cr15
	tFn7Jr1ayr1akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vE77IFxVW8XVW5AwA2ocxC64kIII0Yj4
	1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v
	4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfU5oGQDUUUU
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14043-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 4D50F39D1CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

prom_init() copies SNI PROM arguments into arcs_cmdline with unchecked
strcat() calls for both the argument text and the separating spaces. A
long enough PROM command line can therefore overflow the fixed kernel
command-line buffer during boot.

Use bounded concatenation for the copied arguments and separators.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/mips/fw/sni/sniprom.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/mips/fw/sni/sniprom.c b/arch/mips/fw/sni/sniprom.c
index 74975e115950..61f4b9f70d30 100644
--- a/arch/mips/fw/sni/sniprom.c
+++ b/arch/mips/fw/sni/sniprom.c
@@ -142,8 +142,12 @@ void __init prom_init(void)
 
 	/* copy prom cmdline parameters to kernel cmdline */
 	for (i = 1; i < argc; i++) {
-		strcat(arcs_cmdline, (char *)CKSEG0ADDR(argv[i]));
-		if (i < (argc - 1))
-			strcat(arcs_cmdline, " ");
+		if (strlcat(arcs_cmdline, (char *)CKSEG0ADDR(argv[i]),
+			    COMMAND_LINE_SIZE) >= COMMAND_LINE_SIZE)
+			break;
+		if (i < (argc - 1) &&
+		    strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE) >=
+		    COMMAND_LINE_SIZE)
+			break;
 	}
 }
-- 
2.50.1 (Apple Git-155)



