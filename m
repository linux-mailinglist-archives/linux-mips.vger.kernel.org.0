Return-Path: <linux-mips+bounces-15891-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Pv4HnM5VmoB1wAAu9opvQ
	(envelope-from <linux-mips+bounces-15891-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 15:28:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 056037551A1
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 15:28:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=Fc9Mj6VZ;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15891-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15891-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 599B630310EC
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 13:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5E833C192;
	Tue, 14 Jul 2026 13:27:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB18320A00;
	Tue, 14 Jul 2026 13:27:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035641; cv=none; b=qJcm+taGWNQm27wkmcOjE8ECxSVWvzdjPmrp6ICHO81mxyj3ODhKKx6FpyxmhqPgjLkyUEp6iGWg7lAhc4iXtTGTZYXVBDZAXWQlB3KJoVWqUeXmpSVjQwKwcFVrARg9RZc4dTfnD1M2FjM+4ENq1gslWT1X0OC6qg5KsiFtks0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035641; c=relaxed/simple;
	bh=4i97sHnRdcBMn80oOpRJUBaNQ2/m+4B5wFnrGzvFdPg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=W7lbvInr7Zx9gRT/24jkesUNmjWYpqfFKnR87kd0cqaOiRAWF5gh71e+TCH8kv8CJrs6MejxIIDKxZVtbKKe0LbUYy8LmpSlJetp78ExM//OfqYBCXiQNXI5ng4UA7M4lb/t/7d5KvS4YyyvV0Knkq9+2NyWEimK54va4j+g0z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Fc9Mj6VZ; arc=none smtp.client-ip=43.163.128.48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035631; bh=wTTgYT/GKI+J9GH5+zU2+pgP2YmoSh3DBk0NqAAJ+RA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fc9Mj6VZEQlH196tP1SsLL3W1nigogmryodgKA/5sloRSmVPvhImEYePhBrId3JG9
	 tjAhi+dwwUxsGp5RaNM0B4MnUY6TnKMXFdrLhwmRH1r1x1Wskigkbk55rjC1E/sRyF
	 Hu305f8QTbp4l86DA/ngtED8Z5/2swxGSt8McVuo=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 6C79CE09; Tue, 14 Jul 2026 21:27:07 +0800
X-QQ-mid: xmsmtpt1784035628toq62m0kn
Message-ID: <tencent_63B40FEEA9049AB3A522A50D2CF58ECA560A@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLwgQ0nK3Q0H2kHigMnu2T6fAf4Q6mlndh10ZmwdS2XRkj2NWveI
	 xa+S5GEuVzESB5WZmjBuHxBCn300L5ZUreQbXxR2Y0716oFGe96AeX8/aOZGkoSXOKiYDfxln+nz
	 vZpUe2Azx5jR1kEcs/uHcuyhpO9MWnPIU3AyPtQNul0X2yC14GuTynOxzSPuPn1if3axqbScJYIJ
	 T92385EpnrF6nl0RPdciuYeGo4jkjsdQFb2jIJGWTWlNqklW4C6OC659LHpcCsj3kQEqB8ZlPSj7
	 C8WbakBoGy5usoJgMe8p50Tfg+nu14u7pH58O9z/wfK05Fm1XelrI8Tgs5H1KhxC8mxCCnvkPoZH
	 mXm9dU5OatZpouzZ71JuExJxxoZEB6ZxGcvKwNKjmk5xvX79sdsu695w6CmfPl/Xl+y8F98VWSvK
	 ut667R9GmCQRxFUykOCetj0TVhofNQypZkJp8w1GJUIjLtkzXIVA/rWJaWLgHZFG6LIieZKVcB3m
	 5hg1Z3dLcn7rnjv+/Wl+hggcMCAyd3FBsXj1++Ss5e1X+weFKEyG1uRCm2eYzUvdjtihConQ+a3I
	 A/efv9dYKl0n3QQsMt8ctkxeMB9+4LQ+m8r6N70ItdX2m/RVA9yqjV4Wr37G1imgbe8dNrzUwR4n
	 BZ07B/jW4AS0V4DDHy7e3DK+oP7QSTiiDylLA873hff1LEywZW0hTrhmpSgkTU3toD9KsW3NsYSG
	 E2P0xwmo5MQOD5BVLt3lHurhTyCILfItv24ddFqazdGZ3mabox4Ygy6iL1087piKzrsXyCAaQ7z9
	 /NnQFohe9sYYPzFdsTp+U0VwTilR7tbgRUQ6zaLFhZ5pHNFAFYO/7poD5C4JgdLKRRZ0E8x7Zj9T
	 oAPAQox3sNDQ558RcEjW0LyOGVWyhFZ5eBULACaH3WFXw8M93vWe0XAexSPP12LK+bFQj/2vyDwz
	 wDCrbEraJGQEhuMY1N4XnqE+Kr4YCHgnS3bGNJAz3NG8o0LB0Q7vJM/MUnvkvGt9zoysE8aztojp
	 mkl2TjL6sch+EEqgb/3qqNX860QIh/iYa+6WpiVWtJPnbY2KVAx9cBDXACO2nylVKcpi8pFFHknR
	 GCaM2p
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Samuel Holland <samuel@sholland.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org
Subject: [PATCH 08/16] irqchip/mips-gic: clean up if IPI domain registration fails
Date: Tue, 14 Jul 2026 21:24:44 +0800
X-OQ-MSGID: <20260714132453.3302672-6-920484857@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15891-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:13266079573@163.com,m:lihaofeng@kylinos.cn,m:tsbogend@alpha.franken.de,m:samuel@sholland.org,m:maz@kernel.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[920484857@qq.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com,kylinos.cn,alpha.franken.de,sholland.org,kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:from_mime,qq.com:dkim,qq.com:mid,kylinos.cn:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 056037551A1

From: Haofeng Li <lihaofeng@kylinos.cn>

If gic_register_ipi_domain() fails, the primary IRQ domain and the
mapped register base are left allocated.

At this point the CPU interrupt handler has not yet been published.
Remove the primary domain, unmap the register base, and clear both
global pointers before returning the error.

Fixes: 8190cc572981 ("irqchip/mips-gic: Only register IPI domain when SMP is enabled")

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-mips-gic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 85fe0d8a34c5..2f2ba54f227f 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -968,8 +968,13 @@ static int __init gic_of_init(struct device_node *node,
 	}
 
 	ret = gic_register_ipi_domain(node);
-	if (ret)
+	if (ret) {
+		irq_domain_remove(gic_irq_domain);
+		gic_irq_domain = NULL;
+		iounmap(mips_gic_base);
+		mips_gic_base = NULL;
 		return ret;
+	}
 
 	if (cpu_has_veic) {
 		/* Always use vector 1 in EIC mode */
-- 
2.25.1


