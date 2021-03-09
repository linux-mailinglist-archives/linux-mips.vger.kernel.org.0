Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01063332FB3
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 21:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbhCIUPl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 15:15:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:55088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231467AbhCIUPM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Mar 2021 15:15:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7906965224;
        Tue,  9 Mar 2021 20:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615320912;
        bh=gpazf+/OMBHOGBv2YwI2xbzeqtEF2+G3yv5XbRfdzj8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=iZZr4n27sr1S8GcaNCijYgJWXKfUe1RtUWG9iIla/HwGL7yiwR0wRRefjsMUzhW+w
         feA10y7vsFFwUB+WQ2e4UXPhWnvQe8WhTrYrxdoimIO9nlllyvERZdhR1PpMJQjcLU
         r446CAKcaChYUjLCyxE5dqMYQaRwlXHyB6BsrSlOQ8JoWrDyblO+v1QXq7mr/orzFs
         MYDGRtmPLWbXNP7rHiGsSCSd75cPp+f/2glbH/87LVq0U58WhNTwMcVTwLaFnxPPKl
         MAnYTGM1g/gipA3q3+zrhCG0qSnn8oVE+VaAWP2p8hZ43k/NuhzGDlnKLL1npR3g7I
         7jiYf+ShRJ/Vw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 742A0609EA;
        Tue,  9 Mar 2021 20:15:12 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210309151722.GB12267@alpha.franken.de>
References: <20210309151722.GB12267@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210309151722.GB12267@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.12_1
X-PR-Tracked-Commit-Id: bd67b711bfaa02cf19e88aa2d9edae5c1c1d2739
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9c39198a65f182962e357fa1cd7a9bba50401f2f
Message-Id: <161532091246.26915.2652841068002571837.pr-tracker-bot@kernel.org>
Date:   Tue, 09 Mar 2021 20:15:12 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Tue, 9 Mar 2021 16:17:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.12_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9c39198a65f182962e357fa1cd7a9bba50401f2f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
