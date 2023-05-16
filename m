Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA6770517F
	for <lists+linux-mips@lfdr.de>; Tue, 16 May 2023 17:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbjEPPFS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 May 2023 11:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233106AbjEPPFS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 May 2023 11:05:18 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F28FD5B80
        for <linux-mips@vger.kernel.org>; Tue, 16 May 2023 08:05:16 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 2444592009D; Tue, 16 May 2023 17:05:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 1E5EC92009B;
        Tue, 16 May 2023 16:05:16 +0100 (BST)
Date:   Tue, 16 May 2023 16:05:16 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] MIPS: Limit MIPS_MT_SMP support by ISA reversion
In-Reply-To: <20230407223532.7981-1-jiaxun.yang@flygoat.com>
Message-ID: <alpine.DEB.2.21.2305161542290.50034@angie.orcam.me.uk>
References: <20230407223532.7981-1-jiaxun.yang@flygoat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 7 Apr 2023, Jiaxun Yang wrote:

> MIPS MT ASE is only available on ISA between Release 1 and Release 5.
> Add ISA level dependency to Kconfig to fix build.

 Actually the MIPS MT ASE is explicitly from R2 onwards only[1] and it has 
*not* been withdrawn as at R6[2].

 NB I was onboard with MTI when the MT ASE was introduced (I was a member 
of the 34K team, working on CPU bringup), so I know this stuff first hand.

References:

[1] "MIPS32 Architecture for Programmers, VolumeIV-f: The MIPS MT 
     Application-Specific Extension to the MIPS32 Architecture", MIPS 
     Technologies, Inc., Document Number: MD00378, Revision 1.00, 
     September 28, 2005, Section 1.1 "Background", p. 1

[2]  "MIPS32 Architecture For Programmers, Volume I-A: Introduction to the 
     MIPS32 Architecture", Imagination Technologies LTD., Document Number: 
     MD00082, Revision 6.01, August 20, 2014, Chapter 1 "About This Book", 
     p. 12

  Maciej
