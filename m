Return-Path: <linux-mips+bounces-14055-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKOaGlvj0mkkcAcAu9opvQ
	(envelope-from <linux-mips+bounces-14055-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 00:34:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B3A39FFE2
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 00:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD4BF3005998
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2026 22:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058971DE894;
	Sun,  5 Apr 2026 22:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mP5eD3Wk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D738E8472;
	Sun,  5 Apr 2026 22:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775428438; cv=none; b=RU+K3f1tH69LKe9fF6LryyNiZSn6D7tkmpnYXUDXS1mlI4Aza7U+AzQBXppd1GRkT4ETb4+NavtbeNxO0YcIWC503UWYTewev+rIkZw30u1tAz14krL+4eK/DFxw+uxqz5rUq+UQ7gr73gsD/A6us1csOS0H5PpPFKrFHIZRs6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775428438; c=relaxed/simple;
	bh=H1nGWqA6GMUpDtUDqaGmE8Yxv0OEC8gZJuqry6/tw+Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=pob1WXEXAM2+oo4LI8jb6c/45Fi3y0VWvho6wEnDVfgzFSxTFZFC1kkko4YbYAk4fkv9njC0DDYlmtQyM88Ei8WUNnunZF/bnDbriuUQF328DMDzpcfz1XvVrmQeKoeywYDs7yfEUhbkg1/xKsEr7xATm1KGBGIKkN3fRVGBaZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mP5eD3Wk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3B7C116C6;
	Sun,  5 Apr 2026 22:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775428438;
	bh=H1nGWqA6GMUpDtUDqaGmE8Yxv0OEC8gZJuqry6/tw+Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mP5eD3Wk97Nv4Yi2yAVe4DZn0ZgpFmOG63enejdP2JsJ3VRSyuPwPFzWi5RnAljKi
	 Ucw6Ac61YgbuvbTv5NsZYKq1VYLOfNptaMRjqJrjcex6FJB2sCqs6JgDNPU4tvopqB
	 cJQd7j7mMCXMV651Y0/dqohwM8vLteI4CZ+6HcZSILP9R77maRbk4lK12tvaBWJHWC
	 LJR5KqKw5XTObX9Tv4aTV8i0AO8ELKxM/IK+uyGuMHlJIoU101ojbsWyIfBxlQ1sL5
	 kIBok2bV9UqIOPGFhVVlrvGbHSyuBgfwkMpeVY+XZ+9Fx+rUuBdxGiZd+okSUJqFzf
	 Tr6z7RKl9DxHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD6B3809A22;
	Sun,  5 Apr 2026 22:33:39 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <adIue0LFnmaPer6F@alpha.franken.de>
References: <adIue0LFnmaPer6F@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <adIue0LFnmaPer6F@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.0_1
X-PR-Tracked-Commit-Id: 01cc50ea5167bb14117257ec084637abe9e5f691
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eb3765aa711ff93664cd5ffcf0c2df02da2d9c26
Message-Id: <177542841791.2062966.18432964895101238000.pr-tracker-bot@kernel.org>
Date: Sun, 05 Apr 2026 22:33:37 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-14055-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 48B3A39FFE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Sun, 5 Apr 2026 11:42:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_7.0_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eb3765aa711ff93664cd5ffcf0c2df02da2d9c26

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

