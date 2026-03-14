Return-Path: <linux-mips+bounces-13635-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEubOnuNtWmX1wAAu9opvQ
	(envelope-from <linux-mips+bounces-13635-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 17:31:55 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE0128DE88
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 17:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67E27305C4A7
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 16:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96BA2DEA8C;
	Sat, 14 Mar 2026 16:29:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DDE2BCF68;
	Sat, 14 Mar 2026 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773505753; cv=none; b=EYYxHwc/7ZGKM1AWzeXh2jc9UjJmwSMxdpSbsHqbw6Im0QO4CsE5RnQEKaHEyqIq51njBlpuAa3lOzbgYDFjO0lhJNaNCCgd29aF7UQpeHAKyHIc1Z+Z29nqRFZ1gAH7GaskvyKBPQLFqVQ5yim2a5sDDSr/DIU/S3HoYMXJ86k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773505753; c=relaxed/simple;
	bh=PqgYLsxxHf/EwFryPpSBbRFtMIMaSoX/1rNimV2z5Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csaP5l/XdCbQ9B4aq6sudr1kPukZBqwktN6OBNZPYmH7qzY5mKDWaPpvHtjeKGIDUVTXsRt6qHf+uJEFP+IConHzE31gvarfOrXiHNfrrBntyV9sox5ZlKKwCjgRAJaMyg0q266n3EZtQV1JxjqKod9dfPVfPoT12oBZMER26qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.43])
	by APP-03 (Coremail) with SMTP id rQCowAB3ktmwjLVpHpqpCg--.41252S7;
	Sun, 15 Mar 2026 00:28:59 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 5/8] irqchip/loongson-pch-lpc: add OF init code
Date: Sun, 15 Mar 2026 00:28:25 +0800
Message-ID: <20260314162828.1055188-6-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAB3ktmwjLVpHpqpCg--.41252S7
X-Coremail-Antispam: 1UD129KBjvJXoW7tr13ZFy8Zr48Jr4Duw1UGFg_yoW8uF48pF
	W5Zay3Ar4rJF4Igwn3AFW8ArZIvr4rGrW2krWxC3WfAw1DKrWkC3WDCF1qvr4rArW5WFW5
	uF4rKF45CFWUAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4U
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x0JUQFxUUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13635-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flygoat.com:email,iscas.ac.cn:email,iscas.ac.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4CE0128DE88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OF-based MIPS Loongson-3 systems can also have a PCH LPC interrupt
controller.

Add OF-based initialization code for this driver.

Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/irqchip/irq-loongson-pch-lpc.c | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
index 38d05135d2a7c..a3d2c759f6a9d 100644
--- a/drivers/irqchip/irq-loongson-pch-lpc.c
+++ b/drivers/irqchip/irq-loongson-pch-lpc.c
@@ -13,6 +13,8 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/syscore_ops.h>
 
 #include "irq-loongson.h"
@@ -224,6 +226,7 @@ static int __init pch_lpc_init(phys_addr_t addr, unsigned long size,
 	return -ENOMEM;
 }
 
+#ifdef CONFIG_ACPI
 int __init pch_lpc_acpi_init(struct irq_domain *parent, struct acpi_madt_lpc_pic *acpi_pchlpc)
 {
 	struct fwnode_handle *irq_handle;
@@ -251,3 +254,35 @@ int __init pch_lpc_acpi_init(struct irq_domain *parent, struct acpi_madt_lpc_pic
 
 	return 0;
 }
+#endif /* CONFIG_ACPI */
+
+#ifdef CONFIG_OF
+static int __init pch_lpc_of_init(struct device_node *node, struct device_node *parent)
+{
+	struct fwnode_handle *irq_handle;
+	struct resource res;
+	int parent_irq, ret;
+
+	if (of_address_to_resource(node, 0, &res))
+		return -EINVAL;
+
+	parent_irq = irq_of_parse_and_map(node, 0);
+	if (!parent_irq) {
+		pr_err("Failed to get the parent IRQ for LPC IRQs\n");
+		return -EINVAL;
+	}
+
+	irq_handle = of_fwnode_handle(node);
+
+	ret = pch_lpc_init(res.start, resource_size(&res), irq_handle,
+			   parent_irq);
+	if (ret) {
+		irq_dispose_mapping(parent_irq);
+		return ret;
+	}
+
+	return 0;
+}
+
+IRQCHIP_DECLARE(pch_lpc, "loongson,ls7a-lpc", pch_lpc_of_init);
+#endif /* CONFIG_OF */
-- 
2.52.0


