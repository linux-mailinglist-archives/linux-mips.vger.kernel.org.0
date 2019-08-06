Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81BE383AE9
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2019 23:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbfHFVPM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Aug 2019 17:15:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:48106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbfHFVPL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Aug 2019 17:15:11 -0400
Subject: Re: [GIT PULL] MIPS fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565126110;
        bh=XQ/t2SiIzqQevAjIV1jZt+CRddJP9K0PErPscXN7u3M=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=wK0N1fr9SySm8lQhPoXLQk1GkbRYtqjatCorHOMHQndphrz5jlwWqDbFB+BWTHCzD
         NLcNyhMx9gyZ9KjR1e3bBEaTUci8ZXWtzrGNWdb/OvFE7jk3ueanNcrqPokothRGat
         I+NRa1PW+W2RaLnFtecpyQ5GLP7mxsmX1SIVM728=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190806192315.y2faix6zk5igs2ry@pburton-laptop>
References: <20190806192315.y2faix6zk5igs2ry@pburton-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190806192315.y2faix6zk5igs2ry@pburton-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
 tags/mips_fixes_5.3_1
X-PR-Tracked-Commit-Id: 74034a09267c1f48d5ce7ae4c4a317fac7d43418
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 76d7961ff4ee02cc70365600a52fb59ca544dc7c
Message-Id: <156512611045.6604.9076200938283634387.pr-tracker-bot@kernel.org>
Date:   Tue, 06 Aug 2019 21:15:10 +0000
To:     Paul Burton <paul.burton@mips.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Tue, 6 Aug 2019 19:23:16 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.3_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/76d7961ff4ee02cc70365600a52fb59ca544dc7c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
