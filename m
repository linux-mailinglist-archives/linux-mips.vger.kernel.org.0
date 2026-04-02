Return-Path: <linux-mips+bounces-14013-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPHGBQOAzmk9oAYAu9opvQ
	(envelope-from <linux-mips+bounces-14013-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:41:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7942C38AB74
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 16:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D40B301E965
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2026 14:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CB73E959A;
	Thu,  2 Apr 2026 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Q8WuBSFG"
X-Original-To: linux-mips@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD803CA4AB;
	Thu,  2 Apr 2026 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140588; cv=none; b=bC8WQNTuvtvbhnz5SV7JTXrqyZBYtrPCr6vsSg3ULkznFZwtOcn5BLEa1hpassD/MvTjaPrNdNG6SbcpwByj1vVU8a53eAUZW9ESe0ug0SMPYl0XtFjJXKZVIHE8L50U+R9dA2ISIQ3HDJMfUnWL9TLsgKv6mxgKlTZA10Tnpr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140588; c=relaxed/simple;
	bh=DHklSI8BSPMBvlYoqHq43F2ZRwIJyhr2Ryq+CnWHFaw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m6dG1Aig4m0E2nu7MXiBj5z9goUaC4i2gy0qzuV8uLIlVKGyVkh8G+eDnxiB/OwLf4M9NiBz/zR+KXOURoDk2NN8a0DWewi3tuai/573ACT0YTHBITpydmTFQmVpXcbcbXBtrBpf1I9SviHCzfT8yNzK+WVN6A8QgEdiMx7rwp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Q8WuBSFG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775140579;
	bh=DHklSI8BSPMBvlYoqHq43F2ZRwIJyhr2Ryq+CnWHFaw=;
	h=From:Subject:Date:To:Cc:From;
	b=Q8WuBSFGHdpCYsSx7HUcyCHmV+rqs2fn7Wls/2wSB1/wDU3YQcoV1fHP/1tUkBPR/
	 e2PxjgbDyUdZnOHMtQIQeIwjEQH7GM+K5/m0XQ6rGJTsCoJR1WzDavunF/v3+d5WLs
	 f276ZJq987Bc/xiKXyRuQ4u/vzeCGRCoOGj7zV1I=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/3] checksyscalls: only run when necessary
Date: Thu, 02 Apr 2026 16:36:17 +0200
Message-Id: <20260402-kbuild-missing-syscalls-v3-0-6641be1de2db@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNwQ6CMAyA4VcxOzsztjHRk+9hPLCtQCMOQwElh
 Hd34MXEcPyb9uvECFoEYufdxFoYkLAJMdR+x1yVhxI4+thMCmmETCS/2x5rzx9IhKHkNJLL65o
 4KJl5UE7bVLN4/WyhwPcqX2+xK6Suacf10ZAs06+phNo0h4QLrqz25mRN5o7p5QVxh1zVV4cAH
 VvgQf5gUm9jMmImTWxmwQpb+D9snucPC0w3chABAAA=
X-Change-ID: 20260212-kbuild-missing-syscalls-e328de3c4b54
To: Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775140579; l=1155;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=DHklSI8BSPMBvlYoqHq43F2ZRwIJyhr2Ryq+CnWHFaw=;
 b=+SZ3YgjWmpvs9dKPGJoZ2NMfvXi31WJJ8rZEhDvB7e/OnPZJZ3Ymwk1dLW7ea3RHTy2eMZzWe
 HKFwXFGasrBDZv/ZlbsciOFnnMIyUrHy2XcNxqfKHvwujfBAG/Z1nIL
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14013-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid,checksyscalls.sh:url]
X-Rspamd-Queue-Id: 7942C38AB74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently checksyscalls.sh is unconditionally executed during each build.
Most of these executions are unnecessary.

Only run checksyscalls.sh if one of its inputs have changed.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Use $(addprefix) to print instance identification
- Link to v2: https://patch.msgid.link/20260324-kbuild-missing-syscalls-v2-0-651b8beb0bfd@weissschuh.net

Changes in v2:
- Also send to kbuild maintainers
- Link to v1: https://patch.msgid.link/20260303-kbuild-missing-syscalls-v1-0-3b4d69b68c75@weissschuh.net

---
Thomas Weißschuh (3):
      checksyscalls: move path to reference table to a variable
      checksyscalls: only run when necessary
      checksyscalls: move instance functionality into generic code

 Kbuild                   | 14 ++++++++++----
 arch/mips/Makefile       |  6 ++----
 scripts/checksyscalls.sh |  9 ++++++++-
 3 files changed, 20 insertions(+), 9 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260212-kbuild-missing-syscalls-e328de3c4b54

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


