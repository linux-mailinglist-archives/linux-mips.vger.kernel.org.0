Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF5922246D
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 15:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgGPN4Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 09:56:24 -0400
Received: from elvis.franken.de ([193.175.24.41]:38517 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728087AbgGPN4Y (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 09:56:24 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jw4N4-0001gW-00; Thu, 16 Jul 2020 15:56:22 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B06E7C0815; Thu, 16 Jul 2020 15:56:05 +0200 (CEST)
Date:   Thu, 16 Jul 2020 15:56:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "paulburton@kernel.org" <paulburton@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Replace HTTP links with HTTPS ones
Message-ID: <20200716135605.GA15355@alpha.franken.de>
References: <20200713085243.32566-1-grandmaster@al2klimov.de>
 <59938583-2ce4-c7bf-c454-89a1559be846@flygoat.com>
 <CAHiYmc7ax=A=Tb59wh4+yHx=2MEKc3G==tun5nsefbKvsceBHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHiYmc7ax=A=Tb59wh4+yHx=2MEKc3G==tun5nsefbKvsceBHg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 15, 2020 at 12:07:55PM +0200, Aleksandar Markovic wrote:
> On Tuesday, July 14, 2020, Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> > 在 2020/7/13 16:52, Alexander A. Klimov 写道:
> >>           virtual processors which supports SMP. This is equivalent to the
> >>           Intel Hyperthreading feature. For further information go to
> >> -         <http://www.imgtec.com/mips/mips-multithreading.asp>.
> >> +         <https://www.imgtec.com/mips/mips-multithreading.asp>.
> >>
> >
> > All MIPS content have been removed from IMGTEC's site, we'd better remove
> > this link?
> >
> >
> Perhaps it is better to replace it with:
> 
> https://www.mips.com/products/architectures/ase/multi-threading/
> 
> ?

yes, looks better.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
