Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B9E33FABB
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 23:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhCQWBl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 18:01:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:47856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229608AbhCQWBK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Mar 2021 18:01:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F175F64E64;
        Wed, 17 Mar 2021 22:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616018470;
        bh=Afs1IGV3pzy9/PyNrTKdFoc2ZctEoYoXHYBfBgaKHAs=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=uNeCgCBM+iBu1gnx0zodW4+a/570btq5OPItMHkx1ZWzzS4Sc/pcAzQ/mVt8Jndpr
         0YvedBj+HnTSfLIDea7Em9BBXPIeCtpuE0jOK5ht+6AkHHLdz6v9348SNod6OydoEd
         0c3XXEVI9GNJxlbKFyUik/u5I8xnaM4Y6zDlmhz2+PWazjBTtK1IFauhAAqUq6iXep
         PcrnElZfqwq+6a29ZulpJp5AKxNIIj5NDxVsoPlMzXnckwQ8qnn8RFFSnDNU6eYkQI
         cXviVyWBuYZYJMrBZYdQ90ualJ6FjNi2/Lm/zL/siqHldbRTxsRc2iU2XMAJdYwPHA
         EF+5li/s7hzxg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D5E5760997;
        Wed, 17 Mar 2021 22:01:09 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210317123434.GA14230@alpha.franken.de>
References: <20210317123434.GA14230@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210317123434.GA14230@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.12_2
X-PR-Tracked-Commit-Id: 3f6c515d723480bc8afd456b0a52438fe79128a8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e69beeabac6dae8d4318f46c7aa0c70b9599afb1
Message-Id: <161601846980.14556.7335252246546800844.pr-tracker-bot@kernel.org>
Date:   Wed, 17 Mar 2021 22:01:09 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Wed, 17 Mar 2021 13:34:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.12_2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e69beeabac6dae8d4318f46c7aa0c70b9599afb1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
