Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC171455158
	for <lists+linux-mips@lfdr.de>; Thu, 18 Nov 2021 00:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241721AbhKRABS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Nov 2021 19:01:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:59226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241731AbhKRABH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Nov 2021 19:01:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6429961ABF;
        Wed, 17 Nov 2021 23:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637193488;
        bh=lmfdFZ9wsWSSzqTt51z/Mge8gvN0Q0StiIMq2hqs1uo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=PJxgqrTJRKDRuuI1icgLpIb3hd3kFtsDxd5gzMRl/wt9p/RPLYYIk6R+k0LrZSkHb
         GTLXOl8pDzQMBXceIcaYlrb53SaNeKAQUW9U2n8dF41tiwRfe2ZGcXQUVk/g1/OtWo
         sZcw6bACognY2kB+iTAFNy8QzUScOiOAeCmeIggLNxBIxmiiLOo7EaM2+oot381uXu
         fNA76NnRvyoxlMiBb/sjvetr0Oh5h5ECVY4Moku3X5py75b17KB1Eulrq1w9G8CnVX
         dwyU5XgXhga5zFxY1CW1jvMU04xZuPqf+1uh7VwsQQhyU1jScVymeMaPIDLbsdGKo4
         cYylMthK60Uqw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5402A600E6;
        Wed, 17 Nov 2021 23:58:08 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211117221136.GA16740@alpha.franken.de>
References: <20211117221136.GA16740@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211117221136.GA16740@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.16_1
X-PR-Tracked-Commit-Id: fc1aabb088860d6cf9dd03612b7a6f0de91ccac2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3fa595481b3b33105d7e0480710591edb2bd8dcb
Message-Id: <163719348828.8069.16173664396744279220.pr-tracker-bot@kernel.org>
Date:   Wed, 17 Nov 2021 23:58:08 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Wed, 17 Nov 2021 23:11:36 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.16_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3fa595481b3b33105d7e0480710591edb2bd8dcb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
