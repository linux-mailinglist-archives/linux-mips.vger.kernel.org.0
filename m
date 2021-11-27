Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0D2460109
	for <lists+linux-mips@lfdr.de>; Sat, 27 Nov 2021 20:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356120AbhK0TDf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Nov 2021 14:03:35 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:35816 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351614AbhK0TBe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Nov 2021 14:01:34 -0500
Received: from mail.kernel.org (unknown [198.145.29.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 539AD60F0D;
        Sat, 27 Nov 2021 18:58:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CEE4260041;
        Sat, 27 Nov 2021 18:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638039498;
        bh=L83gqZQZFYTR1oXyDsn+vA4NX49tplA0Uv8/YfSJCXU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=EsST3EJFWW3HupPZWoeKj3xMBITciDb0EM8D7isvEJw7fgYN0v5+6zIWaPSqcOCIW
         hqrSUlSfe3EvHwK4Z8Q3W8YFpJ9kWTaFVG7oq5zuHxEDZvLQXfynUXGN9lM/PDo4MX
         sesAOgqphOEMQ9EJL5pJLeILvluCY7949DFLPDJ3YC8DAAVUx5L9Sbx+vu97MAiZVb
         m0Voe9CkI+kKJ2OguLDmgjrQLsPEdFZTbQPiUVysmDPg9bsrGj3iY1ZjhQcDnqup0/
         FEhx3qcVygtQUZ7wD5vnWRiNHmvWa0AbtPgVJ2V1UBlwso0HdvatWEqzC81oz00Cr9
         wrFL0cPW2D+/w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C8DB360074;
        Sat, 27 Nov 2021 18:58:18 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211127094317.GA6302@alpha.franken.de>
References: <20211127094317.GA6302@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211127094317.GA6302@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.16_2
X-PR-Tracked-Commit-Id: 41ce097f714401e6ad8f3f5eb30d7f91b0b5e495
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6be088036c0b95044e42a8cef977b90824732eb7
Message-Id: <163803949881.17852.7067581330993729228.pr-tracker-bot@kernel.org>
Date:   Sat, 27 Nov 2021 18:58:18 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Sat, 27 Nov 2021 10:43:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.16_2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6be088036c0b95044e42a8cef977b90824732eb7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
