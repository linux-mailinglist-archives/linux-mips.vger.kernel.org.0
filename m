Return-Path: <linux-mips+bounces-14049-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC5uNNTJ0WmaNQcAu9opvQ
	(envelope-from <linux-mips+bounces-14049-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC2F39D21A
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 730F83014528
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 02:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C29D33509B;
	Sun,  5 Apr 2026 02:32:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2519A30FC12;
	Sun,  5 Apr 2026 02:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775356336; cv=none; b=Ydzl5n4FcuNBvQJt8mEOjiaQ19SSBFuvu+At62QGVsYGufmhtKqMA4MGyNwtECEjs9b26Vu3gbHcWqgyLMa4vGq7d6C8Eva3hBizwIiFxKByOZAzF6dPbYjDWz58RAsQFioluvMnUw2540TeZ0OfM7aJUMyqQgZipsdvMc2SRfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775356336; c=relaxed/simple;
	bh=sTXUOUClMvg0T7pH9rjB7D/Fh8Z746/uk+ulE+Rxn0w=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=MfPlLmxqiklwTFa/4wT5pJoqFpsz29qzJwBa9HSdGmGju2RcKTRGxijrgb5z2CezDldHV+GhpCbu/pT4wT40xmnsRu1S+tUlytiYJcovZ2egsx87oKh9+7WuyOeptXQ6GHbicQYAF7W8S7p3bAYlpFCt3dyJe3LAN5WjpPspzsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0005-MIPS-arc-bound-firmware-command-line-construction.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowABn026qydFpW1U5DA--.24319S2;
	Sun, 05 Apr 2026 10:32:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sat, 4 Apr 2026 22:06:17 +0800
Message-ID: <20260405102005.5-mips-cmdline-pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
References: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
Subject: [PATCH 5/8] MIPS: arc: bound firmware command-line construction
X-CM-TRANSID:qwCowABn026qydFpW1U5DA--.24319S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1rAFy5Zr43Kr18WFyUZFb_yoW8CrWUpF
	12vwsxJF1rXw4jya4UCFW5Z39xuwn5Xw4a93Wjg3yfWF4UJF1rGr4rW39Y9r47Aa4ruFWx
	XF42g3WDJFsavrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK6x804I0_Grv_XF1l8cAvFVAK0II2c7
	xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14049-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 6CC2F39D21A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ARC PROM command-line path appends translated firmware variables and
raw arguments into arcs_cmdline with unchecked pointer arithmetic and
memcpy(). A long enough firmware argument set can overrun the fixed
kernel command-line buffer before boot completes.

Use bounded concatenation for both the rewritten ARC variables and the
remaining PROM arguments.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/mips/fw/arc/cmdline.c | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/mips/fw/arc/cmdline.c b/arch/mips/fw/arc/cmdline.c
index 86b0e377b713..d66a6b8216f2 100644
--- a/arch/mips/fw/arc/cmdline.c
+++ b/arch/mips/fw/arc/cmdline.c
@@ -51,18 +51,20 @@
 			len = strlen(used_arc[i][0]);
 
 			if (!strncmp(prom_argv(actr), used_arc[i][0], len)) {
-			/* Ok, we want it. First append the replacement... */
-				strcat(cp, used_arc[i][1]);
-				cp += strlen(used_arc[i][1]);
+				/* Ok, we want it. First append the replacement... */
+				strlcat(arcs_cmdline, used_arc[i][1],
+					COMMAND_LINE_SIZE);
+				cp = arcs_cmdline + strlen(arcs_cmdline);
 				/* ... and now the argument */
 				s = strchr(prom_argv(actr), '=');
 				if (s) {
 					s++;
-					len = strlen(s);
-					memcpy(cp, s, len + 1);
-					cp += len;
+					strlcat(arcs_cmdline, s,
+						COMMAND_LINE_SIZE);
+					cp = arcs_cmdline + strlen(arcs_cmdline);
 				}
-				*cp++ = ' ';
+				strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
+				cp = arcs_cmdline + strlen(arcs_cmdline);
 				break;
 			}
 		}
@@ -95,10 +97,9 @@
 		}
 
 		/* Ok, we want it. */
-		len = strlen(prom_argv(actr));
-		memcpy(cp, prom_argv(actr), len + 1);
-		cp += len;
-		*cp++ = ' ';
+		strlcat(arcs_cmdline, prom_argv(actr), COMMAND_LINE_SIZE);
+		strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
+		cp = arcs_cmdline + strlen(arcs_cmdline);
 
 	pic_cont:
 		actr++;
-- 
2.50.1 (Apple Git-155)


