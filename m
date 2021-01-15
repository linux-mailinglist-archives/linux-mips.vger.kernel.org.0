Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E5F2F87BE
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 22:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbhAOVhn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 16:37:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:35862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbhAOVhn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 16:37:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A3C96239EE;
        Fri, 15 Jan 2021 21:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610746622;
        bh=8eOTMCY0SGZDDQQunGEuviMOztiAikbe5huqCqdJlVk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=QRuyCnUQqUjkf3BTfFGuIjhYd0gUe7xZkKb43DidMJ8gnpQIAb7ZOkWWZINO68tma
         NsQBOdvettl3KG2ucHPYk33F9RDX4H/whdmWqgyTqGp5s27eOt7DqH07baO5Ma2ET6
         xB81YrcEx2VByfePNFBXL4VED2ulAMSScvQwx8iEpREEaOJiOmZdLb0lXSwGIZ5zh0
         cf+4lkS1uKfD8zjn9YXrxRZ9EZ5vsQFOaSVKxTzauRE1d6/gU8vSmm0TIlzp30760A
         fcbIj/SuUZdrfvYHnXNEyzpN5+uxoP9XTrMz4RmK9f/c3RckxlxDNXjgR3pNv272nA
         z5ocImMjUgzTg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 8E1176017C;
        Fri, 15 Jan 2021 21:37:02 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v5.11
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210115141903.GA13991@alpha.franken.de>
References: <20210115141903.GA13991@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210115141903.GA13991@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.11.1
X-PR-Tracked-Commit-Id: 7b490a8ab0f2d3ab8d838a4ff22ae86edafd34a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f288c895622f881324cf71ef9eec3af60ac8a197
Message-Id: <161074662251.20929.14706589096265458479.pr-tracker-bot@kernel.org>
Date:   Fri, 15 Jan 2021 21:37:02 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Fri, 15 Jan 2021 15:19:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.11.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f288c895622f881324cf71ef9eec3af60ac8a197

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
