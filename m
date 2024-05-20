Return-Path: <linux-mips+bounces-3303-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 061E88CA0C7
	for <lists+linux-mips@lfdr.de>; Mon, 20 May 2024 18:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4A88281DBC
	for <lists+linux-mips@lfdr.de>; Mon, 20 May 2024 16:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE9B137C58;
	Mon, 20 May 2024 16:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0bugqHC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A312137C4E;
	Mon, 20 May 2024 16:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716222841; cv=none; b=oYMKmSCT7HWzo1k2OAmzq2Lc3+dX6TpoI0olWntPp0UEzN5on4A8gWJ27pD2bQp3IZTNftfdBMS4sAekNhU6CHFATnxkco4slnV2HfEuPu6pZbJunGtTYhLFyGVNFZtEDV0xckJ8RWTFo1vuDyV2Mbmt3KEsfglvEElzlcoqbJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716222841; c=relaxed/simple;
	bh=ohKZsJk1S/2Prr9MsAsv8bEiFYhen6pA9AUJZ6jDPaA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=iKPTB87GdBanieCMcaPjiuGH3bzNsobIv8wovboI1NT4KBv5u0qVEdGqs1Kbd1wm0SXdkXjh3qk2lHlQOYR9iVftq89Ot0XiGGhazAjXuOpSTw98lZHNo5eI1dE1W9BXllVE7vyvCAzE43wzNnBbgWwb2QtZfO6BoHIx0tqwLaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0bugqHC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1FBEC4AF0C;
	Mon, 20 May 2024 16:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716222840;
	bh=ohKZsJk1S/2Prr9MsAsv8bEiFYhen6pA9AUJZ6jDPaA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=m0bugqHCfqOAWcwCzPWo8iiQtKDJWXmmrIf1ekecCPv8x/Oh6neQzLYnyZi0u+FGx
	 qyg91Y4NQIagJE9FyfFdvPz9NdfCn/sEy3MBYThOap4MhH3LnBnVKVj5ybVczKWI9U
	 +6O3tq+59O6R2BNtupN4BpPHGsJpA/YlAOjpZvyWueSopHhfE2Gu88hEm3m21Wj5va
	 dWw/EnnC2PgUgI34Dyv0uI3uIM8V2/z0r9yGP5kfBJWAsrFvI8ELevcappW41xmEAO
	 Db6kQUVx/uLNehbIHVxRx32Utr2xwMVkug4Bx6957eVqZsZ+DJ7KdGn1dLOQ+72LpS
	 XGl3bcNji8p2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D9D61C54BDA;
	Mon, 20 May 2024 16:34:00 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZksWGd0Kr7D19kp/@alpha.franken.de>
References: <ZksWGd0Kr7D19kp/@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZksWGd0Kr7D19kp/@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.10
X-PR-Tracked-Commit-Id: 07e6a6d7f1d9fa4685003a195032698ba99577bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e51b4b5bbc07e52b226017936874715629932d1
Message-Id: <171622284088.31783.15521993900488575082.pr-tracker-bot@kernel.org>
Date: Mon, 20 May 2024 16:34:00 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 May 2024 11:21:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e51b4b5bbc07e52b226017936874715629932d1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

