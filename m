Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0F219650E
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2020 11:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgC1KaY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Mar 2020 06:30:24 -0400
Received: from elvis.franken.de ([193.175.24.41]:40596 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgC1KaY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 28 Mar 2020 06:30:24 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jI8jO-0001Lc-00; Sat, 28 Mar 2020 11:30:22 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E8FA0C0D4C; Sat, 28 Mar 2020 11:30:12 +0100 (CET)
Date:   Sat, 28 Mar 2020 11:30:12 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
        linux-mips@vger.kernel.org
Subject: Re: MIPS: ralink: mt7621: introduce 'soc_device' initialization,
 compile issue
Message-ID: <20200328103012.GA4603@alpha.franken.de>
References: <20200327152624.Horde.4Z2ZjKkOtsKUryuWp4S7pe-@www.vdorst.com>
 <CAMhs-H9BPx=v=BfnCaCOWtQ9-isGerY=vVNwA-OcBRxo3ie6gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H9BPx=v=BfnCaCOWtQ9-isGerY=vVNwA-OcBRxo3ie6gg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 28, 2020 at 07:49:25AM +0100, Sergio Paracuellos wrote:
> No it compiles clean for me with the last linux-next. The function
> 'soc_device_register' is implemented in drivers/base/soc.c which is
> included for compilation with
> CONFIG_SOC_BUS. Looks like kernel is not compiling soc.c for any reason.

tom me it looks like you never tested, that your patch works.
With SMP selected the new code doesn't even get compiled in.
With a UP config, Rene's link error shows up.

I've sent a patch fixing this.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
