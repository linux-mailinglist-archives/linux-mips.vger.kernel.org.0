Return-Path: <linux-mips+bounces-3743-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C90790F52A
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 19:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 104401F2209D
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 17:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0C3156255;
	Wed, 19 Jun 2024 17:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2ki9hx6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236DA156237;
	Wed, 19 Jun 2024 17:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718818434; cv=none; b=pa9B4Zb3VRlzumaDBc1QozyO5tTyMEspwT39vosGMHUJZW2Jc2OAuY4iZ79oh/rbCL5Z+O+Uc52m5HY8w0doUcj6fHppuTJFtE9mHThSvSYKKD93JUlH9uG1itqbIzDnohtwtfxy9pj7OoXukUSZnYpxtengrfTuERF8i7d4dGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718818434; c=relaxed/simple;
	bh=IlN+ArWEjRCMt5bQyQ0/MnQy9BaC7Nt4A/CNDxWRSoU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FSDbtxxaeh9B/6645AYUaD52yFmAc3Fr4bDhsgpxYl4raZpFfxDd9mR5y5uw5k6d9SrhdKZ9ky5IFgvqdSBR82U7Bht691NGwnZh/qNa9QA6SVSbc6AqAN3/EvT+l9e2HgQIGMgL/te8Mm0RYk0aMXdCBfo1oVN2zPkvS1m4fgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2ki9hx6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 033F2C32786;
	Wed, 19 Jun 2024 17:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818434;
	bh=IlN+ArWEjRCMt5bQyQ0/MnQy9BaC7Nt4A/CNDxWRSoU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=H2ki9hx6hYgMIuUd2Y79kAn0j1V72M6jJSeWBt6V4dYgp0qVAq+Psm5c1AJ/Opsn/
	 58yUHTTnvBDrh1JU3vuDNgvYYU5EavpdOJaohZdTeZG4XvgClnP3wah3emWxqie2sO
	 9OqcPqhquZVWbA1mxd1t7r2KKRFvDG5pvBAuWb8kLieJjth8f/GP/iHWBqd+RG7xDj
	 IGzhfhQuqA+5jDYsUUwRQ96x8KfJVBiZMdPg1jciKV8xlWVGVfHSANtge2TwWF12l9
	 FnkTRr8oXWDZjIvZ26IGZqASJxy1v185/1wsg34HnnqJjhNvfK0m/6aAUSdvcuMW5a
	 WRnv1ldUrnDLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E976AC32767;
	Wed, 19 Jun 2024 17:33:53 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZnK7/CW+hLH3/Hhs@alpha.franken.de>
References: <ZnK7/CW+hLH3/Hhs@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZnK7/CW+hLH3/Hhs@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.10_1
X-PR-Tracked-Commit-Id: 6e5aee08bd2517397c9572243a816664f2ead547
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6785e3cc09f149c42ce70eb92736d68c0db64684
Message-Id: <171881843393.4952.2497418037259685380.pr-tracker-bot@kernel.org>
Date: Wed, 19 Jun 2024 17:33:53 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 19 Jun 2024 13:07:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.10_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6785e3cc09f149c42ce70eb92736d68c0db64684

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

