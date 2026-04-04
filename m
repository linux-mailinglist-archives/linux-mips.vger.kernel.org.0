Return-Path: <linux-mips+bounces-14044-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJg3ArrJ0WmaNQcAu9opvQ
	(envelope-from <linux-mips+bounces-14044-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:26 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCEE39D1E0
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 484CB300F5D6
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 02:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADED5329E6C;
	Sun,  5 Apr 2026 02:32:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAB82571DD;
	Sun,  5 Apr 2026 02:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775356334; cv=none; b=LwJaPpd8PgPOWkvn17LwnqOoYy1G17LH7V+bh52uG+FtbG0A7o1P6+symYDaOJ6e1NWA032tcl3DL4g3CGSuz3Nj7daWq/B7x2Krn+RAHX0ewySQqTkQHFplr5vNY5y4tlZ09zt+mXptdZ6NwyuvY6oJRg9zb1YJeYbTALnuNGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775356334; c=relaxed/simple;
	bh=+qDJvmWI/hbndZ5CqifX8okTd3ayl7svYuprOU7VwMA=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=hPbZ3OmnT8tt9cGxDnizZT1U8Vd3PWC6K4BLm30ZGIYfTwLr9G0EOPApnjtbjZ2Dn62VSSZFFos1TcQiY6UhLurZfTgAM5TPJUeec3gDwUCwm9q9alb0vNaXd/yWVy11xFWyMxSRYIothLKzXc77Nz5z+zuULR6MSHbEYV3T/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0003-MIPS-lemote-2f-bound-machtype-command-line-append.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowACXPWmqydFpUFU5DA--.5750S2;
	Sun, 05 Apr 2026 10:32:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sat, 4 Apr 2026 22:06:16 +0800
Message-ID: <20260405102003.3-mips-cmdline-pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
References: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
Subject: [PATCH 3/8] MIPS: lemote-2f: bound machtype command-line append
X-CM-TRANSID:qwCowACXPWmqydFpUFU5DA--.5750S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Xr4kXFy3Gr4fArWkWr43Awb_yoW8Jr1UpF
	y3uanxWF45Zw47G347uFy5Xw1fu395XwnxZr1avw1Yg3WUWryUWr1rCryDXr48Jr47Za4r
	u3y0kF1UXa47u3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK6x804I0_Grv_XF1l8cAvFVAK0II2c7
	xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUbb_-PUUUUU==
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
	TAGGED_FROM(0.00)[bounces-14044-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: 5FCEE39D1E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mach_prom_init_machtype() appends the synthesized machtype argument to
the fixed arcs_cmdline buffer with a chain of unchecked strcat() calls.
If the PROM command line is already near full, the extra machtype text
can run past the end of the buffer.

Switch the append steps to bounded concatenation.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/mips/loongson2ef/lemote-2f/machtype.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/mips/loongson2ef/lemote-2f/machtype.c b/arch/mips/loongson2ef/lemote-2f/machtype.c
index 9462a3ab57be..359fe7f826b8 100644
--- a/arch/mips/loongson2ef/lemote-2f/machtype.c
+++ b/arch/mips/loongson2ef/lemote-2f/machtype.c
@@ -34,8 +34,10 @@ void __init mach_prom_init_machtype(void)
 		else
 			mips_machtype = MACH_LEMOTE_NAS;
 
-		strcat(arcs_cmdline, " machtype=");
-		strcat(arcs_cmdline, get_system_type());
-		strcat(arcs_cmdline, " ");
-	}
+		strlcat(arcs_cmdline, " machtype=",
+			COMMAND_LINE_SIZE);
+		strlcat(arcs_cmdline, get_system_type(),
+			COMMAND_LINE_SIZE);
+		strlcat(arcs_cmdline, " ", COMMAND_LINE_SIZE);
+	}
 }
-- 
2.50.1 (Apple Git-155)


