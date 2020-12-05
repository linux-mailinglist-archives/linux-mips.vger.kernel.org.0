Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB25B2CFBA5
	for <lists+linux-mips@lfdr.de>; Sat,  5 Dec 2020 16:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgLEO5x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Dec 2020 09:57:53 -0500
Received: from isilmar-4.linta.de ([136.243.71.142]:36790 "EHLO
        isilmar-4.linta.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgLEO5P (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Dec 2020 09:57:15 -0500
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from light.dominikbrodowski.net (brodo.linta [10.2.0.102])
        by isilmar-4.linta.de (Postfix) with ESMTPSA id 08A3D20110C;
        Sat,  5 Dec 2020 09:05:30 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
        id 58E7020EC8; Sat,  5 Dec 2020 09:56:14 +0100 (CET)
Date:   Sat, 5 Dec 2020 09:56:14 +0100
From:   Dominik Brodowski <linux@dominikbrodowski.net>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Yoichi Yuasa <yuasa@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH REPOST] pcmcia: Remove NEC VRC4173 CARDU
Message-ID: <X8tLLluXHhrI7SKT@light.dominikbrodowski.net>
References: <20201113213408.2244169-1-bigeasy@linutronix.de>
 <20201119170622.yan5bt2chxvoxqgn@linutronix.de>
 <20201204192009.46w4doqoqqvhgrnh@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201204192009.46w4doqoqqvhgrnh@linutronix.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Am Fri, Dec 04, 2020 at 08:20:09PM +0100 schrieb Sebastian Andrzej Siewior:
> On 2020-11-19 18:06:24 [+0100], To linux-kernel@vger.kernel.org wrote:
> > On 2020-11-13 22:34:08 [+0100], To linux-kernel@vger.kernel.org wrote:
> > > This driver is the very definition of bitrotting:
> > > - Introduced in commit
> > >   79a140932c776 ("[PATCH] mips: vR41xx updates")
> > >   which is 2.6.11-rc3.
> > > 
> > > - Provides ->register_callback which was removed in commit
> > >   7f316b033b36a ("[PATCH] pcmcia: remove socket register_callback")
> > >   which is v2.6.14-rc3
> > > 
> > > - Uses INIT_WORK() with three arguments which was removed in commit
> > >   65f27f38446e1 ("WorkStruct: Pass the work_struct pointer instead of context data")
> > >   which is v2.6.20-rc1
> > > 
> > > - Provides ->inquire_socket and uses socket_cap_t which was removed in
> > >   commit
> > >   b7949fdacbe00 ("[PCMCIA] Remove inquire_socket")
> > >   which is 2.5.72
> > > 
> > > - Provides ->get_io_map which was removed in commit
> > >   d7de1b64a23b9 ("[PCMCIA] pcmcia-2: Remove get_io_map and get_mem_map socket methods.")
> > >   which is 2.5.66
> > > 
> > > Remove VRC4173 CARDU from the tree because it never had the luck to be
> > > successfully compiled. Let it finally find peace in byte heaven.
> > …
> > > This is a repost of
> > > 	https://lkml.kernel.org/r/20201001193234.gi6fp4vk3dypwifv@linutronix.de
> > > 
> > > which was a repost of
> > > 	https://lkml.kernel.org/r/20200916081629.cfi6svr3yjvzimqs@linutronix.de
> > 
> > Andrew, are you okay with routing this via your tree?
> > Nobody responded to this and as I documented in the patch description it
> > never compiled so.
> 
> Andrew, any chance?

It's in pcmcia-next now.

Thanks,
	Dominik
