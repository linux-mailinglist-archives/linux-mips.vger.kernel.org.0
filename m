Return-Path: <linux-mips+bounces-14048-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID91If3J0WmjNQcAu9opvQ
	(envelope-from <linux-mips+bounces-14048-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:33:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00B39D230
	for <lists+linux-mips@lfdr.de>; Sun, 05 Apr 2026 04:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1397B301FF83
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 02:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980D9331A6D;
	Sun,  5 Apr 2026 02:32:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50EA2FFFB8;
	Sun,  5 Apr 2026 02:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775356335; cv=none; b=B81eKvYNgmfLUPKfrHREiycsgeV0q3QF3l/3YsnoNGt5rgMmetl6uCvb60Qs+VnkrespCRfd2WYSTeCOE5Zx2esHWw00QQe4EyU/QJ4ZEIHqGz6txZANX72a8QF0j9167C8Cb6jb9HSSdL5Yt6PpJI3zt6hEgBPUo73bxSNVJWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775356335; c=relaxed/simple;
	bh=Mr+6b5g1Ee3oIEHsmF0nsppOaXNvVIK2S2qJQOH2jvU=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=Lb07XBXhaGa6AEiEBXd5Rg4/BDlDn9zjJnTwtUJGIO2dyclQ7iB8RHAWboqCIjMiNg+X0Me1fO3IAXOpSK4E3g/RGCJOv+SHqj8w/+Yrb3zXgeu3pgSiqAYqE1vKuOO/riJzCPPz6F5uzCy5CJB/CzAo5hsoZSzot1ohYGbU5Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0008-MIPS-malta-setup-bound-pci_clock-command-line-append.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowAAXwWyrydFpYlU5DA--.13510S2;
	Sun, 05 Apr 2026 10:32:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Sat, 4 Apr 2026 22:06:17 +0800
Message-ID: <20260405102008.8-mips-cmdline-pengpeng@iscas.ac.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
References: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn>
Subject: [PATCH 8/8] MIPS: malta-setup: bound pci_clock command-line append
X-CM-TRANSID:qwCowAAXwWyrydFpYlU5DA--.13510S2
X-Coremail-Antispam: 1UD129KBjvJXoWruw4xXFyDXrWfAr1UCFWDCFg_yoW8Jryfpw
	1Y93Wxtwsaq3Wq9a12v3y8XFn09wn5Cryaka4jyayDCa13XF10g3WrKF9FvryUXF4Ivw1U
	XFWqvFyrCF4YvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK6x804I0_Grv_XF1l8cAvFVAK0II2c7
	xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE
	2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjc
	xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr
	0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0JU2Q6JUUUUU=
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14048-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: DD00B39D230
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

pci_clock_check() appends a synthesized pci_clock= option by advancing to
the end of fw_getcmdline() and calling sprintf() in place. If the command
line is already near full, that write can run past the fixed boot
command-line buffer.

Format the option into a small temporary buffer and append it with
bounded concatenation instead.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/mips/mti-malta/malta-setup.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index 816570514c37..07c9f1b9bed7 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -148,10 +148,12 @@ static void __init pci_clock_check(void)
 		return;
 
 	if (pciclock != 33) {
+		char arg[24];
+
 		pr_warn("WARNING: PCI clock is %dMHz, setting pci_clock\n",
 			pciclock);
-		argptr += strlen(argptr);
-		sprintf(argptr, " pci_clock=%d", pciclock);
+		snprintf(arg, sizeof(arg), " pci_clock=%d", pciclock);
+		strlcat(argptr, arg, COMMAND_LINE_SIZE);
 		if (pciclock < 20 || pciclock > 66)
 			pr_warn("WARNING: IDE timing calculations will be "
 			        "incorrect\n");
-- 
2.50.1 (Apple Git-155)



