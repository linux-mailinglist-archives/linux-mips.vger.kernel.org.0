Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8E9705914
	for <lists+linux-mips@lfdr.de>; Tue, 16 May 2023 22:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjEPUrP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 May 2023 16:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjEPUrO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 May 2023 16:47:14 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A80DC114
        for <linux-mips@vger.kernel.org>; Tue, 16 May 2023 13:47:12 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 8C31E92009D; Tue, 16 May 2023 22:47:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 85EAC92009B;
        Tue, 16 May 2023 21:47:11 +0100 (BST)
Date:   Tue, 16 May 2023 21:47:11 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] MIPS: Limit MIPS_MT_SMP support by ISA reversion
In-Reply-To: <62F0038E-F2A2-4D1E-B53A-E84916598102@flygoat.com>
Message-ID: <alpine.DEB.2.21.2305162116470.50034@angie.orcam.me.uk>
References: <20230407223532.7981-1-jiaxun.yang@flygoat.com> <alpine.DEB.2.21.2305161542290.50034@angie.orcam.me.uk> <62F0038E-F2A2-4D1E-B53A-E84916598102@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 16 May 2023, Jiaxun Yang wrote:

> > Actually the MIPS MT ASE is explicitly from R2 onwards only[1] and it has 
> > *not* been withdrawn as at R6[2].
> 
> Thanks for the info!
> 
> I’m a little bit confused with relationship of MT and VP though, I thought VP
> suppressed MT, and they look conflicting, does it mean there are two possible
> ways of multithreading in R6?

 Hmm, interesting point.  I would have thought you can have either but not 
both, however there is a note along with the description of CP0.Config3.MT 
in[1] that for R6 the bit has to be 0.  That place and the description of 
the new CP0.Config5.VP bit seem the only mentions of MT ASE/Module removal 
with R6 and there is e.g. this paragraph for CP0.Wired:

"Release 6 adds the Limit field.  The intent of a non-zero value for this 
field is to place a limit on the number of wired entries in a TLB such 
that non-wired entries may be shared in a common physical TLB by multiple 
VPEs (as defined in the Multi-threading (MT) Module, Volume IV-f), or 
Guests and Root (see the Virtualization Module, Volume IV-i).  For Release 
6, if the Limit field is greater than 0, and a value greater than Limit is 
written to the Wired field, then the write is ignored."

which explicitly refers to the MT ASE/Module in the context of R6 only.  

 Revision 6.02 is the only MIPS32r6 privileged specification a copy of 
which I have, however it has this note in the revision history:

"* Added CP0 VPControl for MT (new)"

so I guess support for the MT ASE/Module was removed as an afterthought 
and then the architecture specification updated in a sloppy manner.  

 And indeed the MIPS64r6 privileged specification confirms that, as I have 
copies or revisions 6.00 and 6.03, and the former has the MT ASE/Module 
still fully supported (and no mention of the CP0.Config5.VP bit nor the 
CP0.VPControl register) while the latter is similar to MIPS32 revision 
6.02 document.

> If so I’d probably rewrite cps-sec in uasm to take that into account, sigh. 

 I guess you don't have to be concerned about R6 then.

[1] "MIPS32 Architecture For Programmers, Vol. III: MIPS32 / microMIPS32 
    Privileged Resource Architecture", IMAGINATION TECHNOLOGIES, Document 
    Number: MD00090, Revision 6.02, July 10, 2015, Table 9.67 "Config3 
    Register Field Descriptions", p. 251

  Maciej
