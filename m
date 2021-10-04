Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7346E421482
	for <lists+linux-mips@lfdr.de>; Mon,  4 Oct 2021 18:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237733AbhJDQ5q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Oct 2021 12:57:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:58316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237425AbhJDQ5p (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Oct 2021 12:57:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4037E613CF;
        Mon,  4 Oct 2021 16:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633366556;
        bh=JA0IZ3Nqw5Ud4s3goK/6YQtBMh/LGX/D9LIms9yZyUM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=PIzAPzmEU61/YjzgVAzwB+cR64lt9OGol0L1sK5GY5RjZjPdOaAJjowDEQQHanijc
         JLSTyMxisFieuSRUzPNv9QFaqIB/t31j/+g5i/zZuY8YX4oC8ZyobfnqjzrlIcEtpR
         dYRYXyfKD0ZYP/0TcUfxeLgEpDhTyZiGITNyG8saRN0dZJxtlQm4p1xZAB/Y5foZXG
         HCS/IegbtFGio8zKxZsG7+0BNvE8Q8jVmscLTJufresiaGLz7vUUpOU1e9tqHrJyAZ
         5DHayzR3ISE4a/9hQtIoMKVaxRt321v+Xoz9UWAkD2ljhsRZ4npwdgIqPq8dhq+kIX
         rTH9VVM0Fv3ig==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 31ACD608AF;
        Mon,  4 Oct 2021 16:55:56 +0000 (UTC)
Subject: Re: [GIT PULL] MIPS fixes for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20211004111401.GA5195@alpha.franken.de>
References: <20211004111401.GA5195@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211004111401.GA5195@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.15_1
X-PR-Tracked-Commit-Id: 740da9d7ca4e25f5d87db9f80d75432681b61305
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: df5c18838ea82bd528a09ce1e7fa158e8eba7293
Message-Id: <163336655614.28831.4314677163825514975.pr-tracker-bot@kernel.org>
Date:   Mon, 04 Oct 2021 16:55:56 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Mon, 4 Oct 2021 13:14:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.15_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/df5c18838ea82bd528a09ce1e7fa158e8eba7293

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
