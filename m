Return-Path: <linux-mips+bounces-13063-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA9YIGnPfWlSTwIAu9opvQ
	(envelope-from <linux-mips+bounces-13063-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 10:46:17 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A1266C1642
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 10:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1CD7B3001FBB
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jan 2026 09:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09D1301485;
	Sat, 31 Jan 2026 09:46:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC6275AEB;
	Sat, 31 Jan 2026 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769852771; cv=none; b=M9FAEtyGF3AlXy56txrvXGiXtujdNOAQuNyCMmYnexBNNQ1CcxXIKftDOEIG+qrZsgVPHJhf7t8fJAIQwFkoPzq4cL4xZME6MXCC1mboob7TnilNfCpcQYu0TQOvLcbFSx8j4QblZSphx+2gIiQAGhlbni+zZDLG+Wzy6jbKjGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769852771; c=relaxed/simple;
	bh=F/HOxzCJ+d6erv3pLy8YREVLhjqD+8zeMOqYr1zgLDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWlR5U/GSBIAsecvfqeqth2mtWj5SZxeOszvkP8rVN6qEHSQTSpDmEboxpgQag6bWDDrXUQKq/lmGIbuNm+8TxVGFyZbYpYYi8c4nwbQsD8lab/7/OKYY5zeiyfdt+3Eq77GLHvzoIWIg2gN027lODw7zUotjnH+6cz+ccYYlBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.235])
	by APP-05 (Coremail) with SMTP id zQCowAC3Sw9Rz31p9UgiBw--.57463S3;
	Sat, 31 Jan 2026 17:46:01 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	linux-s390@vger.kernel.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [PATCH 1/8] genirq: reserve NR_IRQS_LEGACY IRQs in dynirq by default
Date: Sat, 31 Jan 2026 17:45:40 +0800
Message-ID: <20260131094547.455916-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
References: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3Sw9Rz31p9UgiBw--.57463S3
X-Coremail-Antispam: 1UD129KBjvJXoW7urWkXFW5Zw17XFWDAr1xGrg_yoW8ZF48pr
	WxWry3W34xJ347Za45Ww1S9a4fua95G342kF9Ikw13Zwn8JrnYv3sa9F45Xr10vrs5GF4Y
	yFya9Fy5Xa4DZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
	UjIFyTuYvjfU8XdbUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13063-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,iscas.ac.cn:mid,iscas.ac.cn:email,flygoat.com:email]
X-Rspamd-Queue-Id: A1266C1642
X-Rspamd-Action: no action

Several architectures define NR_IRQS_LEGACY to reserve a low range of IRQ
numbers for fixed legacy allocations (e.g. ISA interrupts) which should
not be handed out by the dynamic IRQ allocator.

arch_dynirq_lower_bound() exists to enforce this, but today only x86 wires
it up. In the current boot order this typically works because legacy IRQ
domains register early and claim the low IRQ numbers first; however, that
assumption breaks if the legacy controller is probed later.

Make the default arch_dynirq_lower_bound() implementation honour
NR_IRQS_LEGACY by clamping the allocation start to at least that value.

Architectures that do not define NR_IRQS_LEGACY keep the current behaviour
(effectively 0). Arm/PowerPC/MIPS/LoongArch use legacy IRQ domains for ISA
interrupts and benefit from this change. x86 and s390 already provide their
own implementations.

Cc: linux-s390@vger.kernel.org
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
If this change turns out to be problematic for any architecture, we can
always override arch_dynirq_lower_bound() for MIPS and LoongArch only.

BTW it looks that S390 has a arch_dynirq_lower_bound() override that has
the same behavior, but not with the same code. This is why S390
maintainers are Cc'ed by this patch.

 kernel/softirq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/softirq.c b/kernel/softirq.c
index 77198911b8dd4..cdc77d52c36b2 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -1184,5 +1184,5 @@ int __init __weak arch_early_irq_init(void)
 
 unsigned int __weak arch_dynirq_lower_bound(unsigned int from)
 {
-	return from;
+	return MAX(from, NR_IRQS_LEGACY);
 }
-- 
2.52.0


