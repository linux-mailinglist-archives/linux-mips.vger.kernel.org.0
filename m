Return-Path: <linux-mips+bounces-14154-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uChKIOZG32mFRQAAu9opvQ
	(envelope-from <linux-mips+bounces-14154-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 10:05:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B8401AF7
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 10:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DBBD30AF010
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 08:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184AF3A1E9A;
	Wed, 15 Apr 2026 08:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="VkAWM8Nl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-24427.protonmail.ch (mail-24427.protonmail.ch [109.224.244.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3407639EF30
	for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240109; cv=none; b=STBZ++HDb9qhH5sKfWvmTlsdTEFwGA6nTGfDZ+ehKkbXfa5D9MJCIrSLJvMw9nD+9X6o4T/ufT23I8zpT7WtqqJovfdFtL2LHxwbHd8P8vsZuscenkLIhZht9UF+Tv8u/kU209Hukk3BQIssXU2lqm1rlH471awghS9iK1v3KNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240109; c=relaxed/simple;
	bh=zH5R+3omkoQn/yAIM3vhsojb37s2SpmxgxeKfxNZIWA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KrNdu8BD1ijazHe4+CkP8y+PRLJ+hWPynko4hzXVyq9nvgdnt+P1aON7MX3XwXm20sTk2gyGT1kE40evDC2xH40C2zIFxVHrSz7BxmOit7GYu4WwCX7jQr4Esoxf99X8biE5odmumpof4sE4rI4fXUsjcR9lAqCZpKq0e9OwTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=VkAWM8Nl; arc=none smtp.client-ip=109.224.244.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=6eit5hjru5dlrjhlanp5minbjy.protonmail; t=1776240099; x=1776499299;
	bh=zH5R+3omkoQn/yAIM3vhsojb37s2SpmxgxeKfxNZIWA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VkAWM8NlrE1ffvGK4ivg14Cn6MX2ogD5bOObVAS9zVy074Sfj2tkhl87UmsM6HYan
	 9BE7OJ5EFjdLidik4H8cu58duoNFzvZGMyg+iETdRmCamJ8pbp3E6Lrzllch0IsGwX
	 LCiwxUIN3e4j7/Dl/gERhuTGOS9JlamTiQnEQwf6S0p4Q3FNZKPDvr/StQmxTVvSFm
	 K/QRNaH6cyp6rqjm7k4hZptjhdMdX2y8iA5meaJFed0cDnm4gvTIu8sN1U+WzThqf3
	 85goLcKDI5cKTWoJF4voZMIMInFvAvXVb1TdKrRcI96x6H3iZ7potRNU3Uo0f4Yorl
	 zLaT4m2yRoggA==
Date: Wed, 15 Apr 2026 08:01:37 +0000
To: "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>
From: kpursoty@proton.me
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>
Subject: [PATCH] serial: base: do not disable TX on hangup for console ports
Message-ID: <1fpGAFo1KYyRDeGSGmaDWx6gXbV00C83qU_tep62Zu_cl9JfjpjWg8SKhw6z0owZ9eEMzXR2GnZ_U3V2PVi2R1fuGAmzgK43GYbWkCIBFf8=@proton.me>
Feedback-ID: 133470881:user:proton
X-Pm-Message-ID: 785f3e68caffacde9b766153f0d21ada41986603
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=6eit5hjru5dlrjhlanp5minbjy.protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-14154-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kpursoty@proton.me,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[proton.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D87B8401AF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

serial_base_port_shutdown() calls serial_base_port_set_tx(false)
unconditionally. When a TTY hangup occurs on a port that is also a
registered kernel console, this permanently disables the console
transmitter.

uart_hangup() already guards against uart_change_pm(PM_OFF) for console
ports (see the uart_console() check in uart_hangup()). Apply the same
guard in serial_base_port_shutdown(): skip TX-disable if the port is a
registered console.

Without this fix, any path that calls uart_shutdown() on a console port
- including TIOCSCTTY with force=3D1 (as used by init systems such as
procd) - permanently silences all subsequent kernel console output.

Signed-off-by: Kervin Pursoty <kpursoty@proton.me>
---
 drivers/tty/serial/serial_port.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/serial_port.c b/drivers/tty/serial/serial_p=
ort.c
--- a/drivers/tty/serial/serial_port.c
+++ b/drivers/tty/serial/serial_port.c
@@ -110,5 +110,14 @@
 {
 =09struct serial_port_device *port_dev =3D port->port_dev;

-=09serial_base_port_set_tx(port, port_dev, false);
+=09/*
+=09 * Do not disable TX on a console port. When an init system calls
+=09 * TIOCSCTTY with force=3D1, the kernel hangs up the previous session,
+=09 * triggering uart_hangup() -> uart_shutdown() -> here. Stopping TX
+=09 * kills all kernel console output permanently.
+=09 * uart_hangup() already skips uart_change_pm(PM_OFF) for consoles
+=09 * via uart_console(); apply the same guard here.
+=09 */
+=09if (!uart_console(port))
+=09=09serial_base_port_set_tx(port, port_dev, false);
 }

 static DEFINE_RUNTIME_DEV_PM_OPS(serial_port_pm,


