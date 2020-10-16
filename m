Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C715D290C76
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 21:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411179AbgJPTyn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 15:54:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:55286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408005AbgJPTyj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Oct 2020 15:54:39 -0400
Subject: Re: [GIT PULL] MIPS changes for v5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602878078;
        bh=+Pi10SjZPj2ua7V7KAXlqJbyLbdQsr5bcoIOacNCKRk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=yzbHv4IVbtkGmcI9cm1b3z5A2+GVFnLccLDqncjQiTRoCp5KOidZD1SuIRMrDGhgh
         8MJZ4K9D+GWETmGCbqjKUClkB5rjNfUPcOfULHVLvh47BTqZOVqyQV+bbOGYW+ydZA
         MUt1kFzD1pvoebNm7bRXKUuQAEgNIzvMxZwU+9aI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201016124617.GA5035@alpha.franken.de>
References: <20201016124617.GA5035@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201016124617.GA5035@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.10
X-PR-Tracked-Commit-Id: cf3af0a4d3b62ab48e0b90180ea161d0f5d4953f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 09a31a7e3723afd79022d5d3ff3634c2630c2eeb
Message-Id: <160287807868.14002.15462163506745181965.pr-tracker-bot@kernel.org>
Date:   Fri, 16 Oct 2020 19:54:38 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Fri, 16 Oct 2020 14:46:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/09a31a7e3723afd79022d5d3ff3634c2630c2eeb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
