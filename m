Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54E0E1304FF
	for <lists+linux-mips@lfdr.de>; Sat,  4 Jan 2020 23:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgADWzI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Jan 2020 17:55:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:33736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbgADWzI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 4 Jan 2020 17:55:08 -0500
Subject: Re: [GIT PULL] MIPS fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578178507;
        bh=D84qV+OI+31SNcaWaO2OjXDd/MgAgNRUAnsaWTNwTJM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=NCmq3Q0hmrNPc/5BXdFB4XqNmYyBYBYVUldfWJldkA4sypV0dU/JoeMqyqbKlOf9x
         uJXCSDXMqCRkFG/nX/P3qdP7CAhnp+qv/1yJpKRtlQdefYOxNCusibNlitIJg3sN9D
         2pya+I8Gw7xsnpaZUNdig0DoZspdpSi9Owk0+/Ic=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200104200746.imnkglnarvkhzrtw@pburton-laptop>
References: <20200104200746.imnkglnarvkhzrtw@pburton-laptop>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200104200746.imnkglnarvkhzrtw@pburton-laptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
 tags/mips_fixes_5.5_1
X-PR-Tracked-Commit-Id: bbcc5672b0063b0e9d65dc8787a4f09c3b5bb5cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c420ddda506b80ec2686e405698d37fafeea3b7a
Message-Id: <157817850768.1331.3807606167522919556.pr-tracker-bot@kernel.org>
Date:   Sat, 04 Jan 2020 22:55:07 +0000
To:     Paul Burton <paulburton89@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The pull request you sent on Sat, 4 Jan 2020 12:07:46 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.5_1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c420ddda506b80ec2686e405698d37fafeea3b7a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
