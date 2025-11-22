Return-Path: <linux-mips+bounces-12324-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2AAC7DA12
	for <lists+linux-mips@lfdr.de>; Sun, 23 Nov 2025 00:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97F643AB649
	for <lists+linux-mips@lfdr.de>; Sat, 22 Nov 2025 23:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D68028DB71;
	Sat, 22 Nov 2025 23:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPHHYn57"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78742874E9;
	Sat, 22 Nov 2025 23:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763855761; cv=none; b=eoLpLGtB8kZZ3uh1cB3rjoMnW0Ic5P5GpYYQLGvaB0pwjuJZAB9n5uN1/QbFo8ScsrX7E2fbxLy08ZZDbow4FDdPAyzgC1FzP7JYgBIEeMbhvk2G/DvQfUjZG0fL9dSsp0xBU24JVaCJpgNCKG+wWZLYAv+fj9srut6jkNvyi3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763855761; c=relaxed/simple;
	bh=Pf6AakACTmOZcOcu7zgL1sFCmSemsbio59sEs8cxG1Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AcRB+yUMBDIeiUIESFGkQpP00Q/TPyN8iELNvly5TPdsNP5oP2Pra0hnKVcwe5TeeEO4jgpL309IMvRq+CNFz7NZvvY00ueyhcgbmfdrKKnnLXvkOR9cwJNS6GgRUJnLP40ZcK4rk92Ztk7+TjooipX3R90B01DA/OdjHCdb/x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPHHYn57; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFABC113D0;
	Sat, 22 Nov 2025 23:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763855760;
	bh=Pf6AakACTmOZcOcu7zgL1sFCmSemsbio59sEs8cxG1Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jPHHYn57sSf8FspbzeX2BgKThLYoSjwrYJnxn88hreUkBSIkGcu1Vrfns1X3k6w4/
	 GXIlIUfnS03ajfVdzUAJr3WvZ0dUoIUcIibtD98bd9xzIsXVAkxFEbRngeUqIShnMg
	 pVgQoknhmgKsqZrkAyl08xKjd13NPc60ZKvunHIguvGEm4Eufgm1CXEWQVh8tU15K8
	 /iTPIRUc+e00r5RMWemTldmyXbhm+QDLLQw84EA/SDzk+sJFY9WxctdXnUUAevrXRX
	 Aat6/oukRckyEwh+0eF9zN1J6e+PIVxkqOjuWtymFQ0A93qi0HvndroNJ+EscabJBB
	 RJCjCujF5aPTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC843A8576E;
	Sat, 22 Nov 2025 23:55:25 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <aSIhefXIXrLpMaC5@alpha.franken.de>
References: <aSIhefXIXrLpMaC5@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aSIhefXIXrLpMaC5@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.18_1
X-PR-Tracked-Commit-Id: 14b46ba92bf547508b4a49370c99aba76cb53b53
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d13f3ac64efb868d09cb2726b1e84929afe90235
Message-Id: <176385572411.2905465.13534854849632499117.pr-tracker-bot@kernel.org>
Date: Sat, 22 Nov 2025 23:55:24 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 22 Nov 2025 21:47:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.18_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d13f3ac64efb868d09cb2726b1e84929afe90235

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

