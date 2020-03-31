Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B397B199B90
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 18:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCaQaM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 12:30:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:39752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730541AbgCaQaL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 31 Mar 2020 12:30:11 -0400
Subject: Re: [GIT PULL] MIPS changes for v5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585672211;
        bh=+tkL8kQtNuf5VvF2X0APZ1nSWeIXj5cZJyyAB96l3FI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=JvxGbcFdr+QIBJPlwOXjkXeqhJhBecoXND2ePAvez1ExueDUSuFCVlqJWlE1IhhQB
         Cst5vtKFrCn4ZPYe+tAMWbhNwn6Hz4hg4cdXRFI8YVvFDKAFH9XUn4m4RaHFoa9nbq
         w9dX4o2w4r12iGrEfiRkh3jpLSKUyls3vFQ0CQTo=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200330120315.GA10196@alpha.franken.de>
References: <20200330120315.GA10196@alpha.franken.de>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200330120315.GA10196@alpha.franken.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
 tags/mips_5.7
X-PR-Tracked-Commit-Id: ba15533275dd70238b523417d222d43fb40dac9d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d71e064449a704a026fa032ec852d532f08aefa1
Message-Id: <158567221136.1514.3805457112813628843.pr-tracker-bot@kernel.org>
Date:   Tue, 31 Mar 2020 16:30:11 +0000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Mon, 30 Mar 2020 14:03:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux tags/mips_5.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d71e064449a704a026fa032ec852d532f08aefa1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
