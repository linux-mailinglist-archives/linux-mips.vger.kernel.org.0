Return-Path: <linux-mips+bounces-14060-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIVOCWzw0mmtcQcAu9opvQ
	(envelope-from <linux-mips+bounces-14060-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 01:29:48 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA9F3A0346
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 01:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 368103006397
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 23:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9286D33F5BC;
	Sun,  5 Apr 2026 23:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="lp7ZzFfJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632E5331A77
	for <linux-mips@vger.kernel.org>; Sun,  5 Apr 2026 23:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775431785; cv=none; b=ba5VvCD/mSsSZ4GCtFK/NmXVowXXDg4QIa2z/uwIAt+0fp2YYCUUzmpseaHdcdlXB1z4AyBaB+3QKpgOk5x/tsuGsUetQymx5l9IwmCckusY5u8Njgux4/85wHknEUrPmuLFV2Ml5j/GgjAVTU1QOmWS9c3pzSYqo+dvzB6A9xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775431785; c=relaxed/simple;
	bh=WBtoJlyzwzl0z5G+onVM+hBmm+izb0wwhEc2aKicr/4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=rvpUsXYVACv4X9x8II5wYgnJduc8ti9agTY4UWvQX44w8hTMpM1f2KHo0+9HSw9rfuZfpfbdMYZgkf6aYMPkHL1JX1lV5wijE1T/U/xuZW6oQbQYdOE5BgkHVE/Ij4rsP/JFs1Au5F4dsCLjUe1mBX0MkZQAeBJDPro/o2CHaM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=lp7ZzFfJ; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4fppQK096MzDqF8;
	Sun,  5 Apr 2026 23:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1775431337; bh=OX13nJb///x4AZ3PO9Gwjgnmrm+ZmRHABN+VdqZUNSM=;
	h=Date:From:Subject:To:Cc:From;
	b=lp7ZzFfJw5Mr+3nc+6t15sZdMnZjlAUSr4kwcOXuZCD2J+ZY1YNiKFE7mT6638TuC
	 P071frAIsA5HLzDaKcgAubHBZXYyrzn1VooRKWFcx9gj4SEM6MKKPRQBVl0oNFIe+B
	 k2iIQenYXrEclxxlnR3yDp8F+Q0pqbyGC35IVXZw=
X-Riseup-User-ID: DEFEF46DF20C9E2418BF7D1220A57ECFF04039FB564881659FDAF8739222F8C2
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4fppQH2pk4z22Ml;
	Sun,  5 Apr 2026 23:22:15 +0000 (UTC)
Message-ID: <5288255e-3522-42b5-a410-c77cbece4a93@riseup.net>
Date: Mon, 6 Apr 2026 02:22:13 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rany Hany <rany_hany@riseup.net>
Subject: [PATCH 0/3] Fix for MT7621 hanging on reboot
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[riseup.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[riseup.net:s=squak];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14060-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[riseup.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rany_hany@riseup.net,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7EA9F3A0346
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

Rany Hany (3):
  MIPS: Stop secondary CPUs before platform restart/halt/poweroff
  MIPS: SMP: Wait for secondary CPUs to stop in smp_send_stop()
  MIPS: SMP: Properly stop secondary CPUs for restart

 arch/mips/kernel/reset.c | 19 ++++++-----
 arch/mips/kernel/smp.c   | 68 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 78 insertions(+), 9 deletions(-)

-- 
2.53.0


