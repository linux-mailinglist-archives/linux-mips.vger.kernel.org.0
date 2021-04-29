Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7534E36EFB4
	for <lists+linux-mips@lfdr.de>; Thu, 29 Apr 2021 20:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241215AbhD2SvB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Apr 2021 14:51:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:43900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233830AbhD2SvA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Apr 2021 14:51:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B2C66613B3;
        Thu, 29 Apr 2021 18:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619722213;
        bh=MSh49Paf8XJ524o2ySnDTt8emB5sQk82FrFq0covkZI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=dgj+1qsxVHHufD4Wp1c+GQ3wi8yAB0xfkK2dHmwU8e1qdnfDVmA+4sfG5eNfaaSa0
         JpJUgNIvFUuGYlirjC94BSh6wSEWbGxk+Dt8mtzx8g05Ezawqi1S9myOPQqMIKWfNL
         w4EfHsMxcCHd/xU1/aXv0WplVpIxov8X1lY7jqJqzqx9t/+lcEcBKICrliDl/3Cejf
         nERQgldBivJje6fBpT3+TLAb8VqIaTU5ND/XoNtvykRjAveb1dG+oqskmwEpUjqpS8
         jQIaNyfgzcWhcO/yJcUjkBA+3a3ztnmj8NtnfqFRtfHVA6+5kN+wou+0h93/VlGt4E
         CZDf3494DdBSg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 99E0060A1B;
        Thu, 29 Apr 2021 18:50:13 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v5.13
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210428121638.GA8188@alpha.franken.de>
References: <20210428121638.GA8188@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210428121638.GA8188@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.13
X-PR-Tracked-Commit-Id: 7e9be673cb1b0be0f4279a960c2ecb28a147c327
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 77d51337d650086643e1e96b8a7e1e6cbf0b09ff
Message-Id: <161972221356.6619.7005197443806195454.pr-tracker-bot@kernel.org>
Date:   Thu, 29 Apr 2021 18:50:13 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Wed, 28 Apr 2021 14:16:38 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/77d51337d650086643e1e96b8a7e1e6cbf0b09ff

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
