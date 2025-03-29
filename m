Return-Path: <linux-mips+bounces-8405-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3DBA757C7
	for <lists+linux-mips@lfdr.de>; Sat, 29 Mar 2025 20:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 970CA16B8BF
	for <lists+linux-mips@lfdr.de>; Sat, 29 Mar 2025 19:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C741E1A17;
	Sat, 29 Mar 2025 19:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qE5LmsPG"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108681E1308;
	Sat, 29 Mar 2025 19:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743278151; cv=none; b=uxeFpyYFHl/SfeDyfJ9MqEfNgpnMqsi3eY/fpwpw+18UgCaa/GAYJ+8sK7VGj4ThsaFe4GNDXN10BhKT1twAIFfsBA9HRS2/etmcqYuNQH+VuHzkqQX0F1a7gXCj5mmlY6tp6/xCoxRqHvBEJ+DI/lxSuZRdBm9bXB04JsuLpS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743278151; c=relaxed/simple;
	bh=bqsDFFGagS0oAOxLMcAWA7YWPbD9kjwbdEVAlTJK9to=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZJlglRCBZC6qbQwQ0E7swvb6Bto/GH0zzCmd4nPt+e32yjcGqusLXBZ51aBLIsnogXeyQb7pxmLmA2P9A/XgTBaV+XaFF7qNFTz5lTnXwBVeHVUT1D2quO0/uOLE5hVO//HEaJfSUwneAfOoazz1/05JYarJWZKtY/Bu30pLsbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qE5LmsPG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A36C4CEE2;
	Sat, 29 Mar 2025 19:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743278150;
	bh=bqsDFFGagS0oAOxLMcAWA7YWPbD9kjwbdEVAlTJK9to=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qE5LmsPGsUAgvbRDHyh4p3fsFOJ+q6fPOjgoueZSQ9vnSnYUhdU4jgBk3BkcxKNAA
	 Ts7TCUp8mCQ77yTUCUHq49pp+FQ6e2G2KM5o9RzWIjSOFUiVXC/k+zmjh3O0r6k234
	 ohHn55RiUQSJWUQBEww9mz+L4dm5AV1DTPtD8YfWent2HN/GHycFz5HrkyUMSHRCaV
	 vAZHOE2p6yqnEGqtCtYvDuYMtnCJLLfqMl0zJOMWSpwGU50eH0Hy4UUfaYZr9m3P2Q
	 hX0XZt/0cZdwemPZwuu2mQd8cQ2ynmGH1O38IrzXNMzskLG/Z3DgG0/iQubgrhNjm3
	 ISu0e6KbI2cEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE975380AAFA;
	Sat, 29 Mar 2025 19:56:28 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z-fGGOyv_5IafH71@alpha.franken.de>
References: <Z-fGGOyv_5IafH71@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z-fGGOyv_5IafH71@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.15
X-PR-Tracked-Commit-Id: 855912be0b046028abc9c0577787e749a8d26cf5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c83601b8ffc1b4ba8dc7f35151131707a8a5ae7
Message-Id: <174327818737.3264055.13030607687351236949.pr-tracker-bot@kernel.org>
Date: Sat, 29 Mar 2025 19:56:27 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 29 Mar 2025 11:06:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c83601b8ffc1b4ba8dc7f35151131707a8a5ae7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

