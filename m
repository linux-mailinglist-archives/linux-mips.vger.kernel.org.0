Return-Path: <linux-mips+bounces-15384-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DlLhF0vpRGrm2woAu9opvQ
	(envelope-from <linux-mips+bounces-15384-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 12:17:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A148B6EC027
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 12:17:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15384-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15384-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2223E302FB70
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 10:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B8A3F4824;
	Wed,  1 Jul 2026 10:11:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13033BB9F4;
	Wed,  1 Jul 2026 10:11:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900714; cv=none; b=aNHktMOpSi1+1XcqVMrs1Gg4EERPsa6+Uhn+C1Z3ZC6R6jysaDzuvwDllDbXDIcW0cxd4gwvhEaHd39P63JJmsNSCSd1ikXNA3ORvojt4Vg6crsJiWY/GeICCeaLPA96GtORMhOUkB0GdWpIJmZJ/rf3clAxNJJlC1ex6mZCzeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900714; c=relaxed/simple;
	bh=sFgbP+8cNs1jFmYsv4mgYmT414JAgsOLk6tvEQ8o6c8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P4bjZPdnQIMe0yNiLhHeeVR2GAMWQ7UNXuuB3F7IS1FRyv/38xMRjunfBrRQiqHPivn2KimYqBAfRl7qdk3kY+W258Yk01p8hL4uTnixlTyVBlIR3jEoJs9ZfP+iULN3/le/bIwBRZqxF2Bu79yQ8PKvcfxi8fYapgBWJOtLYXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954181F000E9;
	Wed,  1 Jul 2026 10:11:51 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 0/9] MIPS: TXX9: Legacy GPIO interfaces cleanup
Date: Wed,  1 Jul 2026 12:11:35 +0200
Message-ID: <cover.1782900491.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15384-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@linux-m68k.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux-m68k.org:email,linux-m68k.org:mid,linux-m68k.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A148B6EC027

	Hi all,

This patch series gets rid of legacy GPIO interface usage on the MIPS
RBTX4927 development board, preceded and followed by some cleanups.
No blinky LEDs were harmed during the production of this series.

Changes compared to v1[1]:
  - Add Reviewed-by,
  - Return early on platform_device_add() failure.

Thanks for your comments!

[1] "[PATCH 0/9] MIPS: TXX9: Legacy GPIO interfaces cleanup"
    https://lore.kernel.org/cover.1782389357.git.geert@linux-m68k.org

Geert Uytterhoeven (9):
  MIPS: TXX9: Remove tx4938_spi_init() and txx9_spi_init()
  MIPS: TXX9: Remove txx9_7segled_*() forward declarations
  MIPS: TXX9: rbtx4927: Use GPIO lookup table for SIO DTR
  MIPS: TXX9: rbtx4927: Use GPIO lookup table for TXx9 LEDs
  MIPS: TXX9: Reduce TXX9_IOCLED_MAXLEDS to 3
  MIPS: TXX9: Use GPIO lookup table for iocled LEDs
  MIPS: TXX9: Drop GPIOLIB_LEGACY select
  MIPS: TXX9: Convert gpio_txx9 to dynamic GPIO base allocation
  MIPS: TXX9: Clean up txx9_iocled_init()

 arch/mips/include/asm/txx9/generic.h  |  9 +-----
 arch/mips/include/asm/txx9/tx4938.h   |  1 -
 arch/mips/include/asm/txx9pio.h       |  3 +-
 arch/mips/kernel/gpio_txx9.c          |  5 ++-
 arch/mips/txx9/Kconfig                |  1 -
 arch/mips/txx9/generic/setup.c        | 45 ++++++++++-----------------
 arch/mips/txx9/generic/setup_tx4938.c |  6 ----
 arch/mips/txx9/rbtx4927/setup.c       | 41 ++++++++++++++++++------
 8 files changed, 53 insertions(+), 58 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

