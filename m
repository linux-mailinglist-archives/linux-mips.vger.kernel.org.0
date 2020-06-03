Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E3A1ED7C5
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2020 23:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgFCVFL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Jun 2020 17:05:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:33644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbgFCVFJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Jun 2020 17:05:09 -0400
Subject: Re: [GIT PULL] MIPS changes for v5.8-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591218308;
        bh=TTMEjxQVEJ1nVyi7S84VHvsSlUdNNhPD3/vt0AsWsZw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=oZ6Zy63+ndmFKCHGwIResvWAKZqh7KC4+a5GsSEZ8KD/5ARuqDu0xsV9ByaWWyq4J
         hfEGcV15lO7/aQGQHU9T393lMQuP11LHWUNkW5KfT7TPFyHoIzscVh3bBY8RMx8rt5
         Yv1Cx6UvvNlQxCr2Fq5YQXNxTjRY3j8iUKeKCq3Q=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200602125445.GA12527@alpha.franken.de>
References: <20200602125445.GA12527@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200602125445.GA12527@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
 tags/mips_5.8
X-PR-Tracked-Commit-Id: 9bd0bd264578fe191bf5d2ff23f9887b91862536
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8226f11318bd03ae0dbf028f7c433071cf4927f4
Message-Id: <159121830857.19900.9232810382803608178.pr-tracker-bot@kernel.org>
Date:   Wed, 03 Jun 2020 21:05:08 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Tue, 2 Jun 2020 14:54:45 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux tags/mips_5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8226f11318bd03ae0dbf028f7c433071cf4927f4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
