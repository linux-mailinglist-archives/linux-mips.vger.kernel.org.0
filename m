Return-Path: <linux-mips+bounces-9965-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C165EB17673
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 21:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02431627F84
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 19:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BB72522BA;
	Thu, 31 Jul 2025 19:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5mHJipQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9702512DE;
	Thu, 31 Jul 2025 19:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753988835; cv=none; b=AhCrjf5SMcKmeiPUiLudnwP3qS6JiKJz2fTEb1gEwS+pCwtLbIpQurzFm2AzpBNSEEpHy/Guh7ViZCxMF0wDjlJsFT7IeldsgFb4kWjNEq/Jt7XUMS25uD+E3PJfkO3z4Dm2Jqw1dI1vZsG/3s/YFV/89BawMzSDvkxtz/B+P7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753988835; c=relaxed/simple;
	bh=ZHthN/I7mZ2ZuRJT6dZQnUctv17+KK09y3rmOtJsaew=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=haVWcv+8M9QJ7/R4Nn0xPPnXwIhFOo0ZpIwpvFIVzInULQ04+xcVuRuTiofBCD3t9AKVO8Id2U8UcJDuCXNp55CqCLSoNMU3AcAa91iWIrpFLMjGRcI7Z5vN8U/gluKcRlIOxtoqVolld4kgWYazmF8c3nvLZbTaKQLQdwKv6rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5mHJipQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F091C4CEF6;
	Thu, 31 Jul 2025 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753988835;
	bh=ZHthN/I7mZ2ZuRJT6dZQnUctv17+KK09y3rmOtJsaew=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=r5mHJipQbzkjmSOQ39qTr7pyb0X+9Ipz5M6hmMnotVPLPFu9yzod8JTUyF7/pI7mg
	 DKV91G5bdAzLyt49YAswMwtBgHYs3xxm+4hU8PCXpzYHFYS22HmMdxrWnA/djSQufP
	 SStnPS1G6ToY22BBAA1856hXBKsWC2W0NVfRF3zcDTSLZ8RD45oLgHM3De/Q+9d135
	 yna7abjGSoB+9m2WSWkoJ6oI6MDabhuOh+/xjetfErVhqFvXXSAvwCogpUqv3UMtzs
	 TLoX7qMoeT7HvdlVKJIzuRnMzH14UPj09F/LRXc/YVUcMi5fnaRJ7LdllSUG9GYgWh
	 FhWnw3qKHAXlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADE5383BF51;
	Thu, 31 Jul 2025 19:07:31 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <aIomWdeNOQwaKPu1@alpha.franken.de>
References: <aIomWdeNOQwaKPu1@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aIomWdeNOQwaKPu1@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.17
X-PR-Tracked-Commit-Id: 3ebcbf079c26ab6e82faa7f896b66def55547eee
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f1aa129d80fddd2ae33080524bf84dea1c3528de
Message-Id: <175398885052.3259326.7948018284310799507.pr-tracker-bot@kernel.org>
Date: Thu, 31 Jul 2025 19:07:30 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 30 Jul 2025 16:04:09 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f1aa129d80fddd2ae33080524bf84dea1c3528de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

