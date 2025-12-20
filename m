Return-Path: <linux-mips+bounces-12539-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E3BCD3649
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 20:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEAED3021767
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 19:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6769274652;
	Sat, 20 Dec 2025 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8puSXmU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7162D73B4;
	Sat, 20 Dec 2025 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766260163; cv=none; b=Mg+ZsrWfd+moW/ImWY98TgrWwwaALSdftSjroQKkTuN+UXkuLndDVkkk2ceM/8dqzMzPlyRoi7ScBptRmtvbtmwNTspJOu+c4hjSMO+/8F6M6bMqTVEHbtRv7FBMhJVJY1t9iN430z2zgXENt1xuoIjnMxPf4zgCD9MLZhGSkXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766260163; c=relaxed/simple;
	bh=bjhi1MivxKa88lgdGr9K/PCXelnhWAMmeKiOl37l1/A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cN9OmFuIJP/AB0pHciY7J9lOnycWu1l+diCDYAxiJZVljOVlkvm/eM4yKuS8bVCnmpRxu+OyXtRXQQWnnIAhhOQtHdtLc8EQkdu4DO34G6+nPkON0t8y4e8h40/hfvAZR3P/nfza6dmUUxNegyPCp6RjgHV505jH/WYIrMB+10o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8puSXmU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D11C4CEF5;
	Sat, 20 Dec 2025 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766260162;
	bh=bjhi1MivxKa88lgdGr9K/PCXelnhWAMmeKiOl37l1/A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Q8puSXmUqsV1PD2VqIjl/bW0SkQ7lxzC8sqnVN5ESWDncHz+rth9HHjVZSb3vL7s2
	 XlPMHeM1jTqSrtKGkBBThcvigS1h7Yf1+PfyL///p9osOPeUF6aQBhgq7DZp87gOW2
	 8omDiDQoyh9P0/2ngDf2gGr3lKWHupOBFDgfArr7TutqdaT/OCd3NpWyZcGPRWyY4S
	 kC4xQLlXpx7BL5J2Ab//6YjloGcJKQKSKngN2jD2s41OWiXYArxi79baRK137R7vW3
	 Ancxz+jaSxa5kcxP4s5ISftcKYN55P3BUimylgTCLaehBwEowclcrNStOxpYvLfvSX
	 RHbm9sZ6Lesag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BBCA3809A05;
	Sat, 20 Dec 2025 19:46:12 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <aUaSEkIf-vwMXc5j@alpha.franken.de>
References: <aUaSEkIf-vwMXc5j@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aUaSEkIf-vwMXc5j@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.19_1
X-PR-Tracked-Commit-Id: 680ad315caaa2860df411cb378bf3614d96c7648
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a688362b19c408dc501dca3e1651e446afbd5d9a
Message-Id: <176625997072.123080.290433397318356987.pr-tracker-bot@kernel.org>
Date: Sat, 20 Dec 2025 19:46:10 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 20 Dec 2025 13:09:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.19_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a688362b19c408dc501dca3e1651e446afbd5d9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

