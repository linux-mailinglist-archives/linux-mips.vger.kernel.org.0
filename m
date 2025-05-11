Return-Path: <linux-mips+bounces-8971-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E05C5AB2A4F
	for <lists+linux-mips@lfdr.de>; Sun, 11 May 2025 20:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67C67171C26
	for <lists+linux-mips@lfdr.de>; Sun, 11 May 2025 18:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E381625FA2C;
	Sun, 11 May 2025 18:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="go34NXY5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD5C18BC1D;
	Sun, 11 May 2025 18:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746988765; cv=none; b=p8fTK+MmYpI3FPYd/9hz7KZ1JBLRiQ/jppK9rNuQnypOPX2foSTefNOYhJrfrPEAw8jT1ej3Qp5sLyRHlrs+E0KRvpA5MX3DXh7Xjy/kqiRx09oHTauFfMo+CQLJcAaXFxzPcL5aKxC5sP7Gm7OKVFIhFWJKt0IMLozh9ONGUrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746988765; c=relaxed/simple;
	bh=93BJNOQdSaR1P/AsTeVC+RnBexezIioF15VALD8UhLM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FnXHGS9cVxPEoPL8FQ9136RO6/K9ZIdmEywtVxNPGtqEXLE4LPqI0Kjk31i9upWVNZYDOLxenNV93uh2foqIXuwIerDYxlbzcuVlOUlBYBr0UXPKFfO97MFrUrjdx4MbbBdghO5OWZtIYPsmJeQ83QK0e40eg4Zv1dknkEW+MJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=go34NXY5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5E2C4CEEF;
	Sun, 11 May 2025 18:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746988764;
	bh=93BJNOQdSaR1P/AsTeVC+RnBexezIioF15VALD8UhLM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=go34NXY5CubeD1lgA/ffuo3BXnib4hV+L6FKgTR6qSNYGNnNmwHS17ViSE5UBOBnH
	 sOdJ6XakKXMnSm9FJg4uh0rS6dnxkKflK5iG5OSmMB5OZgTZs3jTnjf6RkYNlFhHdC
	 Llsis5x6VJLOxZlGqhZs4nqqpK0i1W+tXe/YhRecCtRAUL+j7IoB5wOroxkmQjjN10
	 AVpSbsUdyGkxvywaCfMuvFS5OOoNhec/7sqntQetomPL5/49hTvhSuLGHwKfcDMKxL
	 mr09euSMgpozl3vrEqxizQw6WyEt2hA5TkkXVCOUBPolK1hvYv4v5hWt7cV+g4MvNC
	 H18hTs9PAFkiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D8D3805D89;
	Sun, 11 May 2025 18:40:03 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <aCBTCo8kyo-LxpV5@alpha.franken.de>
References: <aCBTCo8kyo-LxpV5@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <aCBTCo8kyo-LxpV5@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.15_1
X-PR-Tracked-Commit-Id: c44572e0cc13c9afff83fd333135a0aa9b27ba26
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ecb9194d1724d1265c8cfe50fcb1dad718476e5e
Message-Id: <174698880207.20988.14957158954423763040.pr-tracker-bot@kernel.org>
Date: Sun, 11 May 2025 18:40:02 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 11 May 2025 09:34:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.15_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ecb9194d1724d1265c8cfe50fcb1dad718476e5e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

