Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30AC3205D7
	for <lists+linux-mips@lfdr.de>; Sat, 20 Feb 2021 15:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhBTOzZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 20 Feb 2021 09:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhBTOzY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 20 Feb 2021 09:55:24 -0500
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0681AC061786
        for <linux-mips@vger.kernel.org>; Sat, 20 Feb 2021 06:54:41 -0800 (PST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 4DF9E92009C; Sat, 20 Feb 2021 15:54:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 4512392009B;
        Sat, 20 Feb 2021 15:54:40 +0100 (CET)
Date:   Sat, 20 Feb 2021 15:54:40 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     YunQiang Su <yunqiang.su@cipunited.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com,
        stable@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: use FR=0 for FPXX binary
In-Reply-To: <20210220081231.10648-1-yunqiang.su@cipunited.com>
Message-ID: <alpine.DEB.2.21.2102201515350.2021@angie.orcam.me.uk>
References: <20210220081231.10648-1-yunqiang.su@cipunited.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 20 Feb 2021, YunQiang Su wrote:

> some binary, for example the output of golang, may be mark as FPXX,
> while in fact they are still FP32.
> 
> Since FPXX binary can work with both FR=1 and FR=0, we force it to
> use FR=0 here.

 This defeats the purpose of FPXX of working with what hardware provides; 
R6 has the value of FR hardwired according to the FPU configuration[1][2].

> https://go-review.googlesource.com/c/go/+/239217
> https://go-review.googlesource.com/c/go/+/237058

 You need to fix the compiler.  In the interim you may be able to use 
`objcopy', `elfedit' or a similar tool to fix up the broken existing 
binaries if required.

 NB I suspect there is something wrong with the linker as well, because I 
would expect the FP mode of an input legacy object (that is one without 
GNU attributes or MIPS abiflags) to be interpreted according to the legacy 
ABI requirements, i.e. o32 => FR=0, n32/n64 => FR=1, and the output GNU 
attributes or MIPS abiflags set accordingly.  You need to investigate 
further what is going on here.

References:

[1] "MIPS Architecture For Programmers, Volume I-A: Introduction to the 
    MIPS64 Architecture", Imagination Technologies Ltd., Document Number: 
    MD00083, Revision 6.01, August 20, 2014, Table 6.4 "FPU Register 
    Models Availability and Compliance", p. 87

[2] "MIPSAR Architecture For Programmers Volume III: MIPS64 / microMIPS64
    Privileged Resource Architecture", Imagination Technologies Ltd., 
    Document Number: MD00091, Revision 6.03, December 22, 2015, Table 9.49 
    "Status Register Field Descriptions", p. 215

  Maciej
