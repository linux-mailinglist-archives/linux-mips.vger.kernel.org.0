Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A616182C5
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2019 01:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfEHXuM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 May 2019 19:50:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:36288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726891AbfEHXuM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 May 2019 19:50:12 -0400
Subject: Re: [GIT PULL] MIPS changes for 5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557359412;
        bh=RWOrWrWmi3h+shzPZp8fyicG/IPv7uSrE7wtofsLBKo=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=1iWqBi7U9yeFI8ByeoeiEsFNQCc6VCSIGw5YAcX8EmH57VYQOiP7vhiyOTYXOTDYZ
         6Msh8G6gnDjWktcPLChx9ZuaPWvVHZlKYPTLJ2H+HA+9YNZiMwAd4ztJmUN6iPQpIq
         Wqppi1EYwJWT4U7EnPM49zrP8XzfdmEYZzfDxgGs=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190508210444.vxnmbd2sdluubjdy@pburton-laptop>
References: <20190508210444.vxnmbd2sdluubjdy@pburton-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190508210444.vxnmbd2sdluubjdy@pburton-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.2
X-PR-Tracked-Commit-Id: 3751cbda8f223549d7ea28803cbec8ac87e43ed2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 92fab77b6b309dc219b02da4a69ad5dc76f7ec74
Message-Id: <155735941195.32517.3108513884819567716.pr-tracker-bot@kernel.org>
Date:   Wed, 08 May 2019 23:50:11 +0000
To:     Paul Burton <paul.burton@mips.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Wed, 8 May 2019 21:04:46 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/92fab77b6b309dc219b02da4a69ad5dc76f7ec74

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
