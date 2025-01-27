Return-Path: <linux-mips+bounces-7609-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B15B4A1DB10
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 18:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDC2C7A532D
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 17:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310B118B48B;
	Mon, 27 Jan 2025 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewGVd1dg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0816718B47D;
	Mon, 27 Jan 2025 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737998003; cv=none; b=pcgUJbC4+jZLOB26zPsbEVK4/LXye5eq/1HYuOycdirHWLp/XMcFdiCNNRQJI10mIJWUykSASJt6Vd5o/oH1eIuvQmuzAQoMqZdajY5nBibpRhe8n/nLLmx42gKcY4nGPmankDZA/G1tt+rdrl8im4ggdU4Yhmj4icLYBTZ6E0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737998003; c=relaxed/simple;
	bh=ah469n/p95wQRiRgksku2PZkigSfhhu4ymFV0VcrBQ0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OWm0z2xq+6W16h61lkw+NBJpF6sS2IMI/1uUQklq4JKC2tQ+CcXmLKbAvC4op8PE1QQmZKpe+tICHqCYeSCAMG5gxDT5fUWUSfldrKkeB2mnteVYyn/53cVpDrAM7y/tk4BEtR8GSGQTIusb54kPXdU6mGKxwcPahTxQRKHAbzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewGVd1dg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E002EC4CEE4;
	Mon, 27 Jan 2025 17:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737998002;
	bh=ah469n/p95wQRiRgksku2PZkigSfhhu4ymFV0VcrBQ0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ewGVd1dg+7ush5rs3jgA66WYMjVnfjxD+WVdCWPgEbRnvJF18fP64Pzkn6nyq4bY6
	 RIukLhGbHxAbUeF+yDA2CbFQkE26ThBewOQtqdymvyFPWcLpIEb+TVPAVw1yXbAml5
	 mmHtzzl/PKwIpIXrGqv3ng2LM9GaMcxOfMNXJqTJmO6weXLGXAg5cEELRPixn4LDMM
	 gKUZk6fhmMoHtKOa6SkG4YIjUpwt+iM3OAnjtva1Z8QfZVs3ehP0EvZwkD1LGJU3Xt
	 t5vv+pfRufApdfhe5iX8waePr3YzzCLnPBMzpGbJVl2esp6K4fFAd0iCeuF9eWoYRz
	 nmlIoLPrnou+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE208380AA63;
	Mon, 27 Jan 2025 17:13:49 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5egoYZfTQvFYzx1@alpha.franken.de>
References: <Z5egoYZfTQvFYzx1@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5egoYZfTQvFYzx1@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.14
X-PR-Tracked-Commit-Id: df1b8d6e89db0edd572a1e375f5d3dd5575b9a9b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 805ba04cb7ccfc7d72e834ebd796e043142156ba
Message-Id: <173799802841.3165486.12005569228565742155.pr-tracker-bot@kernel.org>
Date: Mon, 27 Jan 2025 17:13:48 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 27 Jan 2025 16:05:05 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/805ba04cb7ccfc7d72e834ebd796e043142156ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

