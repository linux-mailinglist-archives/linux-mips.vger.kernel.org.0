Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A5744F4CA
	for <lists+linux-mips@lfdr.de>; Sat, 13 Nov 2021 20:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236093AbhKMTSR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Nov 2021 14:18:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:54304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236116AbhKMTSQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 13 Nov 2021 14:18:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id EF4FA61207;
        Sat, 13 Nov 2021 19:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636830924;
        bh=HbIGjanIo6WOBMZpTzWFyuh961Oo9a+51Nb/ULQtlT4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=QGqrzj2gqlf3duZcagh+tI+XpXRotn9td0FmodHz0kv4nQyc5d3qc8Xnk9P/TYOGz
         oIkfKtGCr4y7T8sbcijhfOT7mBowjNMZUqDxXkhLyBsWya08w8awUO+zFeiYCWpYub
         7g6qqt+1q7QOcE2oN38TQ5qDGz0OZB21OCSgTJZ0mA5bfjFYIHf/MOuXzhsQX3Z7sD
         J+LyH3dSJ7m7EsrcKw1cuCr0zLjS8nek0yxcAlvZ4ny24SmeSpPmpYE8eyltBulxWl
         z4vKXt/XgS78QPg+3V1FSHZTRIDUbnLcYeA99rTLHF23RREZ3WjqHB0ZFFp8dM/XYo
         i6y5xSDIcDoPA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E99F960987;
        Sat, 13 Nov 2021 19:15:23 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes 2nd part for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211112104447.GA6127@alpha.franken.de>
References: <20211112104447.GA6127@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211112104447.GA6127@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.16_1
X-PR-Tracked-Commit-Id: f78b25ee922ef6faf59a258af1b9388ca894cfd9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4218a96faf917b13ddc6af505bfb9b6a4e60bbc4
Message-Id: <163683092394.10343.15762345267517404168.pr-tracker-bot@kernel.org>
Date:   Sat, 13 Nov 2021 19:15:23 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Fri, 12 Nov 2021 11:44:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.16_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4218a96faf917b13ddc6af505bfb9b6a4e60bbc4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
