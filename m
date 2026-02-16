Return-Path: <linux-mips+bounces-13177-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI6eMp+Ak2nm5wEAu9opvQ
	(envelope-from <linux-mips+bounces-13177-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Feb 2026 21:39:59 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 541E51477EE
	for <lists+linux-mips@lfdr.de>; Mon, 16 Feb 2026 21:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 155403027B5C
	for <lists+linux-mips@lfdr.de>; Mon, 16 Feb 2026 20:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2663328634;
	Mon, 16 Feb 2026 20:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTSdHVtY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA113271E4;
	Mon, 16 Feb 2026 20:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771274315; cv=none; b=boYS46ac7sHnkrimn+BroeCkHktd7SRP9G5l9dzWOjmESYiSC+AbIyouQO2+qJAokYmgdPsAMbFo1T57s3/tQdbgoA+cmKcSXTsk4qflASOjrFiEHXjaVmghN22EhSduXboaoKHO9FaIdojfOxVrMq7k1MOpM4Q/lbhLqhqjGSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771274315; c=relaxed/simple;
	bh=rf2Aw/T0phMoQq4uBuv9DuG4GJavtdgQqdct4XIMqDc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kSwEzGwKkUFQomad2BG5NMOB2WjOJnTfqvvXl32DASKyxwEPp0uoXLrUCWXIMg4uVblo+qnqn7da+qDYiQ8eE6AKZyu+G7xclct3V59g99bvoJ1i+tFu18TMzaxr6hR+kqOr2ZbVrNGAaGQyklJ611louLL8hLDZduTEqbOZ2KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTSdHVtY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72689C116C6;
	Mon, 16 Feb 2026 20:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771274315;
	bh=rf2Aw/T0phMoQq4uBuv9DuG4GJavtdgQqdct4XIMqDc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aTSdHVtYZzspg2341iVduFMS8VUjcFHhWSzpxvGYFxhGpa+XRKtpTD9R3fDkBN61I
	 YTahL+ib7zdLRcDVcW9BKnizMyx4F1B2Kd0pBu7mpjJdFs7cEs39B69TnndoJvXk0G
	 u0eh8D/cdCziRUVYVV/NwFy8miqv+k+ONvv0vqgAVlN+w0Zlv6oKkMiR6s1/QPZ6Ed
	 9/6bwz7HB8TXRUhRQF1D/MlLDSb8g7+F+xHOb8sLLWZ8esRk3JTsR2X2j/lP/I+HpP
	 ejIBtYTjfa2SE2hXTo/CXDEQ+4qKym7++eKf1z7FLR1VGbDAaF6auj082p1+ZfpaUY
	 dKvo2h9W5NIZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B25839308C1;
	Mon, 16 Feb 2026 20:38:29 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <aZLnItNUtfDgKenO@alpha.franken.de>
References: <aZLnItNUtfDgKenO@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aZLnItNUtfDgKenO@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.0
X-PR-Tracked-Commit-Id: 720452a6d0fdc94ec3301f31ea10b43102eaeeef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6086f349a30232f3119ec647356cd191087b1333
Message-Id: <177127430766.3994460.18290381539383655238.pr-tracker-bot@kernel.org>
Date: Mon, 16 Feb 2026 20:38:27 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13177-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 541E51477EE
X-Rspamd-Action: no action

The pull request you sent on Mon, 16 Feb 2026 10:45:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6086f349a30232f3119ec647356cd191087b1333

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

