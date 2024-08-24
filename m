Return-Path: <linux-mips+bounces-5051-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B495DAA5
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 04:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFF31282D77
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2024 02:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF7B29422;
	Sat, 24 Aug 2024 02:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZu+564Y"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C2428683;
	Sat, 24 Aug 2024 02:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724466407; cv=none; b=Uo5tIgwXyJEOH3IbEHvCVzHmCAQDp6fWL16bczXzni134mXZTADLLLy25JOlZ69NIxl+KK87g9ZAa6zzo9ONeerjgZiBF7Ryf5wMrHQdWg9a044PxqWt9ljj7KRJweTcJJ8ZkHlDXnisS5TcaMO5+Ne+gNawMndnJ7JMqko5AH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724466407; c=relaxed/simple;
	bh=KnwCacuCVW/RLuv5iqzNWLhBKOElg/QYXiY63cbGBe0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HvvaQumvsIgs2PCn6fN5RcFO/tXU+1BHbJFcYBAlh/9UOCQ1aC5tr0lpKV6U13KxZ1VBRc8QHAwLMSHxDkE1rdGYPOLxbYvFjX7N8arE8/XzjpkogCFgEl2gLZRpZd/g50zVeV7Wt5nRgc+xZ1Zgbi9CKvLkQMmxGqF1ZzFqGu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZu+564Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE38C32786;
	Sat, 24 Aug 2024 02:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724466407;
	bh=KnwCacuCVW/RLuv5iqzNWLhBKOElg/QYXiY63cbGBe0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QZu+564YSMIDilf/rPsRwP9HdVXJ6H7920NB6tc+A6axLC84UUHvF5pNRvmVy94Fg
	 tnvA1NXcpygXW50kidmfWjIu0wa3nhKloY2TxkAwS5hJa0xb1k6d7q6D3XGaoLvpYU
	 TG3jSN4uCBW9hF5/2XI0YCdSD3C3tfrAPEt/itHKR5+3hecfuXABgiCur7zNojrEMx
	 dv06tPnoqriEI8GFA332dAVRguVgrOGQ+PxZneznNozhbl0ih5y+GQgP3HOhUJm81i
	 mD37vvEYa+RMR5ebIVIvl4CYfWpoXMPr2IjEIdv1HcfKa1GrE5M+sEAWMgyqtZGr2D
	 n9ZodagyE5uBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D3839EF647;
	Sat, 24 Aug 2024 02:26:48 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for V6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZsjdfYhJ2F/JIsFT@alpha.franken.de>
References: <ZsjdfYhJ2F/JIsFT@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZsjdfYhJ2F/JIsFT@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.11_1
X-PR-Tracked-Commit-Id: 50f2b98dc83de7809a5c5bf0ccf9af2e75c37c13
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5bd6cf00740765c47b5684e2d75ac90d3371659a
Message-Id: <172446640703.3135457.3325292441600019008.pr-tracker-bot@kernel.org>
Date: Sat, 24 Aug 2024 02:26:47 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 23 Aug 2024 21:05:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.11_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5bd6cf00740765c47b5684e2d75ac90d3371659a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

