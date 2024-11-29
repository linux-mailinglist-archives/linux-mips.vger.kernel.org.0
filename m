Return-Path: <linux-mips+bounces-6811-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF589DEC41
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2024 19:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30754282115
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2024 18:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F001A01B8;
	Fri, 29 Nov 2024 18:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9/Ofd5O"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE13E1991CF;
	Fri, 29 Nov 2024 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732906518; cv=none; b=O1GUiabZsOMIw7MOQyM0OxE0mKabkeUbnmZNRvC4/YPOC3q/9QdAQQJZHaFvIkC5QvnR+ZHbfd1vpNMt/tYLZYM7tacfo8BDoW2w+7rKjI9e9IYfUYPEWM4u4WHQ4mRVO6PJBvJ+7J2jHXEBqeoCzzwRRqIiK1Y+YFOV98yYDyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732906518; c=relaxed/simple;
	bh=3bo6lC8Km/NC7oZ8bSAR5qu6fv8TndZjXbwF5wJLdD0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FikKG1BnvHms2Zsa0fenmXyR779isJOqOkGEft/94MDy2Kbi3TcvofCuK/Ab/C7RDtE0SQyFi1M37J5TtfyQtnfTGnY3ZPs38Wr70w6rlNcJ3fF/WIxgQy7UVwrIoQHvrAm4nvYXEilm1jiaVMD774LKKoZXZXiSPXj+QSEE4pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9/Ofd5O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE022C4CECF;
	Fri, 29 Nov 2024 18:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732906517;
	bh=3bo6lC8Km/NC7oZ8bSAR5qu6fv8TndZjXbwF5wJLdD0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=D9/Ofd5OdTjJfKx5UpYF6f6rX8R/a4BOhgn1ZseCpcvdC9/5yWT5B7AwGzEdFmKqH
	 FKBS8IJT92m4y1P4KK3mmuAh1PdiMYp8/InC6Q+sh0pq9H1vvPsNT15IPwsjWJHhHx
	 AoZx1unJUPAlJiY87QR0tYkyUQMOqjw9ggTAHBSPJrJBk3Zc+3YTliAY2hA1GAU1QC
	 mgRQoRxY10XnSxPYBSepRUr2e1BLZyE+0UZciF3WeFDc4sU5qE5xJAQFSDHQ+QDDmJ
	 3ul96t+LFU5PDPdpyGNmuIJn9Wi2wfUTVQta9F/JsFeinm0eHcK/A4omzHwqRZd2d3
	 HI7O0RXkLAwmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E22380A944;
	Fri, 29 Nov 2024 18:55:32 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes pt2 for v6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z0l8dqSzSPrsbmFj@alpha.franken.de>
References: <Z0l8dqSzSPrsbmFj@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z0l8dqSzSPrsbmFj@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.13_1
X-PR-Tracked-Commit-Id: 4fbd66d8254cedfd1218393f39d83b6c07a01917
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 63c81af15cf8e64045e8ec55991363ef569a267a
Message-Id: <173290653114.2148737.17048152966947733909.pr-tracker-bot@kernel.org>
Date: Fri, 29 Nov 2024 18:55:31 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 29 Nov 2024 09:33:58 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.13_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/63c81af15cf8e64045e8ec55991363ef569a267a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

