Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726F830442D
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 18:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729638AbhAZGCJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Jan 2021 01:02:09 -0500
Received: from elvis.franken.de ([193.175.24.41]:35175 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728974AbhAYNjU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 Jan 2021 08:39:20 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l403i-0008Aa-02; Mon, 25 Jan 2021 12:29:26 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 875A7C090C; Mon, 25 Jan 2021 12:25:42 +0100 (CET)
Date:   Mon, 25 Jan 2021 12:25:42 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Lauri Kasanen <cand@gmx.com>, linux-mips@vger.kernel.org,
        perex@perex.cz
Subject: Re: [PATCH 2/3 v7] sound: Add n64 driver
Message-ID: <20210125112542.GC5436@alpha.franken.de>
References: <20210115133500.c5affc0131313e1165acb2a1@gmx.com>
 <20210124094437.529881d014970d7f3909d76f@gmx.com>
 <20210124191202.GA21974@alpha.franken.de>
 <s5hh7n55wnz.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hh7n55wnz.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 25, 2021 at 07:59:44AM +0100, Takashi Iwai wrote:
> On Sun, 24 Jan 2021 20:12:02 +0100,
> Thomas Bogendoerfer wrote:
> > 
> > On Sun, Jan 24, 2021 at 09:44:37AM +0200, Lauri Kasanen wrote:
> > > On Fri, 15 Jan 2021 13:35:00 +0200
> > > Lauri Kasanen <cand@gmx.com> wrote:
> > > 
> > > > This adds support for the Nintendo 64 console's sound.
> > > >
> > > > Signed-off-by: Lauri Kasanen <cand@gmx.com>
> > > > ---
> > > >
> > > > v7:
> > > > use devm_*
> > > 
> > > Hi Thomas,
> > > 
> > > Since v6 had Takashi's ack, and you asked for the devm change, does
> > > this mean v7 is waiting for your review?
> > 
> > I'll apply it probably tomorrow, I just need to dig out the reviewed-by from
> > Takashi. 
> 
> Feel free to take my ack:
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

Thank you, applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
