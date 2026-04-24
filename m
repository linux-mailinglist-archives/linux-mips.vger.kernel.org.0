Return-Path: <linux-mips+bounces-14307-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YChxOK5G62kmKgAAu9opvQ
	(envelope-from <linux-mips+bounces-14307-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 12:32:14 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6578745D1AA
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 12:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A2C9302262E
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 10:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B07365A13;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEWKR/aF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF241365A07;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026538; cv=none; b=Yaaw83IDLZhQw1NBGi7cVoS1+eaJeHvj/0QG0GqbiaiOGDsxt93naYzJr55OamTEYLIqoc1Fs/XdoBScs794ktHPjj6nSjdIPQGmj4Cul40DsmvkoeabXIU7qr3/EWpoLLvnIOB3csled8rTxn0sP40zXGwpT8lcsZvXtl7e/0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026538; c=relaxed/simple;
	bh=5fSbprhbuJCT7074gb9C0N4PXZSwAueInjsh8DXULfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8k/UU17YnG962fsRBKsoVBTgrGeSp8sYubQ5d67FagJaSH8KItBH4yj6xKjrdqAEhp3T2m6N4fnKjfzbShbVj+de27jIkl+8y/jpxtnHMXMVXW/ATRSCH3BJtQ+xX5F1vyUbkwf6BIcdoT5Xnk+DjnRqcxg7d8qfQWPWNLK4+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEWKR/aF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B65C2BCB4;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777026538;
	bh=5fSbprhbuJCT7074gb9C0N4PXZSwAueInjsh8DXULfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eEWKR/aF6TVvXD+vKd9S7NrAJohlWN4rQQNRcgvmWQQo36wtYhB+efmVh5UdSm7p+
	 MCI6WZoeL/VDL/Cg0bTfpcT2UIZAdju1RKP6Ln08j/r6uI3NVVIXPEdVHpxkSB0/i+
	 /rB5JQ3J3hp/1TfXGEF8Du69wrzJJYGEzwuJlae/9tvQazOIOacK+YnOeiF/nhKaZH
	 8qe7dBoLizAVgDMLrSgk3bYs5I6FhpUXNxO4a4Z9JgzGtyrqhncXSptlArRufIRHIZ
	 IWo0pSj6P0HcJGs1VWHqpsOjXJZcywgT2Q08S5gyXGByh1Al+MsYJR3ZJ4R1r2fDRF
	 FDN/iSpfPV0xw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGDmK-0000000AyYY-1ojd;
	Fri, 24 Apr 2026 12:28:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 3/5] MIPS: ip22-gio: fix device reference leak in probe
Date: Fri, 24 Apr 2026 12:28:47 +0200
Message-ID: <20260424102849.2616035-4-johan@kernel.org>
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
X-Rspamd-Queue-Id: 6578745D1AA
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
	TAGGED_FROM(0.00)[bounces-14307-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[franken.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The gio probe function needlessly takes a device reference which is
never released and therefore prevents unbound gio devices from being
freed.

Fixes: e84de0c61905 ("MIPS: GIO bus support for SGI IP22/28")
Cc: stable@vger.kernel.org	# 3.3
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 arch/mips/sgi-ip22/ip22-gio.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
index 2f5c6c6f8254..7b7572d11250 100644
--- a/arch/mips/sgi-ip22/ip22-gio.c
+++ b/arch/mips/sgi-ip22/ip22-gio.c
@@ -133,13 +133,9 @@ static int gio_device_probe(struct device *dev)
 	if (!drv->probe)
 		return error;
 
-	gio_dev_get(gio_dev);
-
 	match = gio_match_device(drv->id_table, gio_dev);
 	if (match)
 		error = drv->probe(gio_dev, match);
-	if (error)
-		gio_dev_put(gio_dev);
 
 	return error;
 }
-- 
2.53.0


