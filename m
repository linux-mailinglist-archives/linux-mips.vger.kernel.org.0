Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7EF3E2F77
	for <lists+linux-mips@lfdr.de>; Fri,  6 Aug 2021 20:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243433AbhHFSsY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Aug 2021 14:48:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:44628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231889AbhHFSsY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Aug 2021 14:48:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4558060234;
        Fri,  6 Aug 2021 18:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628275688;
        bh=CE8JX04R7HeqOCD4uHIl0/q+y1l15x8vqCDJJFNopNw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=aPGQWgK3XJKhBMTUvB+KVtrRPBHS2pxvK54xPfSsbHfDpQZ/KHFMhvNKI+mrdy2ck
         MB/XoslTMV/UfRlfKrKfSrSBjaY9SDD/0bw8JtoR+195fVZzDDk4a2HXxSddmKDqdr
         +VGCIKADKWlPXeBLf3PyIMiT3OCJiggMrwF0ygavY6WECtGB3tzi9xGOewo8/1Gd4D
         zEPfll+l6wfohF+hzrNk4T56oGNEUZMb/cSM2myhfJX4/mgZtK1SQWak/G7ohZGIz9
         E2s3pgPjUpiWHFOquTnnoB0Xplp+Q8buz6SlLt6csIsa+mYSI/yeGijyeIcM6aYe1r
         WO1oz6Kq29ziA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 32B98609F1;
        Fri,  6 Aug 2021 18:48:08 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210806133655.GA10751@alpha.franken.de>
References: <20210806133655.GA10751@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210806133655.GA10751@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.14_1
X-PR-Tracked-Commit-Id: 6aa32467299e9e12280a6aec9dbc21bf2db830b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb407fc81d68f3a61e82eda4e7f9421e67f8aece
Message-Id: <162827568814.18689.8373488018668167610.pr-tracker-bot@kernel.org>
Date:   Fri, 06 Aug 2021 18:48:08 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Fri, 6 Aug 2021 15:36:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.14_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb407fc81d68f3a61e82eda4e7f9421e67f8aece

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
