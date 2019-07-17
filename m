Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC2646BFE2
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2019 18:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729790AbfGQQuU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jul 2019 12:50:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:60358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729765AbfGQQuT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Jul 2019 12:50:19 -0400
Subject: Re: [GIT PULL] MIPS changes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563382219;
        bh=BNU7nBW9Ix6ttu9a1iqtFkvarTUm3bOUxNU1/pfnUkQ=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=s5yp5s5tXLrZOvK21lppHFc0T8IsoPCDvoSkZcY4VZfMlgcJFwr74g5pCOgVc6f/C
         gsTFe6txNKnLUfY9+DWqrnQNPw5kzD+azxYK6RP0TPGCkZwe0oPhA2I50AhuYcybGM
         xvP67Ow65b+3sGX6Nb+rs2BTC+NRIyvSmsoGPRs4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190717152545.bhdnhjdf2tlhuv3o@pburton-laptop>
References: <20190717152545.bhdnhjdf2tlhuv3o@pburton-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190717152545.bhdnhjdf2tlhuv3o@pburton-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.3
X-PR-Tracked-Commit-Id: e5793cd1b5fedb39337cfa62251a25030f526e56
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa121bb3fed6313b1f0af23952301e06cf6d32ed
Message-Id: <156338221916.6265.9350078517015520928.pr-tracker-bot@kernel.org>
Date:   Wed, 17 Jul 2019 16:50:19 +0000
To:     Paul Burton <paul.burton@mips.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Wed, 17 Jul 2019 15:25:47 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa121bb3fed6313b1f0af23952301e06cf6d32ed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
