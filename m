Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA3F26E4E2
	for <lists+linux-mips@lfdr.de>; Thu, 17 Sep 2020 21:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgIQTB3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Sep 2020 15:01:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:60884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgIQTBQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Sep 2020 15:01:16 -0400
Subject: Re: [GIT PULL] MIPS fixes for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600369274;
        bh=xLQsV/kyLLPrxxe8WerUF7nbBOh3OY2jmvHNMDZ6Ufc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=xIk77pbF0x+ouXOVsNiweVs0AEEBkceZlowyjQKHvyxnc5YuAFIV/5X6C35MZQV8o
         XDmLekiLMuWOmxPxKONJvTImyot9tJx/dXbKlLDDO4CLrlqjQIhIBRszDPeGHs3SGL
         4ofJN4NnGDIF8Doj2C1dphNyG2+ukDZuRKTDWzus=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200917144736.GA14255@alpha.franken.de>
References: <20200917144736.GA14255@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200917144736.GA14255@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.9_2
X-PR-Tracked-Commit-Id: b959b97860d0fee8c8f6a3e641d3c2ad76eab6be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4cbffc461ec91287c4cb1d0e27b01b988d0b8fba
Message-Id: <160036927396.32754.12464056875205937503.pr-tracker-bot@kernel.org>
Date:   Thu, 17 Sep 2020 19:01:13 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Thu, 17 Sep 2020 16:47:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.9_2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4cbffc461ec91287c4cb1d0e27b01b988d0b8fba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
