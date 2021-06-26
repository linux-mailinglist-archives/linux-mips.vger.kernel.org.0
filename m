Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092883B4C6F
	for <lists+linux-mips@lfdr.de>; Sat, 26 Jun 2021 06:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhFZEPC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Jun 2021 00:15:02 -0400
Received: from angie.orcam.me.uk ([78.133.224.34]:60086 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhFZEPB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 26 Jun 2021 00:15:01 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id A415992009D; Sat, 26 Jun 2021 06:12:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 9D40F92009B;
        Sat, 26 Jun 2021 06:12:38 +0200 (CEST)
Date:   Sat, 26 Jun 2021 06:12:38 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] serial: core, 8250: Add a hook for extra port property
 reporting
In-Reply-To: <YMio51m/EaS0vIsb@kroah.com>
Message-ID: <alpine.DEB.2.21.2106260037210.37803@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk> <alpine.DEB.2.21.2105190414160.29169@angie.orcam.me.uk> <YMio51m/EaS0vIsb@kroah.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 15 Jun 2021, Greg Kroah-Hartman wrote:

> > Add a hook for `uart_report_port' to let serial ports report extra 
> > properties beyond `irq' and `base_baud'.  Use it with the 8250 backend 
> > to report extra baud rates supported above the base rate for ports with 
> > the UPF_MAGIC_MULTIPLIER property, so that people have a way to find out 
> > that they are supported with their system, e.g.:
[...]
> Ick, really?  What relies on this print message?  Why do we need a whole
> new uart port hook for this?

 As I noted, perhaps too briefly, in the commit description (see the last 
sentence above) people need to be made aware of the extra baud rates above 
`base_baud' supported, or otherwise they'll have no way to figure out they 
can use them.

 Reporting tweaked `base_baud' would I think cause confusion from the 
inconsistency with the TIOCGSERIAL/TIOCSSERIAL ioctls (e.g. `setserial'), 
and the sysfs flags:

$ cat /sys/class/tty/ttyS[0-2]/flags
0x10010040
0x10010040
0x90000040
$ 

(here from a Malta board) are IMO too obscure for anyone to figure this 
out (bit 16 means the two extra baud rates are supported).

 As explained with 1/5 we could set `base_baud' to 460800 instead and 
hardcode bit 15 of the divisor to 1, relying on undocumented Super I/O IC 
behaviour, but that would require more exhaustive verification than I am 
able to do with just a single board and IC type and revision.

> Isn't there some other way for your specific variant to print out
> another message if you really want to do something "odd" like this?

 There's always another way. :)  How about?

serial8250.0: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
serial8250.0: ttyS0 extra baud rates supported: 230400, 460800

> And you did not document what your new change did anywhere in the tree,
> so people are going to be confused.

 We've been somewhat terse about things, but you're probably right here.  
Sorry about that.

> I've taken the other patches here, but not this one.

 Thanks.  I've posted an alternative printing a message like above, with 
some commentary.  Let me know if that makes you feel more convinced.

  Maciej
