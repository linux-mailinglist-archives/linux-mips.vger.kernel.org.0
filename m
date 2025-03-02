Return-Path: <linux-mips+bounces-8066-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED3BA4B194
	for <lists+linux-mips@lfdr.de>; Sun,  2 Mar 2025 13:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A2AF188E844
	for <lists+linux-mips@lfdr.de>; Sun,  2 Mar 2025 12:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED19C1DED5A;
	Sun,  2 Mar 2025 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkDK9Uoy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3615FC0E;
	Sun,  2 Mar 2025 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740919066; cv=none; b=CeKL1r1b7YBYkjHgXCZNZlLWnfnNk4XPetXq4KShKvbG1AzpF2bWD1/CqplbPmxvEOZ5lSU7U+5iDlBZasp+BkzUsvSjdPnqEWrJnMd1zQiJFx5I0QoeRAR95ENKrKZCbM5x9gYNcbNhUMxTrPQJyGAT/Q4omyzhN+Nfx2bYSo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740919066; c=relaxed/simple;
	bh=M1tdobnH1A/VL28PBdJkMAvD5posR/CkHMVVbP7s4C4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Qv8DYS4psWApIaInOZ4WCYLqeL113PYpjba1Z8FhqQUzlmRUHLg6x8qEDPs0omo6DbdpzSydBgKR/+OfPTdnhK4CB61Ugl7gIXdPbvWVmgenEMZ8c/PVPYfb/Z+mgUOmQKyLMOn99aWU3nnCxu1axHWu+s6dJaq9Rp+yNmmf4yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkDK9Uoy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E855C4CED6;
	Sun,  2 Mar 2025 12:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740919066;
	bh=M1tdobnH1A/VL28PBdJkMAvD5posR/CkHMVVbP7s4C4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jkDK9UoyWeBo8Lss39H3UvxvcxLFplPNXR45Kg8xcyyDznCPwlAcRFkhqCMamUZnU
	 LFTc5pw5ajkzszfhI2GUho0v9Xapj57nvSHY9hQYQ1e8+i/yqHRVXRuHOeTLljILmy
	 +ShpT6hJPoTlVG0KMBU20l3vxLVjn6Ct6HOka1UsUS2RZdBO4TEM0rly9PoIG4Wk5x
	 MZ1a1JZiBPubi5KlEzY/FlFPBAQiozbNoDZYA7TwDWbxdoF7uLb/JTd7BByMZSc0uC
	 ysI5jaWrmpdKu4Buxk8jGNHi8VlcJ/xkIax137dyQqAiasJuIUsfxls4j4YPhnbyQj
	 XJxQisM3I2QRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0D3380AACF;
	Sun,  2 Mar 2025 12:38:19 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z8QbUbukL7ejc6T6@alpha.franken.de>
References: <Z8QbUbukL7ejc6T6@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z8QbUbukL7ejc6T6@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.14_2
X-PR-Tracked-Commit-Id: 6d48ad04075729519f6baaa1dc9e5a3a39d05f53
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ebb7d37abf675dd67f40efba1f9eb6ad2d2d71c5
Message-Id: <174091909858.2619784.17453796674797886521.pr-tracker-bot@kernel.org>
Date: Sun, 02 Mar 2025 12:38:18 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 2 Mar 2025 09:48:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.14_2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ebb7d37abf675dd67f40efba1f9eb6ad2d2d71c5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

