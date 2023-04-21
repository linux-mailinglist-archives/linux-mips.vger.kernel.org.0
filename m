Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F626EA51E
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 09:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjDUHo1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 03:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjDUHo0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 03:44:26 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E0EB010D7
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 00:44:24 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pplRQ-0004xg-00; Fri, 21 Apr 2023 09:44:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1F8ECC0122; Fri, 21 Apr 2023 09:41:35 +0200 (CEST)
Date:   Fri, 21 Apr 2023 09:41:35 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/8] MIPS: Replace assembly isa level directives with
 macros
Message-ID: <20230421074134.GA6209@alpha.franken.de>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
 <20230409104309.13887-2-jiaxun.yang@flygoat.com>
 <CAKwvOdmRobqFrnZ70ODzdMfp4A-Br0mHhRkEnmTrkyk7CmiERg@mail.gmail.com>
 <FEE1072C-2228-4B2E-92C0-760F0B471D04@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FEE1072C-2228-4B2E-92C0-760F0B471D04@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 20, 2023 at 08:29:03PM +0100, Jiaxun Yang wrote:
> Yes, GAS and LLVM sometimes have different opinions on what a instruction
> feature should belong to. Personally I think there is no right or wrong in most case.
> 
> So generally when we try to use some inline assembly features that toolchain
> may consider belongs to higher ISA level we will use `.set mips64r2` directives.
> 
> Having this patch just unified the defined arch across the tree, so it happens to fix
> some cases where `.set` was given a improper option.

I'd prefer, if we don't magically fix something by doing this massive
replacement. So first bug fixing then cleanup.

And what I don't like is the name of the #defines (I know it's not your
choice, ), they don't tell me anything and it's still not clear which
one should be used in which case.

I see one use case, which is enabling 64bit instruction inside a 32bit
kernel.

What are the others ?

Do we really need all of them ? For example the change in
arch/mips/mm/cex-oct.S, this is for a octeon kernel, which only supports
and works with 64bit kernels...


Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
