Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4875E3B9A32
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jul 2021 02:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234543AbhGBAs4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Jul 2021 20:48:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:46348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234510AbhGBAs4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Jul 2021 20:48:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F1C836140E;
        Fri,  2 Jul 2021 00:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625186785;
        bh=voKr1DSTLMJskXATNUfJ0oSpsSoDaC7HiFwL5Sz8S2M=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=rTddCbWKi6kFBivaYgKvwPRPwXH9m983RW8fizGl879IZNuabltelDIPcGc7UHmMn
         uRfyGbYCOeFjdlYzAvnWXJYkQhvwR5Tp6r0ex7VbIKmWWDxz4TTyMjdqkPF8yTRNyQ
         vGiBQdDr6CMO2k1UakdRMXOh8IvRgMbNZT7cGw5RB3bYfttMMInBlt71JZ2pTDFwuh
         KxtrhxsJFwfuoSo7r6PFoP8nEsBvX/RNIyq0u1e8bWOnkote9Bkh+Ojhp/kv43HIQc
         qBejnCFu2/RgMjysVXtnT/vdFarssUedaeizqI18KMbXOew+B53Q+69P+Z2o7gf7y+
         LmcVGrGOVekPA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EBAF6609F7;
        Fri,  2 Jul 2021 00:46:24 +0000 (UTC)
Subject: Re: [GIT PULL] bulk pin control changes for v5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CACRpkdadLCD=LEkq7jj6gu_XyDH5qvfoq3ABAyLU0hk+qPzsAQ@mail.gmail.com>
References: <CACRpkdadLCD=LEkq7jj6gu_XyDH5qvfoq3ABAyLU0hk+qPzsAQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-mips.vger.kernel.org>
X-PR-Tracked-Message-Id: <CACRpkdadLCD=LEkq7jj6gu_XyDH5qvfoq3ABAyLU0hk+qPzsAQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.14-1
X-PR-Tracked-Commit-Id: bfa50166cd9d5d190b20dc33d1ec7ae19ced7022
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a32b344e6f4375c5bdc3e89d0997b7eae187a3b1
Message-Id: <162518678495.2278.10928620210611047907.pr-tracker-bot@kernel.org>
Date:   Fri, 02 Jul 2021 00:46:24 +0000
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Fri, 2 Jul 2021 01:33:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git tags/pinctrl-v5.14-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a32b344e6f4375c5bdc3e89d0997b7eae187a3b1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
