Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A15296FB31D
	for <lists+linux-mips@lfdr.de>; Mon,  8 May 2023 16:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234480AbjEHOmC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 May 2023 10:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234362AbjEHOl7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 May 2023 10:41:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78512769A;
        Mon,  8 May 2023 07:41:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03DFF63FF4;
        Mon,  8 May 2023 14:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5599DC433AF;
        Mon,  8 May 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683556916;
        bh=GN50963fdkw5cucYPuN4xRaiQmxHDA0hrlxtEWYsvtQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=r64Dxi/fpFWqlTPgj0oa/IYTE2F52/0U4frXOQyj/T+tixhV8XgLG9eTZd0UTcV36
         MThVa+dfb2c7qq/bN1MQ8+/nOc8Zmb/oMzz15aLEjcY3k7iXI8FgY1pc19ij96JWIV
         p9dbdwXXuKSBbcyHFrtz6ZwA4PUDzbKgr0j7wVdl3YWaGX8HsjZh5pa2IYQUToSezH
         E9CdNSf3PqfxLJyZIxE9T5n56CbdoDjfQLgg37E6Wjd320jmozml/4Ck793810C2gG
         zwHDr3HymZCWssXv9EaO6SQ9YW4Hi3EpsX6/opGZlaru1Qz9BiS57573d/bVlpFpBc
         4vD8grh8d6yuA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2C09CE26D2B;
        Mon,  8 May 2023 14:41:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] libgcc: Add forward declarations for generic library routines
From:   patchwork-bot+linux-riscv@kernel.org
Message-Id: <168355691617.25692.18413165340491314933.git-patchwork-notify@kernel.org>
Date:   Mon, 08 May 2023 14:41:56 +0000
References: <5cdbe08296693dd53849f199c3933e16e97b33c1.1682088593.git.geert+renesas@glider.be>
In-Reply-To: <5cdbe08296693dd53849f199c3933e16e97b33c1.1682088593.git.geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
        arnd@arndb.de, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
        lkp@intel.com
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 21 Apr 2023 16:54:24 +0200 you wrote:
> With W=1 on platforms that use the generic gcc library routines
> (csky/loongarch/mips/riscv/sh/xtensa):
> 
>     lib/ashldi3.c:9:19: warning: no previous prototype for '__ashldi3' [-Wmissing-prototypes]
> 	9 | long long notrace __ashldi3(long long u, word_type b)
> 	  |                   ^~~~~~~~~
>       CC      lib/ashrdi3.o
>     lib/ashrdi3.c:9:19: warning: no previous prototype for '__ashrdi3' [-Wmissing-prototypes]
> 	9 | long long notrace __ashrdi3(long long u, word_type b)
> 	  |                   ^~~~~~~~~
>       CC      lib/cmpdi2.o
>     lib/cmpdi2.c:9:19: warning: no previous prototype for '__cmpdi2' [-Wmissing-prototypes]
> 	9 | word_type notrace __cmpdi2(long long a, long long b)
> 	  |                   ^~~~~~~~
>       CC      lib/lshrdi3.o
>     lib/lshrdi3.c:9:19: warning: no previous prototype for '__lshrdi3' [-Wmissing-prototypes]
> 	9 | long long notrace __lshrdi3(long long u, word_type b)
> 	  |                   ^~~~~~~~~
>       CC      lib/muldi3.o
>     lib/muldi3.c:49:19: warning: no previous prototype for '__muldi3' [-Wmissing-prototypes]
>        49 | long long notrace __muldi3(long long u, long long v)
> 	  |                   ^~~~~~~~
>       CC      lib/ucmpdi2.o
>     lib/ucmpdi2.c:8:19: warning: no previous prototype for '__ucmpdi2' [-Wmissing-prototypes]
> 	8 | word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b)
> 	  |                   ^~~~~~~~~
> 
> [...]

Here is the summary with links:
  - libgcc: Add forward declarations for generic library routines
    https://git.kernel.org/riscv/c/4f20b7471c57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


