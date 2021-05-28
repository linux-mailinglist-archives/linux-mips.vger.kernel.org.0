Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E0D394758
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 20:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbhE1TBd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 May 2021 15:01:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:60778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhE1TBd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 May 2021 15:01:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 73F22610FC;
        Fri, 28 May 2021 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622228398;
        bh=D/pMW6yRyMaEH01xMX+Mf1pNPqlqMelqWewcJxsl3Lg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=uZw3n7egM6uqZJkeE75+Bmr+FoTh7x+gL0fkN7zmTKSE5ID4XLkog/ownTV7Phsw+
         hJxLn8bwJoev233oG+L53L/vdMpGIDBMQzBqLPxB6obOWbwRUG5Z/IZXO0j5ru18aW
         4TH2iKxU8Gxf1Wf0tsULkiQFw22upx6jJnqVCO8E6KEBmbxfdq0r/LCTFyn3hQuCw+
         tb8CZSwWSefQ97n2zc1K3b5J0bO9sNwEWR6jvz+cDUtmWPR26xLqoF4znQrXcol5b0
         acDYvNZ8LyR2pmaqbrtf7JGGUaamVQP51jNUzNdL+NrePUm8K/TCTxOyUBsT2bOkH8
         IkckT2c0lHtag==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 61566608FB;
        Fri, 28 May 2021 18:59:58 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v5.13
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210528115409.GA8447@alpha.franken.de>
References: <20210528115409.GA8447@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210528115409.GA8447@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.13_1
X-PR-Tracked-Commit-Id: 78cf0eb926cb1abeff2106bae67752e032fe5f3e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: afdd14704d7eb4d7634cb7ba8d117066fed44282
Message-Id: <162222839833.1554.3589397732368870350.pr-tracker-bot@kernel.org>
Date:   Fri, 28 May 2021 18:59:58 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Fri, 28 May 2021 13:54:09 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.13_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/afdd14704d7eb4d7634cb7ba8d117066fed44282

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
