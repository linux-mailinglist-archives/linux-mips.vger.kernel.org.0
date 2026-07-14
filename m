Return-Path: <linux-mips+bounces-15889-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zVkhKhk7VmqW1wAAu9opvQ
	(envelope-from <linux-mips+bounces-15889-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 15:35:21 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C3175535D
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 15:35:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=ybu7UOwG;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15889-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15889-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6E57312A827
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 13:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33C233688A;
	Tue, 14 Jul 2026 13:26:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFAF33120A;
	Tue, 14 Jul 2026 13:26:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035578; cv=none; b=Y9fo261Zg2+ljF2l9VZRBYF44zCG1h6o1wRSIBoZZIYBKDrG4Sq+HW+agA0Ga4B6I0cLOEZ13SoRChHoSkFye8ci8Aur1AQld5EHPBpTSlgM0EIwyYhH0wUrYZd8pnfVDSCaRcPSShVM/joTxFNPbnHvHPDDdXqN4NV1vsEY038=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035578; c=relaxed/simple;
	bh=CDP6p4GWGlX1bN/th8UfrvLvMGYTonsXHB5UwdMc6f0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=b0ijK3/V5pmZlL/MyIJ6a5oeZoZyVY5FuUbC6svSEXq0amZC0nMgnZqBpw6za2K4ZQpoO+m4GTdqOWrPrfZs5x14jnYzsByxfeLLqCOrviinqxpL1/TmQLPx4+cWpDizNYA94vdyxYVPEi9/f4Ybd2vGVLFkcO9tDdplpara1BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ybu7UOwG; arc=none smtp.client-ip=43.163.128.50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035566; bh=aAu4/HgDFwYKCuJy0DbrcEfjWWZCGQSrhyOiOkE1P2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ybu7UOwG0ECZguxzaUJLdCitFrVaXH3plDxp8GahfXVY7Cvm4Gp/YV/lun9MuhH9w
	 0FNdgRoihxLoFJv6PI5zBDWdd/akNEyp5Cvjji99NyGzjBwus65xo+Grkcvm2POa5z
	 zL7Rlb/8H02VsHJVggWCnHRENnartGsrTiVCuh9g=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 683A6032; Tue, 14 Jul 2026 21:26:03 +0800
X-QQ-mid: xmsmtpt1784035563ta33l4h8r
Message-ID: <tencent_4839362F248901E45E50D9AEF6823DFA4007@qq.com>
X-QQ-XMAILINFO: MmXTV/GPeIxT3cmTG7NxYxAJWaDmtqNDgbe/zxgRXEqLMh7QsP1dKYEaH+liHP
	 U5LHB1uKWw1Y19ErzdgDsiVInjfcvdleVzcddnE9ZnxLTFLfp68Y/WKS4nNTEK797+I2YMh7E40M
	 daqYBiucrrwqN+2vYiHjoP+ikLv380TWhGxjaBwKdDi1M/4gSMSJUM4fb2KAdQJdXGR7mUy9CK0Q
	 akX0iidAUXQu19hhG8tPhj/RVr9ZL7qCnVDTrCD7BZQvlauz90oev63zzzOGKt170giB/hFIVb0T
	 LZpqlgqY1i9qJchQVCmaLgKt71QALfHXHSVn8bLpux+mCoTKwiqoPjX5nET32qO7Ibl0LixQIpVw
	 2cwHpGIVfX8upeMhp22+1n794c13Dg1Yecnw5HLoWMzoBVF9jSCLII1XcdDsMX20Ne5pCTZbYUxk
	 YzQE9/uCutFhGV8C+k5NiH9hTwLelMGeogUcP1i+PIwQdsHI0gdWfdmfDI4hsBfhfQ5LmmhvLAeM
	 pDjskIpB2yfwwpzlYS0lwyPUng5kpv0dLKSZUwncZvcFeTeTmaXRC/wbTVV/p723Nv8QwSyPAdng
	 gF08iKNsHmDOMmliZTV7nda/6QAjIjFiqx25PqNMxusTQj9V3AE0UlRqAyOwr1NsD2pwAFHDZbuX
	 /yo0ZCEx4aXLoKMD1npH5k8iCY5kLPzyukxMjMRiMINtxsdhNpKcW/v/nim6RVGUFKLbCv7c/dH6
	 FVa15WkcSdWSgPcwu4v8s2RIoRWT4fEUmQ1fg3EoG/9WiHN+RQt3fKnf3R8a4pZmeeFTrgHWoKPS
	 JbPkMrPotdyfoaZnks8MfBVNUJRZEfhLel0OrM9JUoxQw+ChNt8huV8iHGHKMWiWBUtDIUnbSOwV
	 +6HrIEMb7BBxBJlh9V3tNg77rwQFKPNzgZLESmlTGc2cjZ9/zTfRPuY8GjCpjuTED8Y9SWW2sA2b
	 ViqxCWkxHAn4z8TbFkw8u0+fvFrertWDvs0klHB0PDy0tNheKhIn570DOjrj2NhhaQHUNh+GnH9G
	 BwpgcVAHAb1NPCV25Bqk8GOC7SL1U=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/16] irqchip/bcm7038-l1: clean up init failure paths
Date: Tue, 14 Jul 2026 21:24:41 +0800
X-OQ-MSGID: <20260714132453.3302672-3-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714132453.3302672-1-920484857@qq.com>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <20260714132453.3302672-1-920484857@qq.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15889-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:13266079573@163.com,m:lihaofeng@kylinos.cn,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:cernekee@gmail.com,m:linux-mips@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[920484857@qq.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com,kylinos.cn,broadcom.com,gmail.com,lists.infradead.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[920484857@qq.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,kylinos.cn:email,qq.com:from_mime,qq.com:dkim,qq.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13C3175535D

From: Haofeng Li <lihaofeng@kylinos.cn>

bcm7038_l1_init_one() stores the allocated CPU object in
intc->cpus[idx] before mapping its registers and parent interrupt.
Failures after that allocation leak the CPU object and possibly its
MMIO mapping.

A later IRQ domain allocation failure also frees intc while leaving
parent mappings and chained handlers installed for CPUs initialized
successfully. Those handlers retain intc as their data and can access
freed memory.

Free the current CPU object on local failures. Remember every parent
IRQ so the common error path can disable wake when it was enabled,
remove the chained handler, dispose the mapping, unmap the registers,
and free the CPU object before freeing intc.

Fixes: 5f7f0317ed28 ("IRQCHIP: Add new driver for BCM7038-style level 1 interrupt controllers")

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-bcm7038-l1.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 54a8557ef557..b42c4f4df6bf 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -49,6 +49,8 @@ struct bcm7038_l1_chip {
 
 struct bcm7038_l1_cpu {
 	void __iomem		*map_base;
+	unsigned int		parent_irq;
+	bool			wake_enabled;
 	u32			mask_cache[];
 };
 
@@ -247,8 +249,11 @@ static int bcm7038_l1_init_one(struct device_node *dn, unsigned int idx,
 		return -ENOMEM;
 
 	cpu->map_base = ioremap(res.start, sz);
-	if (!cpu->map_base)
+	if (!cpu->map_base) {
+		kfree(cpu);
+		intc->cpus[idx] = NULL;
 		return -ENOMEM;
+	}
 
 	for (i = 0; i < n_words; i++) {
 		l1_writel(~intc->irq_fwd_mask[i],
@@ -261,12 +266,17 @@ static int bcm7038_l1_init_one(struct device_node *dn, unsigned int idx,
 	parent_irq = irq_of_parse_and_map(dn, idx);
 	if (!parent_irq) {
 		pr_err("failed to map parent interrupt %d\n", parent_irq);
+		iounmap(cpu->map_base);
+		kfree(cpu);
+		intc->cpus[idx] = NULL;
 		return -EINVAL;
 	}
 
-	if (of_property_read_bool(dn, "brcm,irq-can-wake"))
-		enable_irq_wake(parent_irq);
+	if (of_property_read_bool(dn, "brcm,irq-can-wake") &&
+	    !enable_irq_wake(parent_irq))
+		cpu->wake_enabled = true;
 
+	cpu->parent_irq = parent_irq;
 	irq_set_chained_handler_and_data(parent_irq, bcm7038_l1_irq_handle,
 					 intc);
 
@@ -408,7 +418,7 @@ static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *pa
 			if (idx)
 				break;
 			pr_err("failed to remap intc L1 registers\n");
-			goto out_free;
+			goto out_unmap;
 		}
 	}
 
@@ -440,6 +450,12 @@ static int bcm7038_l1_probe(struct platform_device *pdev, struct device_node *pa
 		struct bcm7038_l1_cpu *cpu = intc->cpus[idx];
 
 		if (cpu) {
+			if (cpu->parent_irq) {
+				if (cpu->wake_enabled)
+					disable_irq_wake(cpu->parent_irq);
+				irq_set_chained_handler_and_data(cpu->parent_irq, NULL, NULL);
+				irq_dispose_mapping(cpu->parent_irq);
+			}
 			if (cpu->map_base)
 				iounmap(cpu->map_base);
 			kfree(cpu);
-- 
2.25.1


