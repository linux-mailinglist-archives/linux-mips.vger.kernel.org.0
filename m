Return-Path: <linux-mips+bounces-14304-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFhFHqpG62kmKgAAu9opvQ
	(envelope-from <linux-mips+bounces-14304-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 12:32:10 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D9145D184
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 12:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC2F3301F9B1
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 10:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AC436607C;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1cQZVVt"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF693624CE;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026538; cv=none; b=X83xGWyxEkCwznT1y+imPT3ctybQogKWoDAndIq9m7Sy2iL4fLZUefQ87tZDRwKpWtiF9n84nv9vxd5O7lgZK6kVHZRXxbRPZv/wo1j5iIuQNbMYz3IE0J/Qtw19LgkLNuW0uUNlcvlwYx+9tbdBjEDJNj4dSN+iji/ha8uPxrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026538; c=relaxed/simple;
	bh=w2OdcUuGvAFcyC3dr2r29R4Hfc3DtTG6425fV8EP2nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQTmGtv6v6C0eF9JY2k1N8VPmGe0mNYN+L7k1BhjyuryGbhsr1OyRdxuQ8GkTkjHe45veEwHGy2sCxjghGMNNE2j6hwZEe0Xx+S8GQ1Q41fDg1FVPevFFjeh8ZbqjEm2X6TSXPKbs/uVxTvYeZdtrr7306ZdwC2UZzWKRWsho1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1cQZVVt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA70C19425;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777026538;
	bh=w2OdcUuGvAFcyC3dr2r29R4Hfc3DtTG6425fV8EP2nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u1cQZVVtUqXL+qlNNKyr0huDlM4Y68ifhhXMv28MdrQm6C1R6iq6qBeG2PAHZX4HP
	 0+Bh/KVtmX06Ga9ire2xTXeEqew5MCQYs2AnRKxDaXhQ2eXZvoarFHQNJJ0WbYidxu
	 D5noZ0dbqZkNNMzuFIiMcYocU60JeHIc45aBECGHaKlmfSlo6rsPn+o7qNQ4N018or
	 6S/vplFWG2PTg1Bkbd8rK1wwTvbcJ+zUOq/AeF6reXreK5F0FFjxqHe+o+ggudrmCK
	 qjRF0atPQWNOfmDFkrYrr573VaawzL/bhYEBU3m+xXstr1RSxq22qKALzpAJvbxX+z
	 8xsGB+jwfdS/w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGDmK-0000000AyYb-1r3g;
	Fri, 24 Apr 2026 12:28:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/5] MIPS: ip22-gio: switch to dynamic root device
Date: Fri, 24 Apr 2026 12:28:48 +0200
Message-ID: <20260424102849.2616035-5-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424102849.2616035-1-johan@kernel.org>
References: <20260424102849.2616035-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 11D9145D184
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14304-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Driver core expects devices to be dynamically allocated and will, for
example, complain loudly when no release function has been provided.

Use root_device_register() to allocate and register the root device
instead of open coding using a static device.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 arch/mips/sgi-ip22/ip22-gio.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
index 7b7572d11250..d29067430b44 100644
--- a/arch/mips/sgi-ip22/ip22-gio.c
+++ b/arch/mips/sgi-ip22/ip22-gio.c
@@ -28,14 +28,7 @@ static struct {
 	{ .name = "SGI GR2/GR3", .id = 0x7f },
 };
 
-static void gio_bus_release(struct device *dev)
-{
-}
-
-static struct device gio_bus = {
-	.init_name = "gio",
-	.release = &gio_bus_release,
-};
+static struct device *gio_bus;
 
 /**
  * gio_match_device - Tell if an of_device structure has a matching
@@ -99,7 +92,7 @@ EXPORT_SYMBOL_GPL(gio_release_dev);
 int gio_device_register(struct gio_device *giodev)
 {
 	giodev->dev.bus = &gio_bus_type;
-	giodev->dev.parent = &gio_bus;
+	giodev->dev.parent = gio_bus;
 	giodev->dev.release = gio_release_dev;
 
 	return device_register(&giodev->dev);
@@ -397,11 +390,9 @@ static int __init ip22_gio_init(void)
 	unsigned int pbdma __maybe_unused;
 	int ret;
 
-	ret = device_register(&gio_bus);
-	if (ret) {
-		put_device(&gio_bus);
-		return ret;
-	}
+	gio_bus = root_device_register("gio");
+	if (IS_ERR(gio_bus))
+		return PTR_ERR(gio_bus);
 
 	ret = bus_register(&gio_bus_type);
 	if (!ret) {
@@ -420,8 +411,9 @@ static int __init ip22_gio_init(void)
 			ip22_check_gio(1, GIO_SLOT_EXP0_BASE, SGI_GIOEXP0_IRQ);
 			ip22_check_gio(2, GIO_SLOT_EXP1_BASE, SGI_GIOEXP1_IRQ);
 		}
-	} else
-		device_unregister(&gio_bus);
+	} else {
+		root_device_unregister(gio_bus);
+	}
 
 	return ret;
 }
-- 
2.53.0


