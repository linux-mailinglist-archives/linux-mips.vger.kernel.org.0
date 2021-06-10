Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF0B3A3341
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 20:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhFJSkW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Jun 2021 14:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbhFJSkV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 14:40:21 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2EB7DC061574;
        Thu, 10 Jun 2021 11:38:25 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 627F292009D; Thu, 10 Jun 2021 20:38:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 5B63092009C;
        Thu, 10 Jun 2021 20:38:22 +0200 (CEST)
Date:   Thu, 10 Jun 2021 20:38:22 +0200 (CEST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] serial, Malta: Fixes to magic multipliers for SMSC Super
 I/O UARTs
Message-ID: <alpine.DEB.2.21.2105181800170.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

 I've noticed our Malta platform serial driver does not take advantage of 
support for the special UART divisor values for the bit rates of 230400 
and 460800 bits per second its SMSC FDC37M817 Super I/O hardware provides.  

 Our 8250 core provides for these divisors via the UPF_MAGIC_MULTIPLIER 
flag, so I thought it would be a straightforward platform change, but it 
has turned out that the flag has AFAICT never worked (I wonder how people 
test those things).  The only platform currently in our tree that sets the 
flag uses it for a different purpose.

 I've fixed UPF_MAGIC_MULTIPLIER handling then in our 8250 core, added 
reporting so that people have a chance to know the rates are supported and 
then added the flag to Malta platform initialisers for Super I/O UARTs.  
I have examined YAMON sources to verify that we don't have to enable the 
special UART divisor values ourselves.  See individual change descriptions 
for further details.

 Verified with a WTI CPM-800 site manager device which supports bit rates 
of up to 230400bps.  Also verified at 230400bps and 460800bps with an 
EXSYS EX-44072 option card under Linux, based on the Oxford Semiconductor 
OXPCIe952 device in its native mode; our clock settings are however off 
enough for OxSemi PCIe devices for the former data rate only just working 
and the latter making transmission go out of sync with data corruption 
resulting.  Another patch series to fix OxSemi handling bugs follows then.

 Verification of the OxSemi patch series actually revealed an interesting 
peculiarity of the SMSC Super I/O IC that contradicts SMSC documentation.  
I have added a clarification as 1/5 of this patch series, originally meant 
to contain four patches only.  This has been confirmed both with the Malta 
board concerned here and my old x86 server, which also has a similar SMSC 
Super I/O part, although with high-speed operation not enabled by the 
BIOS.

 NB occasional input overruns were observed at 460800bps (with a MIPS 5Kc 
@160MHz running this Malta), which could be eliminated by lowering the 
`rx_trig_bytes' parameter to 4 from the default of 8 (the UART core in the 
FDC37M817 has a 16-byte FIFO), via sysfs.  Perhaps it would make sense to 
change the default, at least for the higher-speed ports?

 Please apply.

  Maciej
