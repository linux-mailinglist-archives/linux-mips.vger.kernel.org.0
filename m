Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED0526A624C
	for <lists+linux-mips@lfdr.de>; Tue, 28 Feb 2023 23:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjB1WTR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Feb 2023 17:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjB1WTQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Feb 2023 17:19:16 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5C4B71C322
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 14:19:10 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pX8JQ-000338-00; Tue, 28 Feb 2023 23:19:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 44C1AC10C2; Tue, 28 Feb 2023 23:15:01 +0100 (CET)
Date:   Tue, 28 Feb 2023 23:15:01 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, nathan@kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3] MIPS: Workaround clang inline compat branch issue
Message-ID: <20230228221501.GA15457@alpha.franken.de>
References: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Feb 28, 2023 at 07:34:59PM +0000, Jiaxun Yang wrote:
> Clang is unable to handle the situation that a chunk of inline
> assembly ends with a compat branch instruction and then compiler
> generates another control transfer instruction immediately after
> this compat branch. The later instruction will end up in forbidden
> slot and cause exception.
> 
> Workaround by add a option to control the use of compact branch.
> Currently it's selected by CC_IS_CLANG and hopefully we can change
> it to a version check in future if clang manages to fix it.
> 
> Fix boot on boston board.
> 
> Link: https://github.com/llvm/llvm-project/issues/61045
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
> v2: Add Link tag to LLVM bug
> v3: Docuement issue link in Kconfig as well
> ---
>  arch/mips/Kconfig           | 4 ++++
>  arch/mips/include/asm/asm.h | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
