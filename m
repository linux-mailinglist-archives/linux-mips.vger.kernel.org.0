Return-Path: <linux-mips+bounces-6771-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE739D1E2C
	for <lists+linux-mips@lfdr.de>; Tue, 19 Nov 2024 03:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF646B23207
	for <lists+linux-mips@lfdr.de>; Tue, 19 Nov 2024 02:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A184913A868;
	Tue, 19 Nov 2024 02:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDT1PqJq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F9FC2C9;
	Tue, 19 Nov 2024 02:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731983021; cv=none; b=p6NZD7rNKRuHdVR1MG1A2oFQKDm4j1t5TYZ+lCWf3rugGtzFXFIE4UiexhwwTgPOvt47OnVMwPx/03ldF3k5P5mGc61wzdsnqD7Z3CoeTS70YQ15kHw6dBOUl6ps1voq0TtPr4VA/WApuQQR25H4/NdO7urnOSksKS4XOunop7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731983021; c=relaxed/simple;
	bh=xSWGWESMp5llJxr0hve5yiqLWnugRfhAvIZb6y1SMpo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=N95bLN1DNgDdpXtsaGUZe/73gV6ghYQ/8pG1XgWJKe9TFKn8PSLLsY9zNgH9y8cpvFAz6lmY4x4BHUp69D9FNkdK/IQpduz0IcAMR7tZqcFM2i3qyLxQ/na6gMjsoPE5YXSyqC3Lxf60jZhLJWjtAUXe93aUpYtQ93FVuXSlPqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDT1PqJq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5446FC4CECC;
	Tue, 19 Nov 2024 02:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731983021;
	bh=xSWGWESMp5llJxr0hve5yiqLWnugRfhAvIZb6y1SMpo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pDT1PqJqJR/J7VYCcRgmEtyumGkIdOh9SF7SVGUth/NO/EmPrfLhlGU9dUiKFLAme
	 f7du/FmhwGw3gOtrjXiMBSGJ6/R6z7pr9OK09iiLSOiT1vIX1WR59P0sl25cAdqmKs
	 4vcn+JXYOT7Hq6mY0XuO0m1lwSjSVEnBqwn7MFpfI5rfLbN6caBZZ+G+kb6BWiFbw9
	 4Hneerr9JPTIVttYN01gVCZ/c24sXiFRB3+hOrqR2ZFOKlfEfXxsgYEqREBjEqSW2F
	 893/QE/VTOc3x0fgxtcsB7Pl1kpSscFhCXxyhzUzq1FBiyBjfOWxq9qQvvdRhTy9W2
	 /eY46c31yjbRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB8A73809A80;
	Tue, 19 Nov 2024 02:23:53 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZzsCwEfGZ0m6dNVS@alpha.franken.de>
References: <ZzsCwEfGZ0m6dNVS@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZzsCwEfGZ0m6dNVS@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.13
X-PR-Tracked-Commit-Id: 56131e6d1fcce8e7359a2445711cc1a4ddb8325c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ae4336e20b8acb4d67205273645d27bd4d4392d4
Message-Id: <173198303247.73657.11301198372251542720.pr-tracker-bot@kernel.org>
Date: Tue, 19 Nov 2024 02:23:52 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 18 Nov 2024 10:02:56 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ae4336e20b8acb4d67205273645d27bd4d4392d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

