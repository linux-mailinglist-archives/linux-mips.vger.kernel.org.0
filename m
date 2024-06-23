Return-Path: <linux-mips+bounces-3865-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9A913BFF
	for <lists+linux-mips@lfdr.de>; Sun, 23 Jun 2024 17:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48AD2B20FC4
	for <lists+linux-mips@lfdr.de>; Sun, 23 Jun 2024 15:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA1E183087;
	Sun, 23 Jun 2024 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCozp3lY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339D9183085;
	Sun, 23 Jun 2024 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719155599; cv=none; b=j6Yl585kTZQLn7yNGO+rbjO3hk9bexIHGOZSGq4aFncnY0DzgSwvErNDwYqMGceKno4z6XhEgqvTYbqgufT6vyCblKUx1rHs2e/B+pAnstW8G5KifP6JF8qZB3cgg6xav2LcvrjhxYOGCzd6hsIYjuGn7PDe+h4gK0D+HS3NPiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719155599; c=relaxed/simple;
	bh=EelfNt0DZqfzjiXUZAeA1uRcfgcS0xksHQrXZ+B3MP4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XcPmZ127hfbtIJIeY2e2+DOKjmHq30eUJuolEclmvPpJsd4IyC/VY9ek7biBRoN6apflPvckvEMMCoyLax2kAoDiZBg2CP3ei3WxsQ3JAEr1DXYBSuMCjUEAC/8HKT9LFVQ4m+T3o4irNMiI/Qz2G2L9V6XYOc4DhUYclBZ94qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCozp3lY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 106B1C4AF09;
	Sun, 23 Jun 2024 15:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719155599;
	bh=EelfNt0DZqfzjiXUZAeA1uRcfgcS0xksHQrXZ+B3MP4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JCozp3lYsYok9+sDPD8pMKCluFcBYHuz438G/cP5/W0L91iRO3FBLZsONc6J22whX
	 EHo1ZxkV4d4OpejTdJDUgh9TYRCEZhYfDEbyW7dZKavOeO4eDAQqj3YQO4ouOw9syX
	 pgka4wUlblZYYhzy09w6bpbKgHL+NdAWUGvaTo+OsFZtdsva+YsNP+su/v64mHrMLF
	 LryLsQScso/DVjsEoQi5ACGQ0bnnHkAiKOFYJ2iI4keap8h4ySL24s8UEiXLKsnlM6
	 +jHIAL9QnLVYkytPXbllVAynpsNJlFmw50u4ukrD+moIx5EzgCNaGw+VaBQ0p7QB44
	 JwkMA7LcuNTVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 02471E7C4CA;
	Sun, 23 Jun 2024 15:13:19 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <Znf0bReGRC9C1ACk@alpha.franken.de>
References: <Znf0bReGRC9C1ACk@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <Znf0bReGRC9C1ACk@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.10_2
X-PR-Tracked-Commit-Id: 0d5679a0aae2d8cda72169452c32e5cb88a7ab33
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b67eeff799489b2d5350130828d1793ff6c74cfb
Message-Id: <171915559900.3671.16992226190571995885.pr-tracker-bot@kernel.org>
Date: Sun, 23 Jun 2024 15:13:19 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 23 Jun 2024 12:09:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.10_2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b67eeff799489b2d5350130828d1793ff6c74cfb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

