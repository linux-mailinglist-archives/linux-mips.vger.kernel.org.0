Return-Path: <linux-mips+bounces-14041-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB/1KLHJ0WmaNQcAu9opvQ
	(envelope-from <linux-mips+bounces-14041-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 087B839D1C2
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 965D9300A11F
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 02:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC973264C0;
	Sun,  5 Apr 2026 02:32:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E55B21A;
	Sun,  5 Apr 2026 02:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775356334; cv=none; b=n0hySNo3DOqXUer3TjF2qTEPBkKlzGLA7lCfaOdPiaJ2SZNhzm1pNcG1La2UVbNx8VpzIWr2MoVSJ0ola61NKNW51FFyH6V5zsQH24JXgTmpJMWbSVBTcJetrNCRYhYHpOG5Nwgeqb2ittRJCB0IfdypkK3lmYjo+Cs651AMRFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775356334; c=relaxed/simple;
	bh=v3B7nEQsjXMP6J+5qQ0xcdjje6RSyDrMaKEvBLvBuRM=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=CSfUNC9m/sy18yL9QAP+KvQhPjLrpS7QTmUkr71nqN6Ow7dxyDMYLnke9pbzR01gGROFMI6hzChPOqzrnu2yI2BOHZi32/n1ocbmjGAko3S9/jtQL2jCAmiAzO4LnnPmXIrVcMab1IvGmrMZlmYpjZOvmZ6GsUze6J6jE733RZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0001-MIPS-dec-bound-PROM-command-line-appends.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowAAXwWypydFpQFU5DA--.13509S2;
	Sun, 05 Apr 2026 10:32:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sat, 4 Apr 2026 22:06:16 +0800
Message-ID: <20260405102001.1-mips-cmdline-pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
References: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
Subject: [PATCH 1/8] MIPS: dec: bound PROM command-line appends
X-CM-TRANSID:qwCowAAXwWypydFpQFU5DA--.13509S2
X-Coremail-Antispam: 1UD129KBjvJXoW7XryUAF47AF4DAw48Kw1DAwb_yoW8Jr4Upa
	yYkanxWF1rur47J3s8ZFW5Xay8Zas5WwsI9r1jq34xu3WrXFn5Wr4Fgrs8ur18JrWIvFyx
	ZF429ryUJFyxZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK6x804I0_Grv_XF1l8cAvFVAK0II2c7
	xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUbhvttUUUUU==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14041-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 087B839D1C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

prom_init_cmdline() appends raw firmware arguments into the fixed
arcs_cmdline buffer with strcat() and adds spaces with another unchecked
strcat(). A long enough argument list can therefore run past the end of
the command-line buffer during early boot.

Switch the appends to bounded concatenation so the PROM argument scan
cannot overflow arcs_cmdline.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/mips/dec/prom/cmdline.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/mips/dec/prom/cmdline.c b/arch/mips/dec/prom/cmdline.c
index 3ed63280ae29..954b14c103d2 100644
--- a/arch/mips/dec/prom/cmdline.c
+++ b/arch/mips/dec/prom/cmdline.c
@@ -29,9 +29,13 @@ void __init prom_init_cmdline(s32 argc, s32 *argv, u32 magic)
 		start_arg = 2;
 	for (i = start_arg; i < argc; i++) {
 		arg = (void *)(long)(argv[i]);
-		strcat(arcs_cmdline, arg);
-		if (i < (argc - 1))
-			strcat(arcs_cmdline, " ");
+		if (strlcat(arcs_cmdline, arg, COMMAND_LINE_SIZE) >=
+		    COMMAND_LINE_SIZE)
+			break;
+		if (i < (argc - 1) &&
+		    strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE) >=
+		    COMMAND_LINE_SIZE)
+			break;
 	}
 
 #ifdef PROM_DEBUG
-- 
2.50.1 (Apple Git-155)



