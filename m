Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45903320E1B
	for <lists+linux-mips@lfdr.de>; Sun, 21 Feb 2021 23:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhBUWCc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Feb 2021 17:02:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:48562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230230AbhBUWCa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 21 Feb 2021 17:02:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E032364DDA;
        Sun, 21 Feb 2021 22:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613944909;
        bh=+GOUG7BsMzUCAH9szH+R0TI1KNfTUQNRQjbXIoiWFZ8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=kWbXaW2TWVi5Pwc2hIR5P/DgSGVwLh8BxvfGI1oT8pH1IvhSQjq3MtvV36hBtt5kL
         L5NWeBsHcZPPROL2bXUuypjeuB6UD/+ULyG1gCO7mRNg0cusnrcBRqcmL74uZIlMMP
         og9aq3kqzRM3yZUh7YjKHRpbhGIUqNLdzcKT7hi2b1h56FtMuTkP0Uncik4f0/stpm
         5JnD545tStWPobfu8c3LHkvm1L4asojQk0e6RhE3LJmVgyQbNjmB3cl7o0E8Z6JDoE
         o1IkwoRJgBmSrUl6uv/b8jHzvW8Mmnt9b8e0PHq1/pIgMwp/J9ycHHEst6CGeUxZwd
         8lDVv6yPh3Xcw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DBE0660192;
        Sun, 21 Feb 2021 22:01:49 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v5.12-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210219120638.GA5950@alpha.franken.de>
References: <20210219120638.GA5950@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210219120638.GA5950@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.12
X-PR-Tracked-Commit-Id: b0c2793bad0b5f10be2fc5f56df827e0c1bbf4af
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2671fe5e1d48fe2c14a46bdf8fd9d7b24f88c1e2
Message-Id: <161394490989.8676.5269686649788071131.pr-tracker-bot@kernel.org>
Date:   Sun, 21 Feb 2021 22:01:49 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Fri, 19 Feb 2021 13:06:38 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2671fe5e1d48fe2c14a46bdf8fd9d7b24f88c1e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
