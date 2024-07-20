Return-Path: <linux-mips+bounces-4409-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8C93821A
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jul 2024 18:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E8C81F21606
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jul 2024 16:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412A2133987;
	Sat, 20 Jul 2024 16:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChjvQB4p"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164ED839F4;
	Sat, 20 Jul 2024 16:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721493007; cv=none; b=XZmVwsRLT16dLBz/C2SKUG2Yw1oOAdjV5JCM3W8DPaYzp0fZyRWpxPrHoL4J0zniy7/F614PuMKWmoelqMh8kxuj6tLuTIxu1LF/iUiyk3+ZBMS/+3pTGk+S/QSzP/maZQIGOy4SVjfPbohl7JmXolC/5xIX8EhYt/VU2KgxM34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721493007; c=relaxed/simple;
	bh=KIoBv0mUNTIiDCkYr2P7wrcJt+BJf6AKRSVpD38GZDM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nR5bUe9VU+GzAC3VTmEfYTN1SF6LXdpdrzbsncHZGZNJzKMyVB6GS8vImHR5Fodx+MHLNW5zH3Db8tl18n6fEfpfhboAxsctg/cHJ6dGgqtMjHWWE7YEWgdXtdVta6Gdje8NHLoaZmjJcYcCR9WfOPXa2mrxY0BP/QtUhyHyAes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChjvQB4p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5D13C2BD10;
	Sat, 20 Jul 2024 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721493006;
	bh=KIoBv0mUNTIiDCkYr2P7wrcJt+BJf6AKRSVpD38GZDM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ChjvQB4pFghZ2ioGcsaV0u/FZBorx9LVaYELdn8RUganK317b4gBWueEzoPS482mw
	 u4hXMkx2VvbZod0kZDLANTkd2ToKUtov0FKZJ42i8ozrbeH2ySjm9g7ptn8xjemMQY
	 UFjHQdcRmGtOqwfbq1aelHXW92StJZsebgyR4zqHvqVSSX8cYOkaeHs2qqgjEon77I
	 1pS6eHWZDWmsRLWmsJOKzZEa/PSDPcOOL0edTMMs9Z0DYmmgITlVzBNWqsjaDafdv6
	 Y+FqAMTgxzxUmf9eQRD6QbEwG2L9ZAg5K0Btq4JY9DENuAyawLwKI0DW+RrTkzDfUN
	 vs+8uTb76LSjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF286C43335;
	Sat, 20 Jul 2024 16:30:06 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZpuAyzljTBjd6a7g@alpha.franken.de>
References: <ZpuAyzljTBjd6a7g@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZpuAyzljTBjd6a7g@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.11
X-PR-Tracked-Commit-Id: bb2d63500b5c8fd1ea425caffe2d44c931fefc6b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d2be38b9a5514dbc7dc0c96a2a7f619fcddce00d
Message-Id: <172149300683.5957.11683807145930968401.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jul 2024 16:30:06 +0000
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 20 Jul 2024 11:18:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d2be38b9a5514dbc7dc0c96a2a7f619fcddce00d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

