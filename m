Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17F626E8D25
	for <lists+linux-mips@lfdr.de>; Thu, 20 Apr 2023 10:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbjDTIu5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Apr 2023 04:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234017AbjDTIuK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Apr 2023 04:50:10 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 928D25B82
        for <linux-mips@vger.kernel.org>; Thu, 20 Apr 2023 01:48:51 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1ppPy5-0003nT-00; Thu, 20 Apr 2023 10:48:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D2308C0119; Thu, 20 Apr 2023 10:06:21 +0200 (CEST)
Date:   Thu, 20 Apr 2023 10:06:21 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if
 unsupported
Message-ID: <20230420080621.GA6908@alpha.franken.de>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-7-jiaxun.yang@flygoat.com>
 <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
 <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com>
 <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
 <20230419221500.GA17797@alpha.franken.de>
 <B02E6819-A25F-4588-8CDA-D7C5A2E5B0B6@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B02E6819-A25F-4588-8CDA-D7C5A2E5B0B6@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 20, 2023 at 12:36:41AM +0100, Jiaxun Yang wrote:
> >>> Wikipedia [1] should fit the purpose.
> >>> 
> >>> [1]: https://en.wikipedia.org/wiki/List_of_MIPS_architecture_processors
> >> 
> >> Mostly! Though I was not able to verify:
> >> - p5600
> > 
> > mips32r5
> 
> On wikipedia’s “Imagination Technologies” section.
> 
> > 
> >> - r5500
> > 
> > mips4
> > 
> >> - rm5200
> > 
> > mips4
> 
> I think those are all R5000 derivatives?

yes, which makes them mips4. Vr5500 is special as it supports out-of-order
execution.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
