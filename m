Return-Path: <linux-mips+bounces-15890-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ilgbHHk6VmpX1wAAu9opvQ
	(envelope-from <linux-mips+bounces-15890-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 15:32:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4BC7552BA
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 15:32:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=fcGv2ri+;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15890-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15890-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECBDC30ACC5B
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 13:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC4F34EF0F;
	Tue, 14 Jul 2026 13:27:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD43264CB;
	Tue, 14 Jul 2026 13:27:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035634; cv=none; b=K6yNPCeFzU3sa7Ns2hpjGZ8jsKEvOgp+VpDThN83/O0iUGu+kMBm7MbYZ+hN36NTDO/pqIdx7+3n+aAwq0bhUKLBHd5kl2xca5U1QfRY4fJfA1ET36+hAiq+DT5Zh3a2VSE780gnEHNBuG0GhX4fEWGAOf29KqXKj9+TZvOm4Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035634; c=relaxed/simple;
	bh=xIsHOWUKxadvtIEGip6zrjNf+E29BkcfX0rRZGqm9l4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=eauGmOftiZh0v2fNDvBEQbwgwlksiWJw54Qa99PV6bkazUBBiqxkE8v4jXzRk4FW3QyhU8pOYTuSVxIKWxVuOMLNz4d8L9kySTlsRJATVCcvvqnnA30HGEZBCsjLT/A7d/x2z+lqe5MZm4DyoophyKEhvN0MASQA412v+fllkzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=fcGv2ri+; arc=none smtp.client-ip=43.163.128.43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035629; bh=Bkr7bUSX+wY2/1NqyzOVaFukQQvVCQWr1/e9kn3/gj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fcGv2ri+92wtIn1H4eplLFtOuLvJY+jx6d9NPjwOJ219TuIpLK+RFpNcjrK+K+9jn
	 PWCwdUvxfQKtpZ5gTSqCiycor/25Lr/oSl+HPYfQ9tDKDED+0kTOAaNKT7XBO4EJOA
	 L95yI1gtjxR1v5kRQYkxuEXmQjEOvAlV2gx6Umlk=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 6C79CE09; Tue, 14 Jul 2026 21:27:07 +0800
X-QQ-mid: xmsmtpt1784035627tfwpedvel
Message-ID: <tencent_BE6F86AC74FBD69E73A00D9B3552D1C06A06@qq.com>
X-QQ-XMAILINFO: Mp62enUr7azuxsrGGvCPIOOWBS+l4ebWGw+VzhZrAlIVtHfPAORLYL2viIis5L
	 JTAKVeS1LSN0ZY0qg0OOYbuvs0T/SAyj7evdpa9ukbGVzowWYFygADl2bCBiuedd/US+zUFSImd0
	 LNUo+WxOha6EZ8FkM18+ZbLcO8GfIelpkS6aEgYlirWVP208B3Wv79PYg7qUW9gCeT1v9K7z6v5c
	 TxNmZCTQmmoHcgyY5/RpgE36+ldE0AMG09/kF+jeJNaG/xq/xtSzWmGC3NSBjQ8XS+NZ1v+a+79o
	 wFkRbn6Ft6QPjbq0vlmuqyRLBwKq5gHJAFgL39hWgQYswNpHzmfegLJR4C7ttWUC0ymI1bWd8zTx
	 zuv/8R4Ri0go/nnKwkyn/uYCVP/uEJHg810xfVeiOLo4ldA3iZvKr57Mm8dgmCI8Nlq6TiWJrVPE
	 S0I3P10Pcsz9byiihVkK/MWybE3d51aM2d7m+xe+YEpwPI0z91I4Et3ZPGhLokkKfIoMo3ERr702
	 304V2HE+c1BfE19VFL4U7/0YQD5RoxL8dyl3pVyHJLE/ZI1ioSm8YBBbSA+AfO4Ux/9r93QRZv7S
	 bFFZ46EK+qj2M3nVGcsYHUThyAJUHZcoeOS1SS/rSMmlQN5FIZO4Q48UPxGiW80DUvq9Y9j1SlK6
	 ZWBY05abY/hBsrgtUqe1ntgrafrTred+4QaSVvyMgU5aMUqFCknO0wRrJsShsdXF1J0CQCeFT+Ls
	 BAQrAyPATRDZFiCEEtX6EDpb876j2lOslmtIygP1FJidYewTTBKzNu8ZE89ciYqAsyRYllcFWWbv
	 Gd/Ys9lZdgDmUvY6UJMfqJva4nwcn6oD3hXAUNEj5WSPwpJVlK7qjkgAC/WTsnRr5InH47EXF4zd
	 ZokIeb/2YhHWW9a6HMAPRZ0vknkVqYyd3+Y+J7jCCK7yXTcqvm3GMCPFGiYgWlvBvCGlsaIS7GCj
	 zEoIjPjlI8oUf2fmNxwR1HNV/qtZqg5H0UEsyYdEQYkpDfXIPz3P0Jm4EFHAxrIxCF8CuKd08NwW
	 DmkAOAiBA66CRoS7fEfO7mf9BrLaowOUCoiyM1ClAAhlsCiOMPwldOt0ZJ/3ZPywx5mmo4HKuAjt
	 k0RCN6
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	linux-mips@vger.kernel.org
Subject: [PATCH 07/16] irqchip/mips-gic: clean up IRQ domain creation failure
Date: Tue, 14 Jul 2026 21:24:43 +0800
X-OQ-MSGID: <20260714132453.3302672-5-920484857@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15890-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:13266079573@163.com,m:lihaofeng@kylinos.cn,m:tsbogend@alpha.franken.de,m:maz@kernel.org,m:paulburton@kernel.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[920484857@qq.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com,kylinos.cn,alpha.franken.de,kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qq.com:from_mime,qq.com:dkim,qq.com:mid,kylinos.cn:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD4BC7552BA

From: Haofeng Li <lihaofeng@kylinos.cn>

After mapping the register base, irq_domain_create_simple() failure
returns without unmapping it.

The CPU chained or VEIC handler is also installed before either IRQ
domain is ready. Unmapping the registers while that handler remains
published would leave a path to unmapped MMIO, and a later IPI domain
failure would expose a half-initialized controller.

Unmap and clear the register base when primary domain creation fails,
and publish the CPU interrupt handler only after both domains have
been created successfully.

Fixes: fbea754123ae ("irqchip: mips-gic: Inline __gic_init()")

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-mips-gic.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 19a57c5e2b2e..85fe0d8a34c5 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -956,23 +956,14 @@ static int __init gic_of_init(struct device_node *node,
 	gic_shared_intrs = FIELD_GET(GIC_CONFIG_NUMINTERRUPTS, gicconfig);
 	gic_shared_intrs = (gic_shared_intrs + 1) * 8;
 
-	if (cpu_has_veic) {
-		/* Always use vector 1 in EIC mode */
-		gic_cpu_pin = 0;
-		set_vi_handler(gic_cpu_pin + GIC_PIN_TO_VEC_OFFSET,
-			       __gic_irq_dispatch);
-	} else {
-		gic_cpu_pin = cpu_vec - GIC_CPU_PIN_OFFSET;
-		irq_set_chained_handler(MIPS_CPU_IRQ_BASE + cpu_vec,
-					gic_irq_dispatch);
-	}
-
 	gic_irq_domain = irq_domain_create_simple(of_fwnode_handle(node),
 						  GIC_NUM_LOCAL_INTRS +
 						  gic_shared_intrs, 0,
 						  &gic_irq_domain_ops, NULL);
 	if (!gic_irq_domain) {
 		pr_err("Failed to add IRQ domain");
+		iounmap(mips_gic_base);
+		mips_gic_base = NULL;
 		return -ENXIO;
 	}
 
@@ -980,6 +971,17 @@ static int __init gic_of_init(struct device_node *node,
 	if (ret)
 		return ret;
 
+	if (cpu_has_veic) {
+		/* Always use vector 1 in EIC mode */
+		gic_cpu_pin = 0;
+		set_vi_handler(gic_cpu_pin + GIC_PIN_TO_VEC_OFFSET,
+			       __gic_irq_dispatch);
+	} else {
+		gic_cpu_pin = cpu_vec - GIC_CPU_PIN_OFFSET;
+		irq_set_chained_handler(MIPS_CPU_IRQ_BASE + cpu_vec,
+					gic_irq_dispatch);
+	}
+
 	board_bind_eic_interrupt = &gic_bind_eic_interrupt;
 
 	/*
-- 
2.25.1


