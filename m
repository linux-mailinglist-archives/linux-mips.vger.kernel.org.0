Return-Path: <linux-mips+bounces-14046-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBoEBcDJ0WmaNQcAu9opvQ
	(envelope-from <linux-mips+bounces-14046-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 763DA39D1E7
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 402F2300F7AD
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 02:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A16330B0B;
	Sun,  5 Apr 2026 02:32:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD7E2E54BD;
	Sun,  5 Apr 2026 02:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775356335; cv=none; b=u8Co+djHrnOJwPitULGgxfpWX6Lm9bxYcUGZ9Zs3r1qdYW0fIt3eWxE1vaFWunsso8rIU8VHZ4DKqDycmn2IIfTVvJBb47OwsQ7iChUo6cs/Gimck4+QgBp9kDTCUbi3hpUKBEuYvQaQa4M6VohWfkScFiUhWxq56xdNfmoXgaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775356335; c=relaxed/simple;
	bh=o8tpt0xiu/9W7EHac9jvTdqQn69rVebqf9ZyZpFccG8=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=XSTAeWY4fG9BPwcDoKdXyI5ACyEuxaNItjXZ941UaxH4AMAr9gOfTE5Z09o8VE72ISTTZ9WKIuhv9CYT8z9lvbqkzQIJrPgWl0LANsRJBAi0bk0vM0TgjiBra90RT2V3vr9Pnq0+/4if7NNFM6wgK3qxAoG8ZNullLSP5AY1QPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0006-MIPS-cavium-octeon-bound-default-console-command-lin.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowADnkGyrydFpX1U5DA--.16555S2;
	Sun, 05 Apr 2026 10:32:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sat, 4 Apr 2026 22:06:17 +0800
Message-ID: <20260405102006.6-mips-cmdline-pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
References: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
Subject: [PATCH 6/8] MIPS: cavium-octeon: bound default console command-line
 append
X-CM-TRANSID:qwCowADnkGyrydFpX1U5DA--.16555S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWUKw18uw43Xr45ArW3Awb_yoWktFcEqr
	9Ikay5AFW5Ja429F4xWryrt3yIk3yjq3Z3Jr1jyr4Fy3srJwsxCFZ5KFZ5Jr4jkFsrGr4f
	C3yDAr47AFsF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vE77IFxVW8XVW5AwA2ocxC64kIII0Yj4
	1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v
	4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfU089NUUUUU
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14046-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 763DA39D1E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

setup_octeon_cmdline() already bounds most copied firmware arguments,
but the fallback default console append still uses unchecked strcat(). If
the command line is already near the end of the fixed buffer, the default
console string can run past the buffer boundary.

Use bounded concatenation for the default console fallback.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/mips/cavium-octeon/setup.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 1ad2602a0383..87f34bc20896 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -898,9 +898,11 @@ void __init prom_init(void)
 
 	if (strstr(arcs_cmdline, "console=") == NULL) {
 		if (octeon_uart == 1)
-			strcat(arcs_cmdline, " console=ttyS1,115200");
+			strlcat(arcs_cmdline, " console=ttyS1,115200",
+				COMMAND_LINE_SIZE);
 		else
-			strcat(arcs_cmdline, " console=ttyS0,115200");
+			strlcat(arcs_cmdline, " console=ttyS0,115200",
+				COMMAND_LINE_SIZE);
 	}
 
 	mips_hpt_frequency = octeon_get_clock_rate();
-- 
2.50.1 (Apple Git-155)



