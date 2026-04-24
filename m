Return-Path: <linux-mips+bounces-14303-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPkpE+1F62m4KQAAu9opvQ
	(envelope-from <linux-mips+bounces-14303-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 12:29:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F345D0D7
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 12:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 511BC3002314
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 10:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E219136605D;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phMuGqey"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A03659EE;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026538; cv=none; b=iSUUeJH36AZ6fMm9HdtptdxoB2hDaoLz69YV3VxzA1C6grkwDtjXdqGA6cnim5Pk1lqh3Qc+p2aTRepGjwkWo7CTojsveqhNIjVzxWcn1UAv1BxxLTYSy/1d9uLLRSIFqe/ww/cp3d2K9cnCNnZh6iLQpX5PXJ92nrY3SzfsiAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026538; c=relaxed/simple;
	bh=z6jQiS7MBBek79gvin91VtA4F7jVQKv7lYbFngaMz8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lM5VMatyOyKviI6vmm8Pck6+UI0I5nH4u1G/w9t8+G1oEdTmNIosOKKRLjB850rZA/GmUlYFc/Ue4S6ReRZ8XvgCpOjvipK6U4n8tUaLfqERU5wHX1ElY567LYgP1SmWMAtAtENXonISKtcaQkBminJeNNBeo8LnsOWiLti7TCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phMuGqey; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86758C2BCB7;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777026538;
	bh=z6jQiS7MBBek79gvin91VtA4F7jVQKv7lYbFngaMz8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=phMuGqeyha5WGtbZskVC2dfkaVg1Q0IJDuUBLwxr2N1Rj/RybqcqL5AJ3/QQ2qU84
	 gW73bjHiwO9+dmmK2o7LC2fk27gM/ySDmhkRLeu1xp0DLBpY6sf5SM+vFRaP8JkO6O
	 OX8RZlUj1OuMscYDNAmF6D0XFiFwr7fr/oGwqemUWfJsrdZ8tvH8/u4FmlXC1L/vyw
	 0nL038SuihLxTe4fvf6k7b+EeA03WcL/d1LlaJxnVbI3Yhy4xlU40nTSbCAoETAQM5
	 +e5Ut+kdAGdwA75fx2WM5bNjmMicik7DsaXQDoIn0MIdWTDe238LpOEthhLRrr9fvr
	 J85GlzVktiFMw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGDmK-0000000AyYd-1tQk;
	Fri, 24 Apr 2026 12:28:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/5] MIPS: ip22-gio: do not export device release function
Date: Fri, 24 Apr 2026 12:28:49 +0200
Message-ID: <20260424102849.2616035-6-johan@kernel.org>
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
X-Rspamd-Queue-Id: E59F345D0D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14303-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

There is no need to export the gio device release function as the
devices are reference counted.

Drop the export along with the unused inline wrapper.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 arch/mips/include/asm/gio_device.h | 6 ------
 arch/mips/sgi-ip22/ip22-gio.c      | 3 +--
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/gio_device.h b/arch/mips/include/asm/gio_device.h
index 159087f5386e..f9c102f038d6 100644
--- a/arch/mips/include/asm/gio_device.h
+++ b/arch/mips/include/asm/gio_device.h
@@ -37,12 +37,6 @@ extern void gio_dev_put(struct gio_device *);
 
 extern int gio_device_register(struct gio_device *);
 extern void gio_device_unregister(struct gio_device *);
-extern void gio_release_dev(struct device *);
-
-static inline void gio_device_free(struct gio_device *dev)
-{
-	gio_release_dev(&dev->dev);
-}
 
 extern int gio_register_driver(struct gio_driver *);
 extern void gio_unregister_driver(struct gio_driver *);
diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
index d29067430b44..54e17c8693e2 100644
--- a/arch/mips/sgi-ip22/ip22-gio.c
+++ b/arch/mips/sgi-ip22/ip22-gio.c
@@ -80,14 +80,13 @@ EXPORT_SYMBOL_GPL(gio_dev_put);
  * Will be called only by the device core when all users of this gio device are
  * done.
  */
-void gio_release_dev(struct device *dev)
+static void gio_release_dev(struct device *dev)
 {
 	struct gio_device *giodev;
 
 	giodev = to_gio_device(dev);
 	kfree(giodev);
 }
-EXPORT_SYMBOL_GPL(gio_release_dev);
 
 int gio_device_register(struct gio_device *giodev)
 {
-- 
2.53.0


