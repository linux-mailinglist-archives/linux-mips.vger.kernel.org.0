Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 576F36EA896
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 12:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbjDUKs6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 06:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjDUKs5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 06:48:57 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 601DF6E92
        for <linux-mips@vger.kernel.org>; Fri, 21 Apr 2023 03:48:56 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ppoJw-0006No-00; Fri, 21 Apr 2023 12:48:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C7410C0129; Fri, 21 Apr 2023 12:48:32 +0200 (CEST)
Date:   Fri, 21 Apr 2023 12:48:32 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, llvm@lists.linux.dev,
        ndesaulniers@google.com, nathan@kernel.org
Subject: Re: [PATCH 5/8] MIPS: mipsregs: Parse fp and sp register by name in
 parse_r
Message-ID: <20230421104832.GA9238@alpha.franken.de>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
 <20230409104309.13887-6-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409104309.13887-6-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 09, 2023 at 11:43:06AM +0100, Jiaxun Yang wrote:
> parse_r helper is used to parse register number from oprand,
> it only handles oprand which use number to refer register before.
> 
> However compiler may use $gp and $sp to reference register 29 and
> 30. Handle this situation by adding relevant match name.

are you sure the compiler is doing that ? Which compiler is this ?
To me this feels more like missing #defines from asm/regdef.h for
some inline assembly stuff...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
