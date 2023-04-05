Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A20D6D7703
	for <lists+linux-mips@lfdr.de>; Wed,  5 Apr 2023 10:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237538AbjDEIdm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Apr 2023 04:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237525AbjDEIdi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Apr 2023 04:33:38 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C345A4236
        for <linux-mips@vger.kernel.org>; Wed,  5 Apr 2023 01:33:37 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pjyaC-0007rR-03; Wed, 05 Apr 2023 10:33:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6CE9CC2424; Wed,  5 Apr 2023 10:33:21 +0200 (CEST)
Date:   Wed, 5 Apr 2023 10:33:21 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Enze Li <lienze@kylinos.cn>
Cc:     rppt@kernel.org, akpm@linux-foundation.org, nathan@kernel.org,
        linux-mips@vger.kernel.org, enze.li@gmx.com
Subject: Re: [PATCH] MIPS: tlbex: undefine pr_define macro when appropriate
Message-ID: <20230405083321.GD6145@alpha.franken.de>
References: <20230401061025.3556622-1-lienze@kylinos.cn>
 <20230401071708.GA4262@alpha.franken.de>
 <dda8afc67055372f1322750e851ab4001300ea65.camel@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dda8afc67055372f1322750e851ab4001300ea65.camel@kylinos.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 01, 2023 at 05:14:28PM +0800, Enze Li wrote:
> On Sat, 2023-04-01 at 09:17 +0200, Thomas Bogendoerfer wrote:
> > On Sat, Apr 01, 2023 at 02:10:25PM +0800, Enze Li wrote:
> > > The pr_define macro is used only within the
> > > output_pgtable_bits_defines
> > > function, and it hasn't been used anywhere else so far.  Therefore,
> > > it
> > > should be undefined when appropriate.
> > > 
> > > Signed-off-by: Enze Li <lienze@kylinos.cn>
> > > ---
> > >  arch/mips/mm/tlbex.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> > > index 80e05ee98d62..510a7e316eb6 100644
> > > --- a/arch/mips/mm/tlbex.c
> > > +++ b/arch/mips/mm/tlbex.c
> > > @@ -255,6 +255,8 @@ static void output_pgtable_bits_defines(void)
> > >         pr_define("_PAGE_DIRTY_SHIFT %d\n", _PAGE_DIRTY_SHIFT);
> > >         pr_define("_PFN_SHIFT %d\n", _PFN_SHIFT);
> > >         pr_debug("\n");
> > > +
> > > +#undef pr_define
> > 
> > I'm probably missing something... what problem are you fixing here ?
> > 
> > Thomas.
> > 
> 
> Hi Thomas,
> 
> Thanks for your review.  🙂
> 
> I'm trying to make the code more readable.  When I first looked at this
> function, I was wondering why the pr_define macro was defined here.  It
> looks more like a temporary definition, and I was also curious if it
> might be used elsewhere.  After searching, I couldn't find any other
> instances of it being used, which left me feeling confused.
> 
> To enhance readability, it would be good to undefine it at the end of

why is it more readable ?

> What do you think of these modifications?  Will they make it more
> convenient for others who read this code?

for me the missing undef doesn't hurt as there is no rule that local
#defines need to be undefined. And less lines distracting me is a plus

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
