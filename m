Return-Path: <linux-mips+bounces-12378-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA06BC948E6
	for <lists+linux-mips@lfdr.de>; Sun, 30 Nov 2025 00:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54B4D3A699B
	for <lists+linux-mips@lfdr.de>; Sat, 29 Nov 2025 23:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA7A23507B;
	Sat, 29 Nov 2025 23:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlOavh1C"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C1014F125;
	Sat, 29 Nov 2025 23:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764458780; cv=none; b=T+2qjv3hfzhCsCXy7yoYd7MbyUnOxli3D1XZceLtaZ7cNqYIFt7jRFy/9mCs2odJqd6KSVjNzpep64aocHwavExVJWMwK+YDuorpIoFSH1ymsqdaYav+oJH5UQ/PdEiu7E0k147xMmTAtZBP2O2y3By7iLy6z/zd6hSct3d5uxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764458780; c=relaxed/simple;
	bh=7kAZ6kj5yge53uKcLJc0bVWi5IkSM0rLOczmaO+HEVE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FprPLj3NNu+OdKqnFaLIsQjpUOAq6a2Lm9Rep/M1o3AR+tXAS86ouPDIbQmXET/UO6GteLCCvfHrjmDZ8F12UWFIFPnPcqhWXfT6Jh8LWyym7T3qPrQG4iWjuwYLIrEKmATl+LyH4aPAaTYHArOpmTy+JOl6i8j0/bEJvuahrqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlOavh1C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDFCC4CEF7;
	Sat, 29 Nov 2025 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764458780;
	bh=7kAZ6kj5yge53uKcLJc0bVWi5IkSM0rLOczmaO+HEVE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mlOavh1CkLxm3P4bSycWiCQ+mXfWx5hSg2YbUD7CJ3Am28d0GiLwmFCX4pJWEQKd4
	 1WKVWCrneBvTOL1v5JPerpVflc2sZPp5C0p0hOoVhZsq3bBEM89Q7tGLgFUsq686sB
	 epzi8nBpgY9TfCy/9hKoby08E1PsP3oMPGX0MoGTUG4tJolGKcTtCmix/VCa4s983b
	 JHjrhUvdGZtdBfKXgaAuv4jE3O4eNEEJYaUnqyPZZCEQwemdVAvdtlL39yqLbnARdS
	 LtbNEmoaN7jVVFkatT2NrPdCv7UgUkI3DJkN/pd7FbdZ1w3KRxDGduWpdTHPwzGkb5
	 JYzcNiyAk2R9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5ADD3806935;
	Sat, 29 Nov 2025 23:23:22 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <aStdrYiDwO05O1A_@alpha.franken.de>
References: <aStdrYiDwO05O1A_@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aStdrYiDwO05O1A_@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.18_2
X-PR-Tracked-Commit-Id: 841ecc979b18d3227fad5e2d6a1e6f92688776b5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6bda50f4333fa61c07f04f790fdd4e2c9f4ca610
Message-Id: <176445860127.1122623.17323926700740847881.pr-tracker-bot@kernel.org>
Date: Sat, 29 Nov 2025 23:23:21 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 29 Nov 2025 21:55:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.18_2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6bda50f4333fa61c07f04f790fdd4e2c9f4ca610

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

