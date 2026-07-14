Return-Path: <linux-mips+bounces-15894-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PI2WIg08Vmrb1wAAu9opvQ
	(envelope-from <linux-mips+bounces-15894-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 15:39:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F03F0755416
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 15:39:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=dXzkpyT0;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15894-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15894-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC3F6305C6DB
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 13:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAD83FADFD;
	Tue, 14 Jul 2026 13:32:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D94657DA;
	Tue, 14 Jul 2026 13:32:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035966; cv=none; b=MJg+cPwQ3CN1C2wIXOMZQg9APpmWL/oaAqmct93NQEN4x0P0WatIFD0pR+MNGYWlr6Ga5CTgjX9dxRlcHSziIaRzbYTpk+gHrCNv3J+rFxz1Cm5laCrCVaoKUpDGGSoqcEH/u9fz1aMarOS9VyE1BhYRSluzmsNJG5XHKttQLIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035966; c=relaxed/simple;
	bh=GsgHujiBNJpKW06UQzBaU/PBd8o+nyMdE2OdmFkNnCs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=M19I/Xo8KBfu0BK25zLH3yjwBPC36BJLLIRFpqykWJdzMAq3eEziuHXo7GyiDhq7AeEZExqhBFaluuSkUnyPhQCgG2f2tAG+9hqRMo+N/CCkYkVJoYqpMv53hxd9Pz+DGfCXPbHCFST6y6NHFqjRauDNsIvBdu71EknhpRBsJ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dXzkpyT0; arc=none smtp.client-ip=162.62.57.252
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784035959; bh=ZqEO/z6YEkWBhWY4wN4MgMb0Pt/YVr8jLvhFwv5n570=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dXzkpyT0dbllpDydEJqaNX1ZgOHEz+mhhMI3hlA6X/rDNbj14FExVeWLa/6Ld869r
	 goIDhqUS2/X8NMTuWfwfMmjhUG/2imkm2+1drxkyUFS5cebThHBAiexVyLHpUWL7h5
	 QmIWMAa79Bavzf8YP2J5VH9TnmC0WuEQZ/PgQZxc=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7D5A9C39; Tue, 14 Jul 2026 21:31:21 +0800
X-QQ-mid: xmsmtpt1784035882t2pnv3uk8
Message-ID: <tencent_C245DB15F66403C1D9EA90BC06987A016509@qq.com>
X-QQ-XMAILINFO: NsBBv6AnqV8OKtR1o+3aEXajI7MGfn/JvzwpgweyxOGiVlu/WtUPYn5Msdtq44
	 KYlnZKV2DtV0vBeOnWMaWhzPpLVt/3QHY6xdk0dqmCuFm6wl4BfGAOtdFNsbQkAcok49U5yr6paA
	 Cyr8M2xA4LZ+bEJuczWeciypGtDyaXcysuZN8fUSoancUiuO2RhB1Hj9jaNXBKA85PFGhbl6A3kl
	 ikt4N6sPrAembactNbIcvM4x7qa0ZA5N5Ja20gUIR+is8skh1orFKpOPaA8kN3MqrhugQBXiTS74
	 mhn63IYUG0VSm7B8yNv9outjGShO49VlH8G39T+pRkHXN6I4EXUK2PJ9zPpNXm0ZnziG36xH2Zcg
	 jCty/M4pHaUBmsJAXxkqJCdqvk4P8DPG812V4WBijiYJUOjaoUP4y6H20HJTTcdziKq3zElRKpik
	 qnV5yFi3K7RvERXnRymKw1nhroQ8cvCd41xt3wRk38w5tUWBVMBpu3qICsanNnMfMhg6EBliXL+n
	 CFKUALSvo+o+IDvXmIn6AC14IryBc/VAaWjdmglf2I4NTYO4zJfDIqQBBuAwku8/gpAC0n0XL2Vg
	 0MAF/bdDTF1YWR5ZH6Bvg5d9CvYm+E2U48jzhTwiBKCkUYQJHt5xp4/XgR5aNY6AbIRFafdxB+dC
	 1ZASl5xXwl6wiAXZUllC+wFFVjiTCCuPK3Kq9kkcSZEIqc2BuLd6Yp4gDRKqL1s1TwUTOD09rMEr
	 6tPG8IcNRkOR+hZ9AtRfZH4dCIdnoT3leP39BpQGeO5t+zr6M8jWKR6eZD2hlJY7Pyt1RAdHopLE
	 2GWjFr9znq6nnxcZ0uG8Es4qb3kx0JkM7mxbReto5vXCkA+yfl6pDRyosVsGeZTeU51rfYQCXeuF
	 HP1yv08UwvwaGhoxXHu0tfLAlwX6EMT+T+dYBVpP/Q1xQGm6UuYhnkQb19Yk66P83ZNFtG8NsLtp
	 9Mne2Ck0ig1IS5QKWRca3IZWcCiC91LxopEvfZeoZ0/57ANHlHtyj9nib3oOo47uJXiNiII3ij/r
	 s1lBZBZPTEDxrmV50ZaKRkm4eRl7fHqZM3gimvwC7IRn6Iv08UD5UxJad5D2Tgd/5osYjDEQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Haofeng Li <920484857@qq.com>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 16/16] irqchip/bcm7120-l2: fix parent IRQ count error handling
Date: Tue, 14 Jul 2026 21:24:52 +0800
X-OQ-MSGID: <20260714132453.3302672-14-920484857@qq.com>
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
	TAGGED_FROM(0.00)[bounces-15894-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:13266079573@163.com,m:lihaofeng@kylinos.cn,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:maz@kernel.org,m:linux-mips@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[920484857@qq.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com,kylinos.cn,broadcom.com,kernel.org,lists.infradead.org];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qq.com:from_mime,qq.com:dkim,qq.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F03F0755416

From: Haofeng Li <lihaofeng@kylinos.cn>

When platform_irq_count() fails or returns zero, probe reported -ENOMEM
even though no memory allocation failed. Negative values such as
-EPROBE_DEFER were also discarded, which breaks deferred probe.

Propagate negative errno from platform_irq_count(), and return -EINVAL
only for a zero parent interrupt count.

Fixes: 3ac268d5ed22 ("irqchip/irq-bcm7120-l2: Switch to IRQCHIP_PLATFORM_DRIVER")
Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-bcm7120-l2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
index a98f0ee46b6c..9f412c0be6d7 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -225,9 +225,13 @@ static int bcm7120_l2_intc_probe(struct platform_device *pdev, struct device_nod
 		return -ENOMEM;
 
 	data->num_parent_irqs = platform_irq_count(pdev);
-	if (data->num_parent_irqs <= 0) {
+	if (data->num_parent_irqs < 0) {
+		ret = data->num_parent_irqs;
+		goto out_unmap;
+	}
+	if (!data->num_parent_irqs) {
 		pr_err("invalid number of parent interrupts\n");
-		ret = -ENOMEM;
+		ret = -EINVAL;
 		goto out_unmap;
 	}
 
-- 
2.25.1


