Return-Path: <linux-mips+bounces-13163-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH7AMrpPjGmukgAAu9opvQ
	(envelope-from <linux-mips+bounces-13163-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 10:45:30 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26738122E2B
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 10:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 984693037E65
	for <lists+linux-mips@lfdr.de>; Wed, 11 Feb 2026 09:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9644135E528;
	Wed, 11 Feb 2026 09:44:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C4835CB8B;
	Wed, 11 Feb 2026 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803080; cv=none; b=CSAi93G87RwZrZ1LTqe5Q6EDrQADzjXRBxIK5n5sxDS0kClraI4LEH92WK+8MBjMn6CqH6R+9daZ5ulaaA5lVHa94hRJS7Fz7BeB5b6oVtGpLz5rgv4Ba4g1qua6fOFHcfuah+5J0dOlL52BhMTjcUQvte+zpa4ODIWf8jEOOxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803080; c=relaxed/simple;
	bh=1HN2cPbUS4pPX3J4v1/9WHxj98gP6kZDVs/JIRz2XAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlmW35aUQKJK9h6zSvYZ2F/45jU79UmEdOs+O9u8S+ZoQzWhhEXh4yKFyK+Y0q4ZI6B9Sq9kLrJxWlvU4svWePo9nBdXl0IEEqqN7yaIp+g/Z3amylOuybAppBWqgEmXs3kdugtt2TD3vObfFfcPIWbrmjZylDQkjd7J7nEz56c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.168])
	by APP-01 (Coremail) with SMTP id qwCowAAHsm1rT4xph_KtBw--.27918S6;
	Wed, 11 Feb 2026 17:44:20 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 4/7] irqchip/loongson-pch-lpc: add OF init code
Date: Wed, 11 Feb 2026 17:44:05 +0800
Message-ID: <20260211094408.3463916-5-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211094408.3463916-1-zhengxingda@iscas.ac.cn>
References: <20260211094408.3463916-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAHsm1rT4xph_KtBw--.27918S6
X-Coremail-Antispam: 1UD129KBjvJXoW7tr13ZFy8Zr48Jr4kJF13Arb_yoW8uF48pF
	W5Zay3Ar4rJr4Igwn3AF48ArZIvrs5GrW7trWxu3WfAw1DK3ykC3WDCF1qvr4rArW5WFW3
	uF4rtF45CFWUAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0JUQFxUUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	TAGGED_FROM(0.00)[bounces-13163-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 26738122E2B
X-Rspamd-Action: no action

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
index 035c621d1a069..d91e3ba1ad781 100644
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


