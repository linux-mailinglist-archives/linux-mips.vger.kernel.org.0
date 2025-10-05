Return-Path: <linux-mips+bounces-11622-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EFCBB9A67
	for <lists+linux-mips@lfdr.de>; Sun, 05 Oct 2025 19:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EE471893B9B
	for <lists+linux-mips@lfdr.de>; Sun,  5 Oct 2025 17:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0D61CAA6C;
	Sun,  5 Oct 2025 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNhkHe9i"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E431C9DE5;
	Sun,  5 Oct 2025 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759686223; cv=none; b=WHUKSlc5cTNmlxFGIAvD/EDGY/A975U4+rZxq/gsBTDpCIzpOxxCzUHRp7dxBFm7MxRN6wJNsGqC3/jx9o6o/Sk9XTbKGMTRVQOi9Wbf2QD72Johl/PqddofTbL79ScIj3YhIBCAsxsUxSLOGbkuO5YXZU1YiLI7P7yYumsVy0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759686223; c=relaxed/simple;
	bh=z/5JgtI0tJwE0I2BaD6SiKRejwr/3tB6mu6XNaiLjbk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YsVaLrq8MBVkynZsEPvxpnjDxVuBuWpE1oBsYIDMvU/r+u/KYIcngnztUjG3PcxVOEyoDI7j2nH7Th3/aR6Y1aPeELaxKEA0Y6REwMp6d8DaG3KqWiYiXudaO8gVS8sZdiIy7BH9oTrRTJlLDh6JutZHgspO9nhrdsNmbOjXVBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNhkHe9i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B960BC4CEF4;
	Sun,  5 Oct 2025 17:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759686223;
	bh=z/5JgtI0tJwE0I2BaD6SiKRejwr/3tB6mu6XNaiLjbk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UNhkHe9iPYYrz1mVEzNfc+3ZxhbqzTzOIyzHFO/XhqHsuvyAOuMaxSYJ+iNNMFKfW
	 yLj3u7lQQsY1j6MzmkhdfWfHfLrl4BSSPKs0j79fJddznzrzW4c0n6jdoP+LJjslhg
	 7IHE+8++IQ15PSGZhw8w58A/xkZ30FQ8lKLFJq8yR5sC78EVwri6ILGj9OOB/7gwGJ
	 1wLrefi4mPZ0GRnZWo8RCM4gFmWCHvav2JFkFjlrMI2fTYF4XUvpr1hiUwtCJb0ECR
	 Lja13JoV8jusVT5hYMQ+jGjFymOjlFwf2eJRfIePMszNkTcJkW7T44emu4TMA2Trm3
	 MSiC508frJzYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BFC39D0C1A;
	Sun,  5 Oct 2025 17:43:35 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <aOI6ca7yqZGqwTRL@alpha.franken.de>
References: <aOI6ca7yqZGqwTRL@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aOI6ca7yqZGqwTRL@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.18
X-PR-Tracked-Commit-Id: c662a6fef10aff3b13befc499335a334205316d5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6a74422b9710e987c7d6b85a1ade7330b1e61626
Message-Id: <175968621383.698585.6780233142386182560.pr-tracker-bot@kernel.org>
Date: Sun, 05 Oct 2025 17:43:33 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 5 Oct 2025 11:29:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6a74422b9710e987c7d6b85a1ade7330b1e61626

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

