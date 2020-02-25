Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6789216EE6B
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2020 19:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgBYSzJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Feb 2020 13:55:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:34954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728051AbgBYSzI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Feb 2020 13:55:08 -0500
Subject: Re: [GIT PULL] MIPS fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582656908;
        bh=c8zyBx7HxuaJRDwqirCzo/sxWNXouVjdNgOmTIWzH5M=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=tLveQi3ZMxvgUVLr3oQv/yg9EzzbvKA2DxwdtLkEP1aizOMGx8gfwwOn5Pc52nGIp
         sGds8aWWI9wXbeq4ZVGB4wIf2UiOoArWbRuKYQywZrW9PQgSkC4FiU/EuBVFoigo5G
         7d51pXbkeXc34if4uEjYYsmXIKUfJk2Hxc5qLv2Y=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200225065831.hl7ewk2s5trvhp4a@lantea.localdomain>
References: <20200225065831.hl7ewk2s5trvhp4a@lantea.localdomain>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200225065831.hl7ewk2s5trvhp4a@lantea.localdomain>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-fixes
X-PR-Tracked-Commit-Id: 3234f4ed3066a58cd5ce8edcf752fa4fe0c95cb5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d67f250e96344f006e3a6be148def4c6537d05a0
Message-Id: <158265690824.32229.6706240051293071978.pr-tracker-bot@kernel.org>
Date:   Tue, 25 Feb 2020 18:55:08 +0000
To:     Paul Burton <paulburton@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Mon, 24 Feb 2020 22:58:31 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d67f250e96344f006e3a6be148def4c6537d05a0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
