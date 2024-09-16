Return-Path: <linux-mips+bounces-5580-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D1E979A89
	for <lists+linux-mips@lfdr.de>; Mon, 16 Sep 2024 07:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3E9C284357
	for <lists+linux-mips@lfdr.de>; Mon, 16 Sep 2024 05:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E77B4DA00;
	Mon, 16 Sep 2024 05:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0rNesVC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3B72D032;
	Mon, 16 Sep 2024 05:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726462813; cv=none; b=eAcX2u+hUIIZCzrzTlQ6b4Pe5zHDCo9XJI2fDhzHT6A6d/jwPB8TFFzCJsGIof7zlnbbMBqi6w3/R6HyqlZNEoLsXkrDTOEEmCN+3JAczRBNMnaz9rbaqAX80vMD1g3J8o1iwZN+kazazJxvvQH8voNu1alXs3vhqH/n4diPmEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726462813; c=relaxed/simple;
	bh=EU/LfaHmFYZiJ3Mx65EjFCGs70rhsyNyAishEETuuuY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=O5CFaiGmjg69DvXuJjG8nd4ORDxFvfn6wly0Sm273FoVFVPcIMPvvXWxv52fFEsLEsvKtIYHvTZOE0yxcHQKORyYrPF0ZYSoIhhe9H6IUUnVR0z40EP3dxRU2nRiMmRzrPF5jt9tOHRz4W+ViIhr/5jo/VBBw0dt3d+YLPS/KHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0rNesVC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB33C4CEC4;
	Mon, 16 Sep 2024 05:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726462812;
	bh=EU/LfaHmFYZiJ3Mx65EjFCGs70rhsyNyAishEETuuuY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=S0rNesVCcllruY2sR2/AXe3jzsIqboSZENw0Y5YYPEhW1GEH6HxQPRGdSkqQgPEr7
	 tWKd+bPFqzDNEKrdQ8Jvko3I+pSqfueXrac/Q2FJcbIgrSXfQ1/+YArSDShlB1HcFk
	 YYph/GOycJTTP2Bn9zRHja/xjUbGu0l1MPT4YI1I+Qek1Rh8ld3STM/w5q3zP8lEHw
	 O/+zJP+w/l6x027SQrA0Xv9DENevcBMFx04zVBzkMy+VzyhulEXWxWdWPURZ2e6VlU
	 ai2e73IXE9vdNkaf/Cf3pfT3XVJsCAHn6SCjxgWVWej5XV4DCjrkndiQPCmDHFb5KH
	 KfcEtX9mupdfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 357723809A80;
	Mon, 16 Sep 2024 05:00:15 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZuK6YZHRIcriY+Ys@alpha.franken.de>
References: <ZuK6YZHRIcriY+Ys@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZuK6YZHRIcriY+Ys@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.12
X-PR-Tracked-Commit-Id: 439667fb943cfea46d7bde5c7b29c89efec3cbc7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8617d7d6298f54dfef4038281863270b5864fe83
Message-Id: <172646281384.3240541.10857831593021387407.pr-tracker-bot@kernel.org>
Date: Mon, 16 Sep 2024 05:00:13 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 12 Sep 2024 11:54:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8617d7d6298f54dfef4038281863270b5864fe83

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

