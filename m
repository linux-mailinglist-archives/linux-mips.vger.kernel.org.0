Return-Path: <linux-mips+bounces-12538-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB6CD3640
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 20:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3E643001E0B
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 19:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60911272E6E;
	Sat, 20 Dec 2025 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKJG3ZiZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D88F30EF9A;
	Sat, 20 Dec 2025 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766260163; cv=none; b=NvfjU8JlQeoDOpCpdlXpy29u6XgMYo1zhqrzqECP0cK1GdDwnN61uLqWrW18DvDGR+D/XQ4NS/Qo3Cdh9a3u40li1VZmo9yMdCN8NUAp4AzggE312r22HMbxMFRZcBhi5HIxmk8gbvFu6GlMW1IOV0TR94ByF8HBC3TrMbPj5mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766260163; c=relaxed/simple;
	bh=bjhi1MivxKa88lgdGr9K/PCXelnhWAMmeKiOl37l1/A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Sl415fjqY9wVThURYsJ0m3gINt6o4PZPvTKKYGldIQuMquqbRa2lFJ27hhY27zuBagsNKiiGlPgJeZ3VCGdi9jSOMK0JYTQtdfO+0hsPfasRBbcO2wknhva3E4GBiR2Zo6qr/TIBAdhKtbXSPQ0WJlMvCTOK6uXtklfLLkvG5d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKJG3ZiZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12CAC116D0;
	Sat, 20 Dec 2025 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766260163;
	bh=bjhi1MivxKa88lgdGr9K/PCXelnhWAMmeKiOl37l1/A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fKJG3ZiZEVmGG3suLfGc1VvXYjKYx0F8hMTKtad+otwpjGnCVpGdezZuKetdMY8Op
	 nmbkVtRzEjJ+2OOtq8CdyVaI6ovXjt7TmZvrD/ABS61VFiW7z/MlkO9O3H7bAaQnII
	 qUanGZFZoNRySmxECRSvNpFVRA/CvvA28c28fSaHQnu1AItjpDUq/lalWw5R7swJhx
	 UzXF+olvJKr3hsHUjk2fUV6KOmE8zg/JIASe66n7eV/67IuTer+WNbOW4vymrXYWkZ
	 TVeCczcrRkFz6/QXwlI3CJKnZlbPcfeCRmgjcPH0wIB8liDhmuFfnrjjc2lLWRSnQZ
	 2JSdNLRY3qDOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3D1303809A07;
	Sat, 20 Dec 2025 19:46:12 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <aUaSEkIf-vwMXc5j@alpha.franken.de>
References: <aUaSEkIf-vwMXc5j@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <aUaSEkIf-vwMXc5j@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.19_1
X-PR-Tracked-Commit-Id: 680ad315caaa2860df411cb378bf3614d96c7648
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a688362b19c408dc501dca3e1651e446afbd5d9a
Message-Id: <176625997181.124167.9597999119258605595.pr-tracker-bot@kernel.org>
Date: Sat, 20 Dec 2025 19:46:11 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 20 Dec 2025 13:09:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.19_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a688362b19c408dc501dca3e1651e446afbd5d9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

