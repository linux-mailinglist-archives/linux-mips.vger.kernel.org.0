Return-Path: <linux-mips+bounces-14045-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMlVG8jJ0WmaNQcAu9opvQ
	(envelope-from <linux-mips+bounces-14045-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711739D20B
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E3763013D60
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 02:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31EE32C942;
	Sun,  5 Apr 2026 02:32:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1182A2641C6;
	Sun,  5 Apr 2026 02:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775356334; cv=none; b=Q7WQuQ2RLs+qZfcRJ9y0Yys9VAqVKfvFlYBr7W+DPc9wYCgyD6BckSw5QKG746OFXRzmNDjOBTWt89JTuf/VvBRpY6hlZZJAPmVIg+KVl0cclpLOnw5Xd07KQNBGki+QkfJ8GzGEPt5tn3+W4+fqioSNoOkAWOxk5wx5DBrE5Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775356334; c=relaxed/simple;
	bh=dU7kRVF+PLNa+buREvTTzyrlAeJqIaW1tb+vVqy2+KU=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=fifjdr/nyh4/PBZYLDWM2yFmuhz8lsR2DY+4q3fpLh2tPVHT1bSdmUjsYvgUH0tQF4JMt3bGxFcEoOq2wTrPVVkGgNAW98NoAIgBLekEozN+22Z43/k59Cr4H8+Gkry3oWrk8cEe8TzLgI/7m6UTHEGrnV5Bmx3ncrcyRPS/01o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0004-MIPS-txx9-bound-command-line-reconstruction.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowAB3IW2qydFpWVU5DA--.1593S2;
	Sun, 05 Apr 2026 10:32:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sat, 4 Apr 2026 22:06:17 +0800
Message-ID: <20260405102004.4-mips-cmdline-pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
References: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
Subject: [PATCH 4/8] MIPS: txx9: bound command-line reconstruction
X-CM-TRANSID:qwCowAB3IW2qydFpWVU5DA--.1593S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyUJFW8JFW8tF45WFykKrg_yoW8Ar13pF
	WUuanxWF1ruw4xJay8Za98Xw43Zwn3XwsIvw1Yqw4Dua1UAr1xCr4Fgw48Zrn7Jay8uF4r
	ZF43KF1jqF1xuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK6x804I0_Grv_XF1l8cAvFVAK0II2c7
	xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUj2YLDUUUUU==
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
	TAGGED_FROM(0.00)[bounces-14045-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 0711739D20B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The early txx9 command-line builders rebuild arcs_cmdline with repeated
strcat() calls when quoting PROM arguments and when reinserting filtered
arguments after preprocessing. Those append chains do not track the
remaining space in the fixed command-line buffer.

Convert the rebuild steps to bounded concatenation so long firmware
arguments cannot overflow arcs_cmdline.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/mips/txx9/generic/setup.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 6c5025806914..715059d5101e 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -128,13 +128,13 @@ static void __init prom_init_cmdline(void)
 	for (i = 1; i < argc; i++) {
 		char *str = (char *)(long)argv32[i];
 		if (i != 1)
-			strcat(arcs_cmdline, " ");
+			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
 		if (strchr(str, ' ')) {
-			strcat(arcs_cmdline, "\"");
-			strcat(arcs_cmdline, str);
-			strcat(arcs_cmdline, "\"");
+			strlcat(arcs_cmdline, "\"", COMMAND_LINE_SIZE);
+			strlcat(arcs_cmdline, str, COMMAND_LINE_SIZE);
+			strlcat(arcs_cmdline, "\"", COMMAND_LINE_SIZE);
 		} else
-			strcat(arcs_cmdline, str);
+			strlcat(arcs_cmdline, str, COMMAND_LINE_SIZE);
 	}
 }
 
@@ -227,8 +227,8 @@ static void __init preprocess_cmdline(void)
 			continue;
 		}
 		if (arcs_cmdline[0])
-			strcat(arcs_cmdline, " ");
-		strcat(arcs_cmdline, str);
+			strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
+		strlcat(arcs_cmdline, str, COMMAND_LINE_SIZE);
 	}
 
 	txx9_cache_fixup();
-- 
2.50.1 (Apple Git-155)



