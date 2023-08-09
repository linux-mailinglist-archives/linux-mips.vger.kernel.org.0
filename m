Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E55777572C
	for <lists+linux-mips@lfdr.de>; Wed,  9 Aug 2023 12:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjHIKge (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Aug 2023 06:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjHIKge (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Aug 2023 06:36:34 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A6E7EE4A
        for <linux-mips@vger.kernel.org>; Wed,  9 Aug 2023 03:36:32 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id E76189200C1; Wed,  9 Aug 2023 12:36:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id E0B0A9200BF;
        Wed,  9 Aug 2023 11:36:31 +0100 (BST)
Date:   Wed, 9 Aug 2023 11:36:31 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Florian Fainelli <f.fainelli@gmail.com>
cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: Re: soft and hard float n32 and n64 binaries getting illegal
 instructions on Cobalt Qube2
In-Reply-To: <48b77305-6b92-c453-d222-aad9a8834c69@gmail.com>
Message-ID: <alpine.DEB.2.21.2308091135270.25915@angie.orcam.me.uk>
References: <733b4eec-6297-e72e-0803-a32a25d83072@gmail.com> <alpine.DEB.2.21.2308051412570.38537@angie.orcam.me.uk> <3afb0b00-e4f2-15a7-c68f-8b2475dc9f77@gmail.com> <alpine.DEB.2.21.2308081027580.38537@angie.orcam.me.uk> <alpine.DEB.2.21.2308081153240.38537@angie.orcam.me.uk>
 <e161f63c-e573-7bb6-b988-d949c8ef0ac4@gmail.com> <alpine.DEB.2.21.2308082044400.38537@angie.orcam.me.uk> <48b77305-6b92-c453-d222-aad9a8834c69@gmail.com>
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

On Tue, 8 Aug 2023, Florian Fainelli wrote:

> > It looks like you've got a broken binary that expects a higher ISA version
> > than what your hardware supports.  Assuming that you have built it with
> > the correct compilation options (which I take it is the case given that
> > your installation mostly works), you need to sort it out with the supplier
> > of your software.  Perhaps there's inline assembly there that has been
> > guarded incorrectly (though it shouldn't be necessary as GCC is itself
> > able to produce DCLZ where suitable).
> 
> It is my bad having assumed that the RM5231 CPU was MIPS64R1 capable and I
> completely forgot that it was not the case, thanks a lot for your help. I have
> now told GCC to build for -march=mips4 by default and it works properly.
> 
> I will in in that corner over there to hide ->

 No worries, I'm glad this has been sorted.

  Maciej
