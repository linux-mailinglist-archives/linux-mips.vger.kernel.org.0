Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29E440053B
	for <lists+linux-mips@lfdr.de>; Fri,  3 Sep 2021 20:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350480AbhICSqr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Sep 2021 14:46:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:39146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350457AbhICSqq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 3 Sep 2021 14:46:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6EAB061051;
        Fri,  3 Sep 2021 18:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630694746;
        bh=9bCy+rtaHZTEVF7tpXMEOvIB9yB61eOMifSWb+o3gQM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=qoj49GFz1EGWch7KvwJD7h3PBnIgCWp5DVONOHlfro+qxOssw3t2klcS4vay5m4Vc
         vHQ8ozcU1m/FfMr7/HvxM1Jf7nnxoEz5eKEGY4FBrapZtWl6D63fdMeK6Z2Tg+hc8N
         mz8B9fKR5UR/h3ODi+6hq44PjDLHteGHJPilIs+GSN65gTocdJFWDt9ZLgQS1Se/8n
         VvdK9QeDhTsfTaTnNuI+IPCB4B7hLdNSMptcBS3CV662QFhvICKmL7b8sGMyZSJRRe
         P8VZo0iXhWtN+dtxqipy0pFAMtivTf6jkmIfwOS9ZyVGZJof5cHK0DVhewz4iqG1Hx
         Ub1pSpusocIKA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6986F609D9;
        Fri,  3 Sep 2021 18:45:46 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v5.15-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210903102019.GA6597@alpha.franken.de>
References: <20210903102019.GA6597@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210903102019.GA6597@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.15
X-PR-Tracked-Commit-Id: bea6a94a279bcbe6b2cde348782b28baf12255a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d6742212c0c6ccee2351499db80acba71fa36052
Message-Id: <163069474642.21432.2129462464818464398.pr-tracker-bot@kernel.org>
Date:   Fri, 03 Sep 2021 18:45:46 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Fri, 3 Sep 2021 12:20:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d6742212c0c6ccee2351499db80acba71fa36052

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
