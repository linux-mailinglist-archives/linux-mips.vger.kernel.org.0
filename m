Return-Path: <linux-mips+bounces-14305-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sISZDqxG62kmKgAAu9opvQ
	(envelope-from <linux-mips+bounces-14305-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 12:32:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFD845D192
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 12:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14CE4301FD49
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 10:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3020366548;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="To/ca2/u"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0AA36404E;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026538; cv=none; b=mkB1dOEuKnf+VySNnrTLZpAsLOhFOTbUMccInMBzAfrHEMinrYie0sB2A9JMVFWQE1Ae6SsK3oFPM9I4P8C7V3eynWQmucyxls5k3+vvAJ410dW+y5GiMfiwy2UbV26mUnXZRGnvxSZ0wLZTeiQZcIwV6eayDzQTsEZUPKlmKxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026538; c=relaxed/simple;
	bh=mBLk79tpLvFZr9NTaxRLYUufLtc4UoesdD3r8nUWZ38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEcqfUVqQ0euZ0jRufT6F94ZF6KIaquEwimkxG5kItRBUpy+xbih001++txby7gJXSeId4ll9fox247nvxhZDN4SOnJOjIHnwXJ5DMXECuZlPEsQEeE0K16en/noiN3HPFpAzcWhodo4LmBnSA4NJMH5OvP4EpJOqjU0NOzQKIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=To/ca2/u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88884C2BCB5;
	Fri, 24 Apr 2026 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777026538;
	bh=mBLk79tpLvFZr9NTaxRLYUufLtc4UoesdD3r8nUWZ38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=To/ca2/ujYPSc773yko2Uu2VCOCbQLsbwqbC0jR8Tp/Vmdq5H6bRQ3SUF9DTqKmq1
	 XIvaiQ5pas6PHlZhzNaSZU8+0BFf+JS/6BdL18JEYJaCISwSIOe3hhk4tNbPPIRW8T
	 EQleT1dwZicQaDa/qaWp2nanlaBYhym4MaRaGAbjaao/2aGMyttK9N8Sni+0mRusM9
	 gRO0KAA33edI/1WFdcEvuk4e7FLHLXUmG/Wevf8QPop5z+hHVd/eJF2EpPWnuGy6dr
	 zTmJL5mi5tsCXnMw4tJHDmXJiI8/luvxw54KYtr476aN4UEKpEblYW6ikITQj81hZ3
	 l3YaENhvZGljA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGDmK-0000000AyYU-1k5c;
	Fri, 24 Apr 2026 12:28:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Levente Kurusa <levex@linux.com>
Subject: [PATCH 1/5] MIPS: ip22-gio: fix kfree() of static object
Date: Fri, 24 Apr 2026 12:28:45 +0200
Message-ID: <20260424102849.2616035-2-johan@kernel.org>
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
X-Rspamd-Queue-Id: 8FFD845D192
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14305-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The gio bus root device is a statically allocated object which must not
be freed by kfree() on failure to register the device or bus.

Fixes: 82242d28ff8b ("MIPS: IP22: Add missing put_device call")
Cc: stable@vger.kernel.org	# 3.17
Cc: Levente Kurusa <levex@linux.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 arch/mips/sgi-ip22/ip22-gio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/sgi-ip22/ip22-gio.c b/arch/mips/sgi-ip22/ip22-gio.c
index 9eec8842ffb7..a574441fa44b 100644
--- a/arch/mips/sgi-ip22/ip22-gio.c
+++ b/arch/mips/sgi-ip22/ip22-gio.c
@@ -30,7 +30,6 @@ static struct {
 
 static void gio_bus_release(struct device *dev)
 {
-	kfree(dev);
 }
 
 static struct device gio_bus = {
-- 
2.53.0


