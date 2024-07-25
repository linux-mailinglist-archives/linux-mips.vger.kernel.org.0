Return-Path: <linux-mips+bounces-4465-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD5393C9B1
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jul 2024 22:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7250282C9A
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jul 2024 20:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9F21465A3;
	Thu, 25 Jul 2024 20:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9IyfRuZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3011145327;
	Thu, 25 Jul 2024 20:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721939826; cv=none; b=MDmr4Qlc6XBocq+eKuENKVzdDDi3209SE5MH6fL726bTJdllSGhU39kwrlmnOS0OUSIurq+T8IWeWT1hK13c5w6BKBAhCxkRajQbENvIHto+mIuDad2rl3tHTVhffQcJrQkgCEv0nCJw/BJ0tqkCsqdO7n9CcEwJE6PzJjHeBj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721939826; c=relaxed/simple;
	bh=8cAni0LnQJEglAl1mfQGfFpJaEMzSw6593W6eA+gP2Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=g2S2BcACnDmPMGs3yv4FMszzu5ZjSKA8psF8GysU6FNnF6TY/TnxDdZeJDJSGmfCPpl1bp8pJMEh/wcmH9xGiWbzbpMywWenhlLwyzrCT8FCSNJf7dvF09Pwcup28JEo4SoXmPkzF2AurZU7GWdcAH+xOORf8In8R3fJRK3TlUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9IyfRuZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8502EC116B1;
	Thu, 25 Jul 2024 20:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721939826;
	bh=8cAni0LnQJEglAl1mfQGfFpJaEMzSw6593W6eA+gP2Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A9IyfRuZnbpMluz1yWirhaIcZE7c79Na0SN/P8+Sz6b8myDO8MNnt181m9FbnzBWz
	 0nxuwbnQGrJrfyo+q5WEGLroel6qRDdkFAdYeE/69dWPrLisecqyQh31ND9oUYzN3L
	 SRSAJcCyExbClfgeRjFiPc3JYfsVIMZS+9A9ebnrhwr1ZuoGqDWR1RGpHFhb5xd0Ah
	 GgjqRkD2yDmMc256HYBO3ZRjg/J5ezgS4Qd/XaYuFjxnpaA02Zv0tEOcDTTTaRCJG/
	 OtoYFKdZrTk+S22vrjpLGFJj6UKHaxw0SGGF23Afcf6/8W4B+HXmld7tOP9VBQ6cST
	 uTk2OwZ4um+Dg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7A1EFC43445;
	Thu, 25 Jul 2024 20:37:06 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes part 2 for v6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZqJ41Aiswy5guHm/@alpha.franken.de>
References: <ZqJ41Aiswy5guHm/@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZqJ41Aiswy5guHm/@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.11_1
X-PR-Tracked-Commit-Id: 2c716cf17edee74424336e87fe42b99ee5e91bad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 28e7241cb857415fbc8d8d962e2b423c3842e9f9
Message-Id: <172193982649.17931.16557327664484338374.pr-tracker-bot@kernel.org>
Date: Thu, 25 Jul 2024 20:37:06 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 25 Jul 2024 18:09:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.11_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/28e7241cb857415fbc8d8d962e2b423c3842e9f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

