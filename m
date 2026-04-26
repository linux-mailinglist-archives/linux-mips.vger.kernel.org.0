Return-Path: <linux-mips+bounces-14321-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEU4DxtX7WmziAAAu9opvQ
	(envelope-from <linux-mips+bounces-14321-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2026 02:06:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED714686D1
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2026 02:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44F523025D26
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2026 00:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BAC2556E;
	Sun, 26 Apr 2026 00:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gt71I/af"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05B178F2E;
	Sun, 26 Apr 2026 00:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777161815; cv=none; b=XoIELjK7HrGmSIcSyQ96vSZlXWH9qFmOS8IFXKYAZ/xplcayiHa1sU6OCqWxGWzIDAL+EIEjPeGMnBNjcySYhCWydA9tBGuRT4ZtDZv2Jwi92fXC1owsqyw8/4u4PWyXLdo6YbF6Vc/95eUvlaraYxzjOTB0KHNXzFr/h1RRYC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777161815; c=relaxed/simple;
	bh=y+tMLWqGW1hDKiWksJbV6BV5c3/YKYX45JSb3CIVaIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rg3sVCHqNTnK6XGXx8vawdKFeG5GxEz2jWLuY1f0O231Ox2ejF70OiDgnWHsNdIlHHbd3ab0HKWGDBHF8w9/DvXeFQZeZYAoy1/+V05rStIOg0c+ZKxAGfD/+8CusFDVs8SRNV+wemUOUsWHYwmeoWQZ4tG+rVa4TtKqLlVOa00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gt71I/af; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA32C2BCB2;
	Sun, 26 Apr 2026 00:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777161814;
	bh=y+tMLWqGW1hDKiWksJbV6BV5c3/YKYX45JSb3CIVaIw=;
	h=From:To:Cc:Subject:Date:From;
	b=gt71I/af4qkHfWGIcvquSPat9dGKjQBl8nv4UAqFoI2pekgEbjVQOlUuIcqHgohVG
	 jcsTradO9lh3A0VBIE+T99YcddNRVKCHu4MprzZcX9sRvThBVpLUBWAAhRmvn+PUus
	 vzCbBXffeZmnWKC/YMb3gaFtu0nlNkaf6g18CurIS+VbyHWG+mv3+q2Cvil3us3i+i
	 ivQmQedVe3bSsoPCBFhQE/iQXn1T6slhaMjAjuWTXfxduHEB57LSmVJlDAnVEDY7kf
	 BPS5z6V9MbDi+7xuxm+HGJiViXu6kaodxchJkKmfMwXLsaI6gzUXbXbfjfmIfox5Cw
	 5S87HjbxpkZjA==
From: Sasha Levin <sashal@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: mobileye: Remove duplicate FIT_IMAGE_FDT_EPM5 from main Kconfig
Date: Sat, 25 Apr 2026 20:03:32 -0400
Message-ID: <20260426000332.56177-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9ED714686D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14321-lists,linux-mips=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

kconfiglint reports:

  K008: config FIT_IMAGE_FDT_EPM5 has prompts in 2 separate definitions

The FIT_IMAGE_FDT_EPM5 Kconfig symbol is defined identically in two places:

  arch/mips/Kconfig:1052
  arch/mips/mobileye/Kconfig:17

Both have the same prompt, depends, default, and help text. Since
arch/mips/mobileye/Kconfig is sourced from arch/mips/Kconfig, both
definitions are parsed and the symbol ends up with two prompts.

The symbol was first introduced in commit 101bd58fde10 ("MIPS: Add
support for Mobileye EyeQ5") directly in
arch/mips/Kconfig. Three months later, commit fbe0fae601b7 ("MIPS:
mobileye: Add EyeQ6H support") created the
arch/mips/mobileye/Kconfig sub-file to organize the growing Mobileye
platform code and added the MACH_EYEQ5/MACH_EYEQ6H choice along with
a copy of FIT_IMAGE_FDT_EPM5. However, the original definition in
arch/mips/Kconfig was not removed at that time, leaving a duplicate.

Remove the definition from arch/mips/Kconfig, keeping the one in
arch/mips/mobileye/Kconfig where it belongs alongside the related
MACH_EYEQ5 machine type definition that it depends on.

Assisted-by: Claude:claude-opus-4-6 kconfiglint
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/Kconfig | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4364f3dba688f..1cd8fc9033876 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1049,15 +1049,6 @@ config CAVIUM_OCTEON_SOC
 
 endchoice
 
-config FIT_IMAGE_FDT_EPM5
-	bool "Include FDT for Mobileye EyeQ5 development platforms"
-	depends on MACH_EYEQ5
-	default n
-	help
-	  Enable this to include the FDT for the EyeQ5 development platforms
-	  from Mobileye in the FIT kernel image.
-	  This requires u-boot on the platform.
-
 source "arch/mips/alchemy/Kconfig"
 source "arch/mips/ath25/Kconfig"
 source "arch/mips/ath79/Kconfig"
-- 
2.53.0


