Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111AE301F09
	for <lists+linux-mips@lfdr.de>; Sun, 24 Jan 2021 23:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbhAXWEq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Jan 2021 17:04:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:39482 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbhAXWEq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Jan 2021 17:04:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l3nUK-0004ko-00; Sun, 24 Jan 2021 23:04:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4CFE3C0C0E; Sun, 24 Jan 2021 20:12:02 +0100 (CET)
Date:   Sun, 24 Jan 2021 20:12:02 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
        perex@perex.cz
Subject: Re: [PATCH 2/3 v7] sound: Add n64 driver
Message-ID: <20210124191202.GA21974@alpha.franken.de>
References: <20210115133500.c5affc0131313e1165acb2a1@gmx.com>
 <20210124094437.529881d014970d7f3909d76f@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124094437.529881d014970d7f3909d76f@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jan 24, 2021 at 09:44:37AM +0200, Lauri Kasanen wrote:
> On Fri, 15 Jan 2021 13:35:00 +0200
> Lauri Kasanen <cand@gmx.com> wrote:
> 
> > This adds support for the Nintendo 64 console's sound.
> >
> > Signed-off-by: Lauri Kasanen <cand@gmx.com>
> > ---
> >
> > v7:
> > use devm_*
> 
> Hi Thomas,
> 
> Since v6 had Takashi's ack, and you asked for the devm change, does
> this mean v7 is waiting for your review?

I'll apply it probably tomorrow, I just need to dig out the reviewed-by from
Takashi. 

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
