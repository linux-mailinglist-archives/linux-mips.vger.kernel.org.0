Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 284E8E6008
	for <lists+linux-mips@lfdr.de>; Sun, 27 Oct 2019 01:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfJZXuF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Oct 2019 19:50:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:52692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbfJZXuF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 26 Oct 2019 19:50:05 -0400
Subject: Re: [GIT PULL] MIPS fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572133804;
        bh=4B/O9FNytI6IL2C2RrGBwNj6pViV+mSGHRJUFKY/A/I=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Ah6s0j/OS+LbDxtzZFIDqpuJeWDHM3zWJM71pCpcrN1kSByxFJSul1WFpWW84BfMu
         EbWtaJ6iQftl2m70Efa6VAZsUJWIhM7kO3JnUWxTPdXyD0V8V10m0mrAnxWNYjLIUj
         4dlgmp19VDzx2T1Lhvmv5h0wYVaBAr3sxTf2aeCg=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191026221403.mfcxqs6yxgkl5ufx@pburton-laptop>
References: <20191026221403.mfcxqs6yxgkl5ufx@pburton-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191026221403.mfcxqs6yxgkl5ufx@pburton-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
 tags/mips_fixes_5.4_3
X-PR-Tracked-Commit-Id: b42aa3fd5957e4daf4b69129e5ce752a2a53e7d6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5a1e843c66fa6438f389045981c37e4073917641
Message-Id: <157213380472.29310.12529332971634754431.pr-tracker-bot@kernel.org>
Date:   Sat, 26 Oct 2019 23:50:04 +0000
To:     Paul Burton <paulburton@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Sat, 26 Oct 2019 15:14:03 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.4_3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5a1e843c66fa6438f389045981c37e4073917641

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
