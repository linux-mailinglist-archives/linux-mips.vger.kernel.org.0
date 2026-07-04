Return-Path: <linux-mips+bounces-15491-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4a0HIlE5SWqqzQAAu9opvQ
	(envelope-from <linux-mips+bounces-15491-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 04 Jul 2026 18:48:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14934707FFC
	for <lists+linux-mips@lfdr.de>; Sat, 04 Jul 2026 18:48:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Sy0zI+8T;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15491-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15491-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 165A1302D516
	for <lists+linux-mips@lfdr.de>; Sat,  4 Jul 2026 16:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC61286D7D;
	Sat,  4 Jul 2026 16:42:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA825B091;
	Sat,  4 Jul 2026 16:42:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783183373; cv=none; b=m67e7wLnlg0f9mx5CrhYlHJXRFGwjuNIJeL5LqF8or8+rgKM8fnu9AWW5kYKv6yJkEoKAZo/qIPyKG2bWmiQbiszWR7wZA5tkmGZIkjBgDrkSkbbcqfZBwUFxHRKCmltNyO/62tWLhVzc+Bhu+pFr0eOpvhARpXdV6MX9EiXkDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783183373; c=relaxed/simple;
	bh=DnjANC2W1Y9zeLMipLAXHq59XjEh2DMhS8Twfy3ypS0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TH2U5RG9jhUAM8GDo+3TTZnTop3cSWIF5lNiPHLq0b9RpWwJbKmpqisgPL16MNdVmAtxSlHLKAS9idyOLfihk7lWV5ihKs02ov+Dt4Q/NbJ24Gya+y7WdZ7Drqbepql5aQJd/INJhnppDSypDI97a65fO352EP0EmUdVjek1aPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sy0zI+8T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D681F000E9;
	Sat,  4 Jul 2026 16:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783183372;
	bh=PcO2K88Jg4Mz+qdw6ovu7UEpaM20b3sCplxTLm70VGk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Sy0zI+8TzFKArlmhn5cS7ED8QR9L6IY/BAOIfJONH72ybzDQCSbREwvMwZFnnmIM+
	 CQ8uCwiNTV1KtTDJLh8W9jHh3Aw6kiMku7fZFC4q08l74fNL39+0MMgCn4J0rNKwrW
	 Ik8PJWlppfpeXgnAye7b4wNyYgaJeapUCqlsfg01k58aOjJs/GX1PaSHS7GhBTV3mP
	 mW/5JHCvzS6e1U2jZYIjqqE2+10C5QGCm5LkaUYaQzGZEdLx9gqZVRsZws+Bw0KwhU
	 ZK2HWiU1bM1Oi9978NAfQx7vfgosHL8hhWbgoHGP02Q64vmf2BHnXFwOeryX4kxIDK
	 hsBlGIzPWqP4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93CC238119CA;
	Sat,  4 Jul 2026 16:42:35 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <aki8GEGE36Ho7S9s@alpha.franken.de>
References: <aki8GEGE36Ho7S9s@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aki8GEGE36Ho7S9s@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.2_1
X-PR-Tracked-Commit-Id: 0880884b36d1230a80a0322abc9b9c7b26942b65
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 410430b616a739eb395143f4f608d4339a3b0a8f
Message-Id: <178318335415.3585371.7336379918073380767.pr-tracker-bot@kernel.org>
Date: Sat, 04 Jul 2026 16:42:34 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15491-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:torvalds@linux-foundation.org,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14934707FFC

The pull request you sent on Sat, 4 Jul 2026 09:54:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.2_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/410430b616a739eb395143f4f608d4339a3b0a8f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

