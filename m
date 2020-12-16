Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F072DC7A3
	for <lists+linux-mips@lfdr.de>; Wed, 16 Dec 2020 21:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbgLPURN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Dec 2020 15:17:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:37056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728740AbgLPURM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Dec 2020 15:17:12 -0500
Subject: Re: [GIT PULL] MIPS changes for v5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608149792;
        bh=1ZIRO/JLFjIU/rGRnebA0VxyVMF2zEJbHUWQdJHlEYw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=PdWjfAugyHiClUVJ0lSEF5zGXxIR72ip3beRak8toqzPlozgQfwct8FOOmJr+KjoP
         y1gPLAEMuvN7tssaRfXVloQRJPir0EYKhPHT+7bQYyBKmMlP9kcWMKcHvjywO10Fqk
         djuvNddw22PgQ0uLDSI3Ka4RWnPXPRE3YTshnK8vx6venTHnDHk34N4NG7hcyGTc/x
         M1Z2s2CqMB1YWWA0CbhrPJ2+hiyUmNqAZcUIM6QZ6+i0H21msEtQ0fyXybue1sW471
         lrUfkpbs7MHSBbUxi6rnKaP4Y7iYd7rIGxthbafuES5qzaDV7kgTl5dWruVQWeZy7z
         0jwrojKSjaVog==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201216110634.GA7546@alpha.franken.de>
References: <20201216110634.GA7546@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201216110634.GA7546@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.11
X-PR-Tracked-Commit-Id: ad4fddef5f2345aa9214e979febe2f47639c10d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8312f41f08edc641aa927d31fb71319694ae9c42
Message-Id: <160814979248.31129.6242302841839462611.pr-tracker-bot@kernel.org>
Date:   Wed, 16 Dec 2020 20:16:32 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Wed, 16 Dec 2020 12:06:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8312f41f08edc641aa927d31fb71319694ae9c42

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
