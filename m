Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45BAB77A0D0
	for <lists+linux-mips@lfdr.de>; Sat, 12 Aug 2023 17:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbjHLPcD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Aug 2023 11:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjHLPcC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Aug 2023 11:32:02 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 30CB9E54
        for <linux-mips@vger.kernel.org>; Sat, 12 Aug 2023 08:32:03 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 3A3EA92009D; Sat, 12 Aug 2023 17:32:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 331FF92009C;
        Sat, 12 Aug 2023 16:32:01 +0100 (BST)
Date:   Sat, 12 Aug 2023 16:32:01 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     down in the bunny hole <downinthebunnyhole@gmail.com>
cc:     linux-mips@vger.kernel.org
Subject: Re: 90s MIPS eval
In-Reply-To: <CAAZ8i82Q7qvdw6uDBKMJ=G-DtUaqmDBqpR-0Cyt8xCjsm4aKmQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2308120121020.8596@angie.orcam.me.uk>
References: <CAAZ8i82Q7qvdw6uDBKMJ=G-DtUaqmDBqpR-0Cyt8xCjsm4aKmQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 2 Aug 2023, down in the bunny hole wrote:

> some of these boards are broken, but I think/hope I can fix their
> hardware problems
> - clean up, remove dust
> - remove sand that have accumulated from having exposed to the elements
> - replace capacitors
> - replace LDOs
> - rebuild damaged tracks due to battery acid leaking
> - reprogram empty UV-PROM due to long exposition to the sunlight
> without any protective label
> - ...

 Good luck with bringing these pieces back to life.  Do you have any 
specific previous experience that tells you to replace LDOs?

> The real problem is that I have no documentation and no source of the 
> firmware.
> 
> Do you happen to know someone who worked with those boards? and can
> share their UserManual, doc and firmware source?

 I already gave you pointers to documentation on the MIPS/NetBSD mailing 
list.  I believe that's about what used to exist in public, but I think 
it's fairly good, down to board schematics, isn't it?

 As to firmware sources for Atlas here's the most recent YAMON release: 
<https://web.archive.org/web/20140703055905if_/http://www.imgtec.com/tools/mips-tools/downloads/yamon/yamon-src-02.22.tar.gz>.  

 I suggest that you try the binary image first with one of your boards: 
<https://web.archive.org/web/20140703055848if_/http://www.imgtec.com/tools/mips-tools/downloads/yamon/yamon-bin-02.22.zip> 
just to make sure you've got your process right, especially as rebuilding 
the sources with contemporary tools can be tricky (as can be building old 
tools); note that Atlas wasn't an actively supported board at that point 
anymore, but relevant code wasn't removed from YAMON either, so it may or 
may not work with your hardware depending on the constellation of bugs 
implemented.

 A version of PMON for the Algorithmics boards seems to be available here: 
<https://web.archive.org/web/20010615095509if_/http://www.algor-uk.com:80/ftp/pub/software/pmon/pmonsrc-current.tar.gz>. 
I don't know how to use it.  Also sadly none of the Linux source images 
with board-specific modifications in the directory nearby seem to have 
been archived, sigh.  I find it regrettable that this stuff has never been 
upstreamed or we could still have it.  Those were very fine boards.

 I suggest that you do further archive.org archaeology yourself, I just 
did the parts you may not have been able to figure out without prior 
knowledge.

> The MIPS Atlas comes with Philips SAA9730, a ~20 old bit combined
> multimedia and peripheral controller used in thin clients, Internet
> access terminals, and diskless workstations, that implements
>   - the VGA interface and Video RAM
>   - two USB interfaces
>   - PS/2 Keyboard and PS2 Mouse interface
>   - I2C interface to serial EEPROM
>   - Serial Debug RS232 Interface
>   - Ethernet interface
> 
> As far as I can see from feedback in Linux, this chip was/is known to
> be weird, but I don't find details: has anyone ever worked on it? If
> so, are there any "notes" about its weird behavior?

 I suggest you check out old Linux kernel sources from before code for 
Atlas has been removed.  I'm fairly sure there used to be what you are 
after recorded there, and in any case it's your best bet.  I may be the 
only person still around who touched that stuff.

> I'm tempted to support it, but it might not be worth it and so I might
> opt to bypass it altogether.

 Hope this helps, and good luck with your endeavours.  Let us know if you 
make any progress and feel free to come back with questions.

  Maciej
