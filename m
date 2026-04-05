Return-Path: <linux-mips+bounces-14061-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uErSOU750mk3cwcAu9opvQ
	(envelope-from <linux-mips+bounces-14061-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 02:07:42 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 469503A0C6A
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 02:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC20C300695E
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2026 00:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AC532D452;
	Mon,  6 Apr 2026 00:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="XCn0bWnt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07A92C859
	for <linux-mips@vger.kernel.org>; Mon,  6 Apr 2026 00:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433630; cv=none; b=J307vW5snrtu4GFF3p9g+65W55Q0szU8gidlKslOSrScogmGT8b2gtlMHcXeshg+mYEPynr3ic+XFqRNTOF4mOV9LIVWhRzqyQclPr2m8FCSYMOb3Q7S6Q5bAcI/R4IUge6jQcBMDYS0F0ff6PmeaGnMD9IrOMDPm1bKNhHplFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433630; c=relaxed/simple;
	bh=Dq+KrhEG0Zbp7rMuJfQLjAlQaF2+4T6+U0LWU1tJMeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=So2+yK9x3uwtLdwLjS5KXCV3x0AWVn2UBF+rRskn+D54ELa6tp6Hg/i6SV4WYyIKbOafwEAlpaSBK4h79CKML7SW1GYkchxM1JC0dpUs/HClMammzolca8zlh5H4tr4er0NEqTibLo5ZunJiSnBZHgsYN3st+WtqhSk4lwjzrMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=XCn0bWnt; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews03-sea.riseup.net (fews03-sea-pn.riseup.net [10.0.1.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4fpqGN2n6CzDqFT;
	Mon,  6 Apr 2026 00:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1775433628; bh=xjSaC3XXj7Fy4GLOO2ewZDNpRhMJsrhpoo/mq8YVJRQ=;
	h=From:To:Cc:Subject:Date:From;
	b=XCn0bWnt+s6O058gitcMwJ98MeKPf+QcVOiu0hoSO7drvlDGM/Nrq2TT7fVFOmWSn
	 OlT1HkVrlPfB56ZVBJiT02nEwM3j6g1a5wxtTxAfJEpNzrehcxO7+XPJoZUB1B5q0O
	 JqIKQ0fwRNlregckaFDpKMiW1W245B2nOSgG2Dzo=
X-Riseup-User-ID: 68DEAC880F3BA3FC3271694453E54B8AB7412B7E1604B674FE3F85DAA15516B8
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews03-sea.riseup.net (Postfix) with ESMTPSA id 4fpqG21kcKz1yLn;
	Mon,  6 Apr 2026 00:00:09 +0000 (UTC)
From: Rany Hany <rany_hany@riseup.net>
To: linux-mips@vger.kernel.org
Cc: Rany Hany <rany_hany@riseup.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 0/3] Fix MT7621 restart deadlock
Date: Mon,  6 Apr 2026 02:59:52 +0300
Message-ID: <20260405235956.79535-1-rany_hany@riseup.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[riseup.net,none];
	R_DKIM_ALLOW(-0.20)[riseup.net:s=squak];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14061-lists,linux-mips=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[riseup.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rany_hany@riseup.net,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riseup.net:dkim,riseup.net:mid]
X-Rspamd-Queue-Id: 469503A0C6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These patches fix an issue on some MT7621 devices where the reboot
hangs. They were submitted to OpenWrt and have been merged.

The first two patches aren't particularly remarkable as they just
align MIPS with ARM behavior and are required for the full fix.

The last patch is the most interesting as it uses CPC to transition
the CPU to clock off state. It is not clear to me why this is required
but without it it ends up hanging. Initially only flushing d-cache
and using TCHalt was attempted but ClkOff appears to be necessary. 

This fix was only tested on ASUS RT-AX53U as I don't have other
MT7621 devices with this problem.

Unrelated note:

Sorry I had to resend this as my Thunderbird client was not properly
setup for this. I used imap-send which just caused issues. I am not
sure how I previously setup Thunderbird so that it groups the patches
in one thread.

In any case, I ended up just using send-email as I didn't want to mess
with Thunderbird again.

Rany Hany (3):
  MIPS: Stop secondary CPUs before platform restart/halt/poweroff
  MIPS: SMP: Wait for secondary CPUs to stop in smp_send_stop()
  MIPS: SMP: Properly stop secondary CPUs for restart

 arch/mips/kernel/reset.c | 19 ++++++-----
 arch/mips/kernel/smp.c   | 68 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 78 insertions(+), 9 deletions(-)

-- 
2.53.0


