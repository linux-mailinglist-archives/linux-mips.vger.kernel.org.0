Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3D64466B4
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 17:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbhKEQKy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 12:10:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:49128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230345AbhKEQKx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Nov 2021 12:10:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0805D610FD;
        Fri,  5 Nov 2021 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636128494;
        bh=KxIIcHuAU7Of2ST6JwMJL17z9q1hT2XnikyF8Ob31eA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=FuW+rKzjjvW1Zs0etXXsjfZnWehetkK1V2OPGN2paE/ZDoELGhC1cXmybh/7E20ST
         +6rpAnm49sA5daQt1v4qyNTrBOQ3pXMdISWGjcg1onA167uJT0aBHh8MVqYj18b9fB
         kZ4VRQE78VzHqrBPJHAb+qWE053RG+EJsS8pWEv6g5hgRNuvFxxhUWbXx06YDV99rS
         Z4ih7GQgeOJpDQoxtiNimqJ8MqbmrWM4yNKIiHdgy5h9sd4ULHzdkKNWIdwuTlJZuk
         o2qcCx7f7y3z8y6Z1XUvv4mszcz+HWshQS5lAK8xIkOYBAgj/djArBOFoAdk2RxViv
         kkm3Tjs6lWflw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 02891609D9;
        Fri,  5 Nov 2021 16:08:14 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS changes for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211105082252.GA6698@alpha.franken.de>
References: <20211105082252.GA6698@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211105082252.GA6698@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.16
X-PR-Tracked-Commit-Id: 36de23a4c5f0b61ceb4812b535422fa6c6e97447
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a3f36773802d44d1e50e7c4c09b3e17018581d11
Message-Id: <163612849400.17201.2039423310467653853.pr-tracker-bot@kernel.org>
Date:   Fri, 05 Nov 2021 16:08:14 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Fri, 5 Nov 2021 09:22:52 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a3f36773802d44d1e50e7c4c09b3e17018581d11

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
