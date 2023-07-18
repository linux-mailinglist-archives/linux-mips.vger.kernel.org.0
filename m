Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7A5757FE9
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jul 2023 16:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbjGROoD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Jul 2023 10:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbjGROoD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Jul 2023 10:44:03 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 370851BC0;
        Tue, 18 Jul 2023 07:43:48 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 6370492009C; Tue, 18 Jul 2023 16:43:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 5FD0E92009B;
        Tue, 18 Jul 2023 15:43:46 +0100 (BST)
Date:   Tue, 18 Jul 2023 15:43:46 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Huacai Chen <chenhuacai@loongson.cn>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@gmail.com>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org,
        Feiyang Chen <chenfeiyang@loongson.cn>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH V2] MIPS: Loongson: Fix build error when make
 modules_install
In-Reply-To: <20230628110847.3168269-1-chenhuacai@loongson.cn>
Message-ID: <alpine.DEB.2.21.2307172333070.55436@angie.orcam.me.uk>
References: <20230628110847.3168269-1-chenhuacai@loongson.cn>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 28 Jun 2023, Huacai Chen wrote:

> After commit 0e96ea5c3eb5904e5dc2f ("MIPS: Loongson64: Clean up use of
> cc-ifversion") we get a build error when make modules_install:
> 
> cc1: error: '-mloongson-mmi' must be used with '-mhard-float'
> 
> The reason is when make modules_install, 'call cc-option' doesn't work
> in $(KBUILD_CFLAGS) of 'CHECKFLAGS'. Then there is no -mno-loongson-mmi
> applied and -march=loongson3a enable MMI instructions.

 That's the wrong fix, you've just papered over the actual problem in a 
needlessly complex way.

 The right fix is not to define CHECKFLAGS unless `need-compiler' -- we 
don't need CHECKFLAGS when we aren't going to use the compiler, in which 
case Makefile.compiler is not sourced, as discussed here: 
<https://lore.kernel.org/r/20230204145641.66417-1-alobakin@mailbox.org/> 
and here: 
<https://lore.kernel.org/r/alpine.DEB.2.21.2302071942200.11790@angie.orcam.me.uk/>.  
I guess nobody bothers reading such discussions though, hence the most 
obvious fixes are ignored.

 I've posted proper fixes now: 
<https://lore.kernel.org/r/alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk/>.

  Maciej
