Return-Path: <linux-mips+bounces-9162-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF37AD08F3
	for <lists+linux-mips@lfdr.de>; Fri,  6 Jun 2025 22:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9F4E17B5B9
	for <lists+linux-mips@lfdr.de>; Fri,  6 Jun 2025 20:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA01221268;
	Fri,  6 Jun 2025 20:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afDZ0HbQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA294220F54;
	Fri,  6 Jun 2025 20:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749240637; cv=none; b=D5ZYu+NM6z0yXh5xJhrMYfnUCSy0sUIFFficMIAnI3xE5H9VWeMb2ODZDdM/HQfk5putBxBp7vDnruxWFI548CP7+jar5pPvu9mR6ZKZwq1MKBw+dVaNERpqz5XIhpxUv4uhQpSAVRt/DHOL0/vwXNND/G8ZPJeM6BBXw5DeX8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749240637; c=relaxed/simple;
	bh=mDWKm3WHePczcyaURGUxHBFSZHmaUhKI0XYVdkTnNQQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=h2iA5cfcrASCY7bXssJasDQIcpGsb9FP9pwJg9TrAk1Swm5GO+lKIKjBqppNEGkpkQIY0ceBu5KECiAD4SgCkGiZRUKYkbdwFVXc/81t0o4HkpA7IFuFDxSlniRrtJDiYx75rj2yMaQF7Vp7qD50l4Hbd+iu8tqEkKZws94QF6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afDZ0HbQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD61FC4CEEE;
	Fri,  6 Jun 2025 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749240636;
	bh=mDWKm3WHePczcyaURGUxHBFSZHmaUhKI0XYVdkTnNQQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=afDZ0HbQZrvpvJgEISqmOfONkSxYYVTKMBVoz/+3BJb7HvKQxvjBFMa8SZxHCWrvj
	 MpR3z50yuu83FZpqDKYqFH/0y/qZJ+f990ydg0+h4+BwiMdDsLFo0yftoF5Biq4Ao3
	 ifokqGgb0baai3Vm3m7759nGlk+zXrZOM4sZceyjqQJj4z7AKeCSIabbmf13Jz71F5
	 vItIXx4xZJ3yGdwTQzCnp081MOLC84sVslRAO6ieIMZ4/FowBxIWCTrd8pH1VfAEG4
	 vy+C4d3yxk+Lv7VjUODscEE/SUrQtOV9ZrFSchU5Iqhm2IkTGsJwh3Bco+FtzE2Bct
	 ein3L0LVr1Jxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDB639F1DF9;
	Fri,  6 Jun 2025 20:11:09 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aEKQtJcSIeKklwz4@alpha.franken.de>
References: <aEKQtJcSIeKklwz4@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <aEKQtJcSIeKklwz4@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.16
X-PR-Tracked-Commit-Id: 5a0c749125c001cba673e9951b0002fba7ea2886
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 67faad74352d1ce0c1f411f92fdb1e0c0f3c9380
Message-Id: <174924066859.3964077.2513187462969321508.pr-tracker-bot@kernel.org>
Date: Fri, 06 Jun 2025 20:11:08 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 6 Jun 2025 08:54:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/67faad74352d1ce0c1f411f92fdb1e0c0f3c9380

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

