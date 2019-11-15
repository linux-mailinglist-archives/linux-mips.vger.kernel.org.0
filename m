Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9991CFE41D
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2019 18:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727728AbfKORfI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Nov 2019 12:35:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:45782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727626AbfKORfH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Nov 2019 12:35:07 -0500
Subject: Re: [GIT PULL] MIPS fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573839306;
        bh=yb+p8AukHHEeYK0fFoJRlqO+FcytnsIIcby/a1z4TKY=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=I1s+MoyZcQhJzbBiaUsmQfsUqArF2z9+WNP7lWf0CxHDQPfe3pCk4WffsrBbirKx3
         HUKCTcukOemId2mAYvglqhDLkKtxtfafaI+iW7KjX2dkHjYGvPtR3cvZJOEeNdk3yo
         wXQ4nVtlUDcnRhFOffjgJCd0fGQehu/plLg49Nv4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191115050453.zcgijwj7qt7uvx2c@pburton-laptop>
References: <20191115050453.zcgijwj7qt7uvx2c@pburton-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191115050453.zcgijwj7qt7uvx2c@pburton-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
 tags/mips_fixes_5.4_4
X-PR-Tracked-Commit-Id: f6929c92e283a35b183c293574adcbca409bf144
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 34b38f5abd1f0793e75cc97c4781d04b6c7f4d9e
Message-Id: <157383930688.31249.15811969390125666464.pr-tracker-bot@kernel.org>
Date:   Fri, 15 Nov 2019 17:35:06 +0000
To:     Paul Burton <paulburton@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Thu, 14 Nov 2019 21:04:53 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.4_4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/34b38f5abd1f0793e75cc97c4781d04b6c7f4d9e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
