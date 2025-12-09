Return-Path: <linux-mips+bounces-12430-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A913CB12D0
	for <lists+linux-mips@lfdr.de>; Tue, 09 Dec 2025 22:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27E8130072B3
	for <lists+linux-mips@lfdr.de>; Tue,  9 Dec 2025 21:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9105932863F;
	Tue,  9 Dec 2025 21:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMzz1I2L"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6924E32862D;
	Tue,  9 Dec 2025 21:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765315488; cv=none; b=itelp8g0qs6yRwQoOcX++31lT5sdNM8kHNkFrndjboSJdmYRO26FpmxWaFqqTzMcR9X4l5YbRfPbmAyivyYH2smt15kWQRxeYmzzC6hzntcwKiki7PbIXXpuR9TYs50rNAXM32t47M+XnVbbEWLU1lZKn3kW+fu3v/BGlvBQZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765315488; c=relaxed/simple;
	bh=UgzjhPq2v3FKQ4CV2bc+Q9fAZjy2Ij5d7yMmayuxA2w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JoBKQKL+a+LZJLBspyb5FxLWXDIdS3L3x2lteENmOwjg4xVKGjUWqn5AAEkYNs7C5C1LKLxcujjZGQW+KDBT0qUn1lS6k9Tsx42rZ2r2L1n5O4v/pPGdxZo/5cVoZtkyAOy3mWQqYGnTS+9undHDx8vrJDtj3CI1GF8YLNX6olE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMzz1I2L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488FFC4CEF5;
	Tue,  9 Dec 2025 21:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765315488;
	bh=UgzjhPq2v3FKQ4CV2bc+Q9fAZjy2Ij5d7yMmayuxA2w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FMzz1I2LE6dYmser9ecV0KgWvxfGJvbJ2ux22VzUCKYBRit68WsPP586Ed/5zCmKN
	 t9R2493i3jnwuWBYPmTp7eXJMvtMDDVIXHeAEYA9g8QmRkbAn3mHtu3HvN+NCUd/Ne
	 Jt2Qfcs2iZF3JlWU/j3ilihxqPAkUnfwH6J0Acg3LdRD9jcLP1yxFf/0CrRdbCOwf7
	 4ODii8mvxY2knXRoDjE40EzASbt5LHGoQJEJgBv35qm5LHxRnnj96MGTwM50jJksuA
	 l3niaHgFdGhgPY9QGP+GD50K/HyHGQ28dwrIl4HT4/lBmcLD7bEv+N2fQsq6vDuYwW
	 OMGWLr4Yanhpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78DCB3808200;
	Tue,  9 Dec 2025 21:21:44 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <aTgQb7d1YDZCk3IQ@alpha.franken.de>
References: <aTgQb7d1YDZCk3IQ@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aTgQb7d1YDZCk3IQ@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.19
X-PR-Tracked-Commit-Id: 2b6d718c8dbe61aedffd7d12cf7bc60fab6f3d0e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a3984bbd69055898add0fe22445f99435f33450
Message-Id: <176531530296.4134342.18243019827703885573.pr-tracker-bot@kernel.org>
Date: Tue, 09 Dec 2025 21:21:42 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 9 Dec 2025 13:05:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a3984bbd69055898add0fe22445f99435f33450

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

