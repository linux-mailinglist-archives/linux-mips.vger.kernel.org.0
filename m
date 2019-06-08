Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4D4D3A1EB
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 22:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfFHUUQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Jun 2019 16:20:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727441AbfFHUUQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 8 Jun 2019 16:20:16 -0400
Subject: Re: [GIT PULL] MIPS fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560025215;
        bh=CYlYu8zuV5dHHzoRYVb0q3U7y6OIESd/zczOaYXc3BM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ZU75KFGRq4bvsBxO++hb+Gy2VJoRQrbhRmA5ZeokCqkMl/CLfhHSfb/GWXTmCvfbo
         9l6fq36dJX+62fvAv3vhlQh12PMXyngb/8mgL7GYSXKYGju6aYinFr0ID5Df21x36D
         B0Uc4R0V0GeYF966ZYhmrlIB58W8C2+UBt/ChUr0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190608064006.zofqsbrtfftsutjr@pburton-laptop>
References: <20190608064006.zofqsbrtfftsutjr@pburton-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190608064006.zofqsbrtfftsutjr@pburton-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
 tags/mips_fixes_5.2_1
X-PR-Tracked-Commit-Id: f532beeeff0c0a3586cc15538bc52d249eb19e7c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0cc617affbf2e31696adf37d153c550c5bef662
Message-Id: <156002520939.8142.8061116378733669881.pr-tracker-bot@kernel.org>
Date:   Sat, 08 Jun 2019 20:20:09 +0000
To:     Paul Burton <paul.burton@mips.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Sat, 8 Jun 2019 06:40:08 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.2_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0cc617affbf2e31696adf37d153c550c5bef662

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
