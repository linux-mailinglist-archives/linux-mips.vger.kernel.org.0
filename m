Return-Path: <linux-mips+bounces-7659-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAC1A24C24
	for <lists+linux-mips@lfdr.de>; Sun,  2 Feb 2025 00:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E338E1884EF2
	for <lists+linux-mips@lfdr.de>; Sat,  1 Feb 2025 23:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6971B155393;
	Sat,  1 Feb 2025 23:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQykT4NR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA9C147C86;
	Sat,  1 Feb 2025 23:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738452296; cv=none; b=X8+4iBytF/BkilfbJFzFklAAA6A0ScjzcWoBHb2p/QML4Yn9eXdfHq8y71di7KDFMmCmoGiQko3ZKzHLJpI8l9mMglP8TKR7yl0pWnnm4XTkI4lj4RTPBZXdfCb7kBtmwlK1rtJ0bN2KWV9o7Ql1XzeXVZyC+0hHwxgbJw8WHYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738452296; c=relaxed/simple;
	bh=k4WK6xFgLmljju+n05YguGc9J2fsaM0Bhpg02auVPF0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kVP0NFBamll0pfTcRPApnjih0TkB01YRQ3da6mnt4LNOLzs0fghAgxWNwxsIbVEWAmRyQqqvHNsmof1BNiPFr1m2Va56V1NfUcIJIi8ZRetUxCPiNsFgpX93oYkm2jS8gIjYi+JezqAHCPdcaBNouL9VOWptYd6z/qDHXEr+VZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQykT4NR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6828C4CED3;
	Sat,  1 Feb 2025 23:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738452295;
	bh=k4WK6xFgLmljju+n05YguGc9J2fsaM0Bhpg02auVPF0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RQykT4NRlRK/NKgrjkb3I5x3Mjo0VbPiONVR8gyR9LIlCjoTQ/u0MgnD5lSbYFp9l
	 ZES2XJM9QRK22IVTI15VnfvK8hzq3i+iIdgcCFcoSkOakD13sqlhT6kcDe+pTWuRgP
	 SCrFZ+7Z9nrorc8OOvSCfZ+Isz75i48nIX0kXrc5xkfc0X9p99yScvZ8gDd6PhQSet
	 mEI4r8iN0AzK2KJ44zK9bEUY+sMXb1SVfCqJH5ZxgOcwcJUI4q8SNj9R1L42j3xoZs
	 n/Gmf44peF4mrKdLSK8qfBsmD9m/24dubSc7lOGQ2d5NnbidkyHwq6ElMhl+bG9ErU
	 BgrDmGcI2pfyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC56380AA68;
	Sat,  1 Feb 2025 23:25:23 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z56P2zOAU8Sjm1a9@alpha.franken.de>
References: <Z56P2zOAU8Sjm1a9@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z56P2zOAU8Sjm1a9@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.14_1
X-PR-Tracked-Commit-Id: ec918a11e63856999b31705e81226dd7dc043e20
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c270ab5a87403f9365c00d3c587aa8000560bdc3
Message-Id: <173845232226.2011566.7617122744828053282.pr-tracker-bot@kernel.org>
Date: Sat, 01 Feb 2025 23:25:22 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 1 Feb 2025 22:19:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.14_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c270ab5a87403f9365c00d3c587aa8000560bdc3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

