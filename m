Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 127DA7748F6
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 21:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbjHHTpw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 15:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbjHHTpd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 15:45:33 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 00EEA11BDE7
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 09:49:37 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id F40379200C1; Tue,  8 Aug 2023 11:43:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id F26469200BF;
        Tue,  8 Aug 2023 10:43:46 +0100 (BST)
Date:   Tue, 8 Aug 2023 10:43:46 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Florian Fainelli <f.fainelli@gmail.com>
cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: Re: soft and hard float n32 and n64 binaries getting illegal
 instructions on Cobalt Qube2
In-Reply-To: <3afb0b00-e4f2-15a7-c68f-8b2475dc9f77@gmail.com>
Message-ID: <alpine.DEB.2.21.2308081027580.38537@angie.orcam.me.uk>
References: <733b4eec-6297-e72e-0803-a32a25d83072@gmail.com> <alpine.DEB.2.21.2308051412570.38537@angie.orcam.me.uk> <3afb0b00-e4f2-15a7-c68f-8b2475dc9f77@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Florian,

> > > Unfortunately gdb also produces the same illegal instruction so I have not
> > > been able to get much debug so far, any hints or clues as to what could be
> > > wrong?
> > 
> >   No clue, but would you be able to get a core dump of a failing program?
> > This would indicate what instruction has caused an issue and where, and
> > then we can take it from there.
> 
> Looks like GDB is not too happy with the core file I obtained, see below. Is
> this a known issue with gdb-12.1? gdb-11.x was not faring any better
> unfortunately. The core dump is attached (hope it makes it to the mailing
> list).

 Sigh.  Back in 2017 I fixed numerous issues with MIPS core file handling 
in GDB, which was then well-tested, and I haven't looked at it since.  So 
it must be a regression, either in GDB or in the producer (Linux kernel).

 I can reproduce it and I'll see if I can debug this.  I may ask you for 
the corresponding binary and shared libraries at one point.

 NB I note that the core file is ELF32 and does not have the EF_MIPS_ABI2 
flag set in its file header, so it looks like an o32 core file to me.  
Since your subject mentions n32/n64, can you please check what kind of 
binary your `iperf3' is (e.g. `file iperf3', `readelf -h iperf3', etc.)?

  Maciej
