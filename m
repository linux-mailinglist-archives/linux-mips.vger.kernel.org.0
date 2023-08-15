Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8711C77D5CE
	for <lists+linux-mips@lfdr.de>; Wed, 16 Aug 2023 00:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239459AbjHOWLm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Aug 2023 18:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239962AbjHOWL0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Aug 2023 18:11:26 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 44C35210D
        for <linux-mips@vger.kernel.org>; Tue, 15 Aug 2023 15:11:21 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 7263B92009C; Wed, 16 Aug 2023 00:11:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 6C42B92009B;
        Tue, 15 Aug 2023 23:11:18 +0100 (BST)
Date:   Tue, 15 Aug 2023 23:11:18 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: build error with DECSTATION and FB_MAXINE
In-Reply-To: <3484e4ea-1743-8d66-0e7b-4f1576e3a32e@infradead.org>
Message-ID: <alpine.DEB.2.21.2308152255080.8596@angie.orcam.me.uk>
References: <3484e4ea-1743-8d66-0e7b-4f1576e3a32e@infradead.org>
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

Hi Randy,

> the build fails due to the use of the KSEG1ADDR() macro, which is only
> defined for 32BIT:
> 
> In file included from ../drivers/video/fbdev/maxinefb.c:34:
> ../drivers/video/fbdev/maxinefb.c: In function 'maxinefb_ims332_write_register':
> ../include/video/maxinefb.h:16:41: error: implicit declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Werror=implicit-function-declaration]

 Thanks for the report.

> Any suggestions or patches for this?

 Sigh.  Many years ago I foolishly declined an offer for such hardware, so 
I have no way to verify the driver and it would benefit indeed from a 
rewrite such as one I made a few years ago for all the other DECstation 
video devices we have in the tree and which I have specimens for.  I do 
have a suitable R4k CPU module I could use with such a system to verify 
64-bit operation of the driver though.

 So I think for the time being we ought to just heed the advice given by 
the compiler and replace the KSEG1ADDR reference with CKSEG1ADDR, as this 
is a platform device really you won't find in a non-MIPS machine, though 
the proper way would be by using `ioremap' really.  I'll make a patch.

 I don't have much hope to find such hardware as it was rare in the first 
place, but maybe one day, who knows?

  Maciej
