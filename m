Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420793B9A31
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jul 2021 02:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234517AbhGBAs4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Jul 2021 20:48:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:46338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234469AbhGBAsz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Jul 2021 20:48:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BE6E46140A;
        Fri,  2 Jul 2021 00:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625186784;
        bh=Ryj7UQ2rLJCZfWpB693+LZFzNiUY3p3z75DQoJF+Nnw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=VzSz14b4cL7UfFRVuzc9REFfK1QXCg+kBiEU/JBTLk/0NITBI5wk6D1pMhlKrhCMq
         OluImZWTdTPA/CXhtWjjfCDtawmUH66UVrtR5Z798XGhP56pM6bfkrocBRUJIoeuTr
         HJgssTaLiRRtIfB/2B1EWS/qOqJaU/HHJuFygZ+3FificLC5hJs+sglDqkYasIN4/L
         LFBJdbrDNif9C7+8rUmtxvYs/u2GRhGmufgIw3e6m8vysy4/kr5cE3ukhk5/9vVhLs
         Gf3XoibsPNyzKTX34UswLGTyIEUObOmJdOo/4LS9k72lwD9a9g8/JFvmoKiPGoJISv
         CgD4VVbvaTUvw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AC719609F7;
        Fri,  2 Jul 2021 00:46:24 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210701135641.GA6868@alpha.franken.de>
References: <20210701135641.GA6868@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210701135641.GA6868@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.14
X-PR-Tracked-Commit-Id: cf02ce742f09188272bcc8b0e62d789eb671fc4c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 19b438592238b3b40c3f945bb5f9c4ca971c0c45
Message-Id: <162518678464.2278.11244388223811340173.pr-tracker-bot@kernel.org>
Date:   Fri, 02 Jul 2021 00:46:24 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Thu, 1 Jul 2021 15:56:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/19b438592238b3b40c3f945bb5f9c4ca971c0c45

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
