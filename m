Return-Path: <linux-mips+bounces-15206-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W4Q9C5IePWoPxQgAu9opvQ
	(envelope-from <linux-mips+bounces-15206-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 14:26:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C376C58F3
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 14:26:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15206-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15206-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F27B530E3F7A
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jun 2026 12:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60943E1D12;
	Thu, 25 Jun 2026 12:19:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCAF3E1D04;
	Thu, 25 Jun 2026 12:19:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389989; cv=none; b=DouvuOYUUIHdVl6W2JGVpW5n/+RQQ1PSeNi2atbNjlaDkMOESKtBYGhyJdzf9zYcaSNnbDHoPc3CAmMs/e9fmVUrsltb8iRSLkNv9UwwrPBYFqnOz4Z/ZYjZsMEfm1fUt3Q5bPfYL5WVoEjRb6Mgi+zklXAyCbpxst8mIIY2fx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389989; c=relaxed/simple;
	bh=ffw0y/6xQF73k8sL+GUpvbsuZcAeg9ccRcDje0EXB4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQ3h9owBN3D9V6oPYRohPbv4HHMpGye6trl2kkXfp5VT8iYv3e/Gy4JzkbHkIzU8sZ/N+V81GRR8CCN9hm3aQ6Qtk+BtMZ7ZwwH0dbBKCsSM6axbqV31uXilVotanfKyCzsrt5xxdthpYDVRXjNiBBKXR4+V+EDORi2II96Lp+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB991F00A3A;
	Thu, 25 Jun 2026 12:19:46 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 5/9] MIPS: TXX9: Reduce TXX9_IOCLED_MAXLEDS to 3
Date: Thu, 25 Jun 2026 14:19:26 +0200
Message-ID: <77535cc848c89d339fc5efe9ce1a30e017164a18.1782389357.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1782389357.git.geert@linux-m68k.org>
References: <cover.1782389357.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@linux-m68k.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15206-lists,linux-mips=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,linux-m68k.org:mid,linux-m68k.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2C376C58F3

The number of available GPIOs and LEDs on the TXx9 IOC FPGA depends on
the platform.  Since commit 455481fc9a807798 ("MIPS: Remove TX39XX
support"), the only remaining platform (rbtx4927) supports just three.
Hence reduce the maximum number, to reduce allocation size.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/mips/txx9/generic/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 97102d3327d22828..611ccbe429cfe7e1 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -569,7 +569,7 @@ void __init txx9_ndfmc_init(unsigned long baseaddr,
 #if IS_ENABLED(CONFIG_LEDS_GPIO)
 static DEFINE_SPINLOCK(txx9_iocled_lock);
 
-#define TXX9_IOCLED_MAXLEDS 8
+#define TXX9_IOCLED_MAXLEDS 3	/* rbtx4927 */
 
 struct txx9_iocled_data {
 	struct gpio_chip chip;
-- 
2.43.0


