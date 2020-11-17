Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763882B6EC1
	for <lists+linux-mips@lfdr.de>; Tue, 17 Nov 2020 20:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729842AbgKQTe3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Nov 2020 14:34:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:43492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgKQTe2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Nov 2020 14:34:28 -0500
Subject: Re: [GIT PULL] MIPS fixes for v5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605641668;
        bh=tKEDe5MxwNibbClhcIegT3aKwMfUHeGrIF8LeV0sSDA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=HgSXRAqHgfDtwLRDIxFxJOn0pzyeN7p30bnF8cv3eMYXty5pmulDuiAkbfzzz4MSG
         qa8shQ4dVQAj+oC5Y/jX9Yjcao36tWzMIMvO8IxDQXkSv45fZpIWzmaQbcvu6EXJrw
         eeXoTBP/Xb6GnAl6rZf2S8Csz6G7gx6z57b+Up/8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201117180154.GA21834@alpha.franken.de>
References: <20201117180154.GA21834@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201117180154.GA21834@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.10_1
X-PR-Tracked-Commit-Id: ac3b57adf87ad9bac7e33ca26bbbb13fae1ed62b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed129cd75ac1073f32d04d0f2012ede40e86fb77
Message-Id: <160564166838.32053.16963618402890344314.pr-tracker-bot@kernel.org>
Date:   Tue, 17 Nov 2020 19:34:28 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Tue, 17 Nov 2020 19:01:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.10_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed129cd75ac1073f32d04d0f2012ede40e86fb77

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
