Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92ECB3C361B
	for <lists+linux-mips@lfdr.de>; Sat, 10 Jul 2021 20:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhGJShk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Jul 2021 14:37:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:53828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229599AbhGJShj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 10 Jul 2021 14:37:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4FAF261249;
        Sat, 10 Jul 2021 18:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625942094;
        bh=seybo4Srl8mhlejim68PrwKNybnRL4PLjAd3mcpnNDQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=eRfjHcDsgLj5vbpqjRubKUBgf8uob4bcz8MuDNzrWOw2iivnZu5uAi/LUv7aoVl0W
         6xEUo7pblrsJPBxlhUCiJkEidTGSrYk9hY6HT3BrtNHxBEbnM0Di/QJs/CkJg6r3J2
         yjGqenIkiGpVZJ4v3w9Okr4rXwjwXu04DguZEX3nTtXMeiz/Z0EiXvYYs3ybopCD8/
         JBcmev/qNOroRRksnX0k8ifIPSdCpJnv1Dlq5mc186+AgGujNfA0T4yG/oBe8qpGl1
         cTCtx/L9STPWNqWEfNA0wJt5cvE1DqToxAr3cP98a9gFG7dW0qOQzP3ILHbrXkYkNu
         F0d1fIXjyUw+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 48BA9609CD;
        Sat, 10 Jul 2021 18:34:54 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210710121523.GA8431@alpha.franken.de>
References: <20210710121523.GA8431@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210710121523.GA8431@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.14_1
X-PR-Tracked-Commit-Id: 47ce8527fbba145a7723685bc9a27d9855e06491
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 379cf80a9861e4356792185bc3fcdd7d4133f2f7
Message-Id: <162594209429.22528.2441674279705679396.pr-tracker-bot@kernel.org>
Date:   Sat, 10 Jul 2021 18:34:54 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Sat, 10 Jul 2021 14:15:23 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.14_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/379cf80a9861e4356792185bc3fcdd7d4133f2f7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
