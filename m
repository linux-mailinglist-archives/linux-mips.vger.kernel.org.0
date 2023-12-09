Return-Path: <linux-mips+bounces-638-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64580B641
	for <lists+linux-mips@lfdr.de>; Sat,  9 Dec 2023 21:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A3DE1C20865
	for <lists+linux-mips@lfdr.de>; Sat,  9 Dec 2023 20:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5814019BC0;
	Sat,  9 Dec 2023 20:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kresJePb"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC9818E00
	for <linux-mips@vger.kernel.org>; Sat,  9 Dec 2023 20:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10729C433C8;
	Sat,  9 Dec 2023 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702154057;
	bh=gj+XRQZlWwRMenN/19kHl2d4Cx1/cCtddG04ZZs/PZc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kresJePbKD+hIS4yNn9CY4f1y4rCvuvQQlq9zDsXXmadEzH5RneVeNU2iQ41KJ/1u
	 CwsYKRfnFazeho6K2Yqin/6kHNwTQI29MLiRrUOnBVrmcCKQ/G8twRsimUORa1jjpK
	 uX69adoYnzV5NPxLz7BT+ROP3gSJGWipKEV/EOz4LeTxxD3KlNTYuMyOVpMIEDvAmk
	 fldtS38Ds3sub+XlmygqlVZOdp7mq/3Ofv+mDgu833JXuQH65FwRKxPluMOH98jSVJ
	 0YBSmAWp7aibgFw2PzWA/d+m7kZk1XjLlj3obq7T5uPCrgC+u4iU6bIoP7ts3oNV9/
	 rKNug9ovp16Sw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F332DC04DD9;
	Sat,  9 Dec 2023 20:34:16 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZXQrKJy+ZW0nF2FF@alpha.franken.de>
References: <ZXQrKJy+ZW0nF2FF@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZXQrKJy+ZW0nF2FF@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.7_1
X-PR-Tracked-Commit-Id: a58a173444a68412bb08849bd81c679395f20ca0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b8503b215789628d3625ef6aa252f323e32be929
Message-Id: <170215405699.1707.7256622590015108777.pr-tracker-bot@kernel.org>
Date: Sat, 09 Dec 2023 20:34:16 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 9 Dec 2023 09:54:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.7_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b8503b215789628d3625ef6aa252f323e32be929

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

