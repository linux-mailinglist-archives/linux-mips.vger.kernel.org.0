Return-Path: <linux-mips+bounces-14671-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QICqHKGsDmr6AwYAu9opvQ
	(envelope-from <linux-mips+bounces-14671-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:56:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D454559FC2C
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7F483078AF0
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 06:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2F6395AE2;
	Thu, 21 May 2026 06:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QE1k7C8v";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="itZw1hpJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87667395AC4;
	Thu, 21 May 2026 06:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346406; cv=none; b=EkygCNCfjf0QY9jwbNr6A4CuRprxQtRCzNXU4TTFpZfn6P37/OKtT2g+E1cjS+ae3P7i75//4mnj5PEaYQ6z8+s3AeNr8SFIVpsWzfbX4pKN0J4uQ4aU3naHyqwTRpnYe54QdH+97bXy/iP+9GCu32yeIuXF9rp4ajizMx1XjfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346406; c=relaxed/simple;
	bh=IOgkgRMYHaQ3lfYPsXHLHKq0L7IMnU3l5oMD1rpCKr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDwSF33ZaYngtsVezn5NZW+I+AfJGiZmBhZoe+yH94njwvKPKciiTWaie3Pi7KdmrcdcO237/vvOP2m3u/wOYJU+0CiznAQ2Kr0qvtO83/YHp7NhbuJ4mbKfG3+K37bMC5r4CYJ3GTOvkDbiapqTNHcEtgMdfs0YjFVp3mUKqqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QE1k7C8v; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=itZw1hpJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779346403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2cKrJiS3UcZSMKGxMeqts0l6bn/r7+nHO0AACNyvkoA=;
	b=QE1k7C8v76QXwO1c9oghXScAsvRL1c2JqbN2K8PVPAQmRXCVjLRiWUk1Qtox5+kb83YmzO
	4iDxM2xBlvN4QyAKXjAeumsNQp+1rA56BuH52IgUHGezMWdQ0VSWDIel2Ll0ZoKWae4BKI
	Vdbpn/2SZARdZxIYn/Qmx+aCSDTMrlN2viCEdSIG7RLiPGe9yvZNfUPT7Z87yYjxddVaRV
	umJ5MSD/KdNxOSFaYnYNEcTwOz0tJNxVN+kpc/n7KkMIbXlOwv7MfMnOIs2kW+FdNz1wAF
	tL5DywTDN79Am7YqoD7aark2pFhi0yBziJWhmUI3AZNO5AJnj4IcOtbkCbHYiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779346403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2cKrJiS3UcZSMKGxMeqts0l6bn/r7+nHO0AACNyvkoA=;
	b=itZw1hpJ0TfbdymjailfMQy+VZqr+PYC0cmCmKUuTErM1oLCdky1H9aytws18nomq8xWX/
	kedVXbJ/+pXg6XDw==
Date: Thu, 21 May 2026 08:53:22 +0200
Subject: [PATCH 8/9] MIPS: VDSO: Gate microMIPS restriction on GCC version
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-vdso-mips-kconfig-v1-8-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
In-Reply-To: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779346397; l=890;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=IOgkgRMYHaQ3lfYPsXHLHKq0L7IMnU3l5oMD1rpCKr8=;
 b=ExOkdlxiihnC2V3Gr87Mvwv4woXg/CRlccytT71HBPNhm1PnnHZMme9FrCzMUjJIoojD0D9l0
 1sgSJ2kEWXPCNTmDrhRxBAXT6mF10w0bPGpbuyHPZpI9FrxMS173OEj
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14671-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: D454559FC2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As explained in the comment, the problematic GOT references are only
emitted by old versions of GCC.

Limit the restriction to those compilers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 8a3bd431b16a..d545a50c4bd5 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3175,7 +3175,7 @@ config MIPS_GENERIC_GETTIMEOFDAY
 	# GCC (at least up to version 9.2) appears to emit function calls that make use
 	# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
 	# the lack of relocations. As such, we disable the VDSO for microMIPS builds.
-	depends on !CPU_MICROMIPS
+	depends on !(CPU_MICROMIPS && CC_IS_GCC && GCC_VERSION < 90300)
 
 menu "CPU Power Management"
 

-- 
2.54.0


