Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FAA25594B
	for <lists+linux-mips@lfdr.de>; Fri, 28 Aug 2020 13:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgH1LYW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Aug 2020 07:24:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:36780 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729226AbgH1LYE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 Aug 2020 07:24:04 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kBcKi-0000dc-00; Fri, 28 Aug 2020 13:14:12 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A1EB3C0E2C; Fri, 28 Aug 2020 13:12:57 +0200 (CEST)
Date:   Fri, 28 Aug 2020 13:12:57 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Message-ID: <20200828111257.GA2912@alpha.franken.de>
References: <106e65f5-d456-deaa-b47b-45b2a461b048@flygoat.com>
 <CAAhV-H7xJXX7V18ZUKw6RdEOtKUF49itrXY0PBNFAcSBbr4idQ@mail.gmail.com>
 <20200811120645.GA6199@alpha.franken.de>
 <CAAhV-H5YqF5dcdFiBgVSXzu67QOKTFq3FME8ernswGts45GHfQ@mail.gmail.com>
 <20200826124646.GA9809@alpha.franken.de>
 <CAAhV-H41-nyVPy1weKT_10A9_ATYB0pYq0_1jMm3Z3adv0Yutw@mail.gmail.com>
 <20200828084242.GA6817@alpha.franken.de>
 <CAAhV-H4_=zeYZ4HSnLmqSk_utNJ=daS_s+UQdvx7n=iEKVW2pQ@mail.gmail.com>
 <20200828093308.GA7888@alpha.franken.de>
 <CAAhV-H7ZrkLjpVSENR93XhA=YHROShavAhydPPdYeuGNBzOnyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H7ZrkLjpVSENR93XhA=YHROShavAhydPPdYeuGNBzOnyA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 28, 2020 at 05:52:05PM +0800, Huacai Chen wrote:
> Hi, Thomas,
> 
> On Fri, Aug 28, 2020 at 5:34 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> > if it is enabled at that point, it was already enabled in kernel.
> In kernel FPU may be enabled temporarily, and it seems a preemptible
> kernel may enable FPU for a new process (maybe I'm wrong, this is a
> bit complex).

no you are completly right. We need to clear CU1 in this place otherwise
a orphan cpu warning will trigger. It's enabled, if the current thread owns
it, but the newly created thread doesn't.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
