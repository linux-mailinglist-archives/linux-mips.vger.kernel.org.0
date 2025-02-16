Return-Path: <linux-mips+bounces-7789-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51875A37707
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2025 19:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58AF216A2A1
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2025 18:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5BC1A3146;
	Sun, 16 Feb 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsNYw0q2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2C1A3142;
	Sun, 16 Feb 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739732309; cv=none; b=j61fqvYaNiNeQ0o1/3RrSJBc1VF2xPiT7QCR2Kkn287+k+LQV3Wj0nJY9vWoKj+sXr7TdHHiBHxWHV/1945KPQD4MKcsC5Y/aJp1DxrQt3qHq2S1EC0imMYvIsqNwcQzun+waI/Xz8GFOjnZGi1SrZYqA7m1QwMcjphqzLkPK1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739732309; c=relaxed/simple;
	bh=gDto6+ipu9Aw3edQ/Qi8AtN/wE+7raJ24pYo70xP7Go=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HhycuZsvl7nRTa8W7zOB0IGtJPZIfjZ4zSjnhLfVStP67e5pjYBYsDqoRqmX8W1Lom6qDnMrHYeg+I3CBEIUvLakFYrHY9wyJU95JhhjmdcPQsboQTP+ts+0nGOdg4NzM6baoh9ycHtp3wk92jAX2+LXOQinD4V5eC5mfe+l2h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsNYw0q2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4825CC4CEDD;
	Sun, 16 Feb 2025 18:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739732309;
	bh=gDto6+ipu9Aw3edQ/Qi8AtN/wE+7raJ24pYo70xP7Go=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CsNYw0q2iiodv404+sTCKtpu8/V5MYIsSgcnC8uJzKTVGbvG2LYiIEdx+QKh9N6LP
	 JDcLiLH+D8nREK7L7glRVGXYE0tYIpOqyPVPS88KoeFmD40EO7mcap2+mmfa9rN32s
	 YtvzhtuoSeY9fpdUxT3TWrBe0NXfIsez1vnNe3fJn/shPXIqVmz41LrVTiuuU27SGK
	 Cl32HHtswxExh1BZBlTIZq643l6IgSX1JEdfSUVZCwRxXMgI3/D78JK5pgr8M899we
	 F5zerCErR1I6SDj4j9HF9TGxxY/Im0QdKJigsYJ3sDQo/xiXklYiDryvuErzPdKrAN
	 LRbhq5aOxJ1Zg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C42380AA7F;
	Sun, 16 Feb 2025 18:59:00 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z7GyFB5hAays_aII@alpha.franken.de>
References: <Z7GyFB5hAays_aII@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z7GyFB5hAays_aII@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.14_1
X-PR-Tracked-Commit-Id: 733a90561ad0a4a74035d2d627098da85d43b592
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b878a1c072a4912e14a38e90a8b1883d4c513d9d
Message-Id: <173973233909.2551255.3314508367701846025.pr-tracker-bot@kernel.org>
Date: Sun, 16 Feb 2025 18:58:59 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 16 Feb 2025 10:38:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.14_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b878a1c072a4912e14a38e90a8b1883d4c513d9d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

