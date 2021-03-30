Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B8734ED0A
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 18:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbhC3QBs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 12:01:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:48446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231650AbhC3QBs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 12:01:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DAE26619C0;
        Tue, 30 Mar 2021 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617120107;
        bh=8kPDR4b8RZHbcoGZKI07/x9FGLIlZk0Lu23IdWfuvtg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=r/zesjqqzRGV92Mav6HAVzXKDFOzWRxyu92IFUjEmJrfjp0kHvKXUKgvW01aLbiQ6
         mus9oqzoGjByWHE7jU9DbzOtUgOMe1ARLqQls+9RY54sJNg+nQhjSCJByNXx3/uoM1
         sKtxdCh8U6OweiPlTQU9gf9yEwWzcorTsLlZMSDtYTusuGHpp/EoZcU3Bym5/rourk
         8+15HFQlcIrp9RtEYrpSLK7HPwndv+76XfKx7tUye0Vsn2i/+PmkMf9KtGF7jNIc4s
         4RZ2Wo+csI1p2MjiKGVrWUOC+fkdFUXNv7ruJ5UcieBGTwT+xFqEWRb9hZOmapCZHJ
         sBL9qojODfCTQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D641260A3B;
        Tue, 30 Mar 2021 16:01:47 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210330130219.GA10841@alpha.franken.de>
References: <20210330130219.GA10841@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210330130219.GA10841@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.12_3
X-PR-Tracked-Commit-Id: 9ae31e2ab293bf4d9c42e7079b156072f8a7f8ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2bb25b3a748af6f11df42298e80b9863ed23f2b3
Message-Id: <161712010787.23792.7013252516451033141.pr-tracker-bot@kernel.org>
Date:   Tue, 30 Mar 2021 16:01:47 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Tue, 30 Mar 2021 15:02:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.12_3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2bb25b3a748af6f11df42298e80b9863ed23f2b3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
