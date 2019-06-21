Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CECD44E58B
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 12:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfFUKJG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 06:09:06 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:56132 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbfFUKJG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 06:09:06 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994550AbfFUKJDD0AoN (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Fri, 21 Jun 2019 12:09:03 +0200
Date:   Fri, 21 Jun 2019 11:09:03 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Arnd Bergmann <arnd@arndb.de>
cc:     Paul Burton <paul.burton@mips.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mips: Remove q-accessors from non-64bit platforms
In-Reply-To: <CAK8P3a28Dp3UygNyomDPDxDmCmey37VS7TJkmDogaKUGZMF2mw@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.1906211048360.21654@eddie.linux-mips.org>
References: <20190614063341.1672-1-fancer.lancer@gmail.com> <20190620174002.tgayzon7dc5d57fh@pburton-laptop> <alpine.LFD.2.21.1906201851580.21654@eddie.linux-mips.org> <CAK8P3a28Dp3UygNyomDPDxDmCmey37VS7TJkmDogaKUGZMF2mw@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 21 Jun 2019, Arnd Bergmann wrote:

> >  The use of 64-bit operations to access option's packet memory, which is
> > true SRAM, i.e. no side effects, is to improve throughput only and there's
> > no need for atomicity here nor also any kind of barriers, except at the
> > conclusion.  Splitting 64-bit accesses into 32-bit halves in software
> > would not be a functional error here.
> 
> The other property of packet memory and similar things is that you
> basically want memcpy()-behavior with no byteswaps. This is one
> of the few cases in which __raw_readq() is actually the right accessor
> in (mostly) portable code.

 Correct, but we're missing an `__raw_readq_relaxed', etc. interface and 
having additional barriers applied on every access would hit performance 
very badly; in fact even the barriers `*_relaxed' accessors imply would 
best be removed in this use (which is why defza.c uses `readw_o' vs 
`readw_u', etc. internally), but after all the struggles over the years 
for weakly ordered internal APIs x86 people are so averse to I'm not sure 
if I want to start another one.  We can get away with `readq_relaxed' in 
this use though as all the systems this device can be used with are 
little-endian as is TURBOchannel, so no byte-swapping will ever actually 
occur.

  Maciej
