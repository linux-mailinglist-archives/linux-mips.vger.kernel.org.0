Return-Path: <linux-mips+bounces-15154-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JniRDuxYNWpztgYAu9opvQ
	(envelope-from <linux-mips+bounces-15154-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 16:57:48 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CAA6A6872
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 16:57:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MB74D3I8;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15154-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15154-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89BD130182DE
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 14:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C283B19CA;
	Fri, 19 Jun 2026 14:57:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92CA3B27F8;
	Fri, 19 Jun 2026 14:57:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881053; cv=none; b=WqXzZO4aL7vBOT36VHkNYQLuXn2OTZ+LJXGL8R43Xo1X2cLQdSz2vdk1keWt+oZdctk4FlQWd7SX4VJUxzQAl6+HE35BbKvXZja0ptVSXmika9X+PaJVAkfsWemOG3+Evwf0MyxpwWj/IcLLCZm+mOiMlwNmOntLZPCPK4WdsNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881053; c=relaxed/simple;
	bh=J20dCL+j+c/l3pDFgZFhVkji5b9WK5dQFs64TOv+OAE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AqtD7/icow4DQqxwA0aqlxr3W2gnkpuea8hBnBGawBQQ0CIwrCW4urdAytpBWD73IwGtmPieaR7tOKT+buj23mAc6lAeFI+wLi3jqwrUpWTOpxFdkZ/sKI5Ds9KI2sqrPOt/ZN7fc7UvB1zeEuA7QbhbxCvY25BbJB/1mZOYOUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MB74D3I8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCAC1F000E9;
	Fri, 19 Jun 2026 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781881052;
	bh=271l9oB8TUWpQ4GgNkuqAJYwVEbTa1nGdf0yh1Kmlk8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=MB74D3I8xzXfHKin4z5TCGvpa7/P2DIvGmpv/vF50z4DtgB4DaEQdpDZNrJwBiUd2
	 2a96q3DaSsNH0qM84fT/j+NTYW0SA8X78H9GDwsfW0nKk6E8O2Avy24NXwGkTfIg/A
	 8nFxRTQxrgLWSBZB5CT1QD17PTuBpFT9dTg0mPMk0/vRVoqIUMcv6tQ1qzlo35bf6C
	 2yddiZyBJh5ek66SuEk8HVSJ65tonMx5u6I5DG8S+Gvi3WUtKEDCfLvL/5c+0nq3Nd
	 IJfyVJ5f2/Xp19jWFlg2IWwBSIMi89jldO96hLLtSfQBdKNepR5Zv+ftxyfDzb+fWc
	 1Q+T6BJkPmRRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93AD53AA6A6C;
	Fri, 19 Jun 2026 14:57:26 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ajUnRiURsctnJ7R9@alpha.franken.de>
References: <ajUnRiURsctnJ7R9@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <ajUnRiURsctnJ7R9@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.2
X-PR-Tracked-Commit-Id: 6f25741b7565d7f82fc09947c981cae17535894d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 08c7183f5b9ffe4408e74fff848a4cc2105361d4
Message-Id: <178188104519.3941480.13704581348900368867.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jun 2026 14:57:25 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15154-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9CAA6A6872

The pull request you sent on Fri, 19 Jun 2026 13:25:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/08c7183f5b9ffe4408e74fff848a4cc2105361d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

