Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 396DB774AA2
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 22:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbjHHUc1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 16:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236190AbjHHUcM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 16:32:12 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 13059199E3
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 12:54:34 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 41FE09200BF; Tue,  8 Aug 2023 21:54:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 3C0179200BB;
        Tue,  8 Aug 2023 20:54:33 +0100 (BST)
Date:   Tue, 8 Aug 2023 20:54:33 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Florian Fainelli <f.fainelli@gmail.com>
cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: Re: soft and hard float n32 and n64 binaries getting illegal
 instructions on Cobalt Qube2
In-Reply-To: <e161f63c-e573-7bb6-b988-d949c8ef0ac4@gmail.com>
Message-ID: <alpine.DEB.2.21.2308082044400.38537@angie.orcam.me.uk>
References: <733b4eec-6297-e72e-0803-a32a25d83072@gmail.com> <alpine.DEB.2.21.2308051412570.38537@angie.orcam.me.uk> <3afb0b00-e4f2-15a7-c68f-8b2475dc9f77@gmail.com> <alpine.DEB.2.21.2308081027580.38537@angie.orcam.me.uk> <alpine.DEB.2.21.2308081153240.38537@angie.orcam.me.uk>
 <e161f63c-e573-7bb6-b988-d949c8ef0ac4@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 8 Aug 2023, Florian Fainelli wrote:

> Now GDB tells me the faulting instruction is the following:
> 
> #0  0x77dcf190 in _dlstart_data () from target/lib/ld-musl-mipsn32el.so.1
> #1  0x77e28bfc in ?? () from target/lib/ld-musl-mipsn32el.so.1
> (gdb) display/i $pc
> 2: x/i $pc
> => 0x77dcf190 <_dlstart_data+17976>:    dclz    v1,a0

 So this is a MIPS64r1 instruction and Cobalt Qube2 is what, MIPS III?  
It looks like you've got a broken binary that expects a higher ISA version 
than what your hardware supports.  Assuming that you have built it with 
the correct compilation options (which I take it is the case given that 
your installation mostly works), you need to sort it out with the supplier 
of your software.  Perhaps there's inline assembly there that has been 
guarded incorrectly (though it shouldn't be necessary as GCC is itself 
able to produce DCLZ where suitable).

 HTH,

  Maciej
