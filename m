Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044756EAB28
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 15:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbjDUNBY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 09:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbjDUNBX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 09:01:23 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 38C0E1739
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 06:01:22 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 86EEE92009C; Fri, 21 Apr 2023 15:01:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 813D392009B;
        Fri, 21 Apr 2023 14:01:20 +0100 (BST)
Date:   Fri, 21 Apr 2023 14:01:20 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     Nick Desaulniers <ndesaulniers@google.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/8] MIPS: Replace assembly isa level directives with
 macros
In-Reply-To: <FEE1072C-2228-4B2E-92C0-760F0B471D04@flygoat.com>
Message-ID: <alpine.DEB.2.21.2304211350000.58739@angie.orcam.me.uk>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com> <20230409104309.13887-2-jiaxun.yang@flygoat.com> <CAKwvOdmRobqFrnZ70ODzdMfp4A-Br0mHhRkEnmTrkyk7CmiERg@mail.gmail.com> <FEE1072C-2228-4B2E-92C0-760F0B471D04@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 20 Apr 2023, Jiaxun Yang wrote:

> This is a perfect example, strictly speaking VZ extension is a addition of MIPS Release 5,
> LLVM is doing nothing wrong.
> In reality we are happy to run MIPS Release 2 Kernel on Release 5 CPUs, so GAS decided
> to allow it live with any MIPS level.

 It wasn't "decided" for GAS (or libopcodes to be exact), it just happened 
by chance (or call it sloppiness if you prefer).  There used to be effort 
outstanding to clean up ISA opcode assignment in GNU binutils for R3 to 
R5, but following the collapse of IMG/MTI it has never happened.  Cf. e.g. 
binutils commit 9785fc2a4d22 ("MIPS: Fix XPA base and Virtualization ASE 
instruction handling"), and as I recall there was a discussion on the 
binutils mailing list covering these matters too.

  Maciej
