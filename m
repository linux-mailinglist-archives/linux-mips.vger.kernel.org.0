Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30133227F2
	for <lists+linux-mips@lfdr.de>; Sun, 19 May 2019 19:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfESRpW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 May 2019 13:45:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:42066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725784AbfESRpV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 19 May 2019 13:45:21 -0400
Subject: Re: [GIT PULL] More MIPS changes for 5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558287921;
        bh=YcDxhygZWb4DFgTe8LBDlB4/6CHD3jReOuScnoVIBuQ=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=AWkfAfBY0Q3buXVilbN7TVjTig44xEjKdQ6SWqeB7JikNiOYr6gRmoms3heiMakqS
         CKBZ3wNxIqyb5nUC429Zv6A5dQqrzeOJIswo9xU1xhf1NLWgD2X+zwMYeuzD6oEpel
         UQKE2Pc6ZDAbwWy+m8Nd3F6Q+tJ4WgGP9lssXoiI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190518063149.pvcmpgulqnwwuwuf@pburton-laptop>
References: <20190518063149.pvcmpgulqnwwuwuf@pburton-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190518063149.pvcmpgulqnwwuwuf@pburton-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.2_2
X-PR-Tracked-Commit-Id: b1e479e3dcbc970bfc0b20a56f213e4df08daf75
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bcd1739788e2ea111d0d2efe1ed6633d9f6a20da
Message-Id: <155828792100.9186.5175291338145887273.pr-tracker-bot@kernel.org>
Date:   Sun, 19 May 2019 17:45:21 +0000
To:     Paul Burton <paul.burton@mips.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Sat, 18 May 2019 06:31:51 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.2_2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bcd1739788e2ea111d0d2efe1ed6633d9f6a20da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
