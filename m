Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF46632F905
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 09:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbhCFIqA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 03:46:00 -0500
Received: from elvis.franken.de ([193.175.24.41]:48168 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229617AbhCFIpn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 6 Mar 2021 03:45:43 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lISZA-00059N-00; Sat, 06 Mar 2021 09:45:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 45210C112A; Sat,  6 Mar 2021 09:45:13 +0100 (CET)
Date:   Sat, 6 Mar 2021 09:45:13 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: boot/compressed: Copy DTB to aligned address
Message-ID: <20210306084513.GA5453@alpha.franken.de>
References: <20210303193305.924384-1-paul@crapouillou.net>
 <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 03, 2021 at 02:37:55PM -0600, Rob Herring wrote:
> On Wed, Mar 3, 2021 at 1:33 PM Paul Cercueil <paul@crapouillou.net> wrote:
> >
> > Since 5.12-rc1, the Device Tree blob must now be properly aligned.
> 
> I had checked the other built-in cases as microblaze broke too, but
> missed some of the many ways MIPS can have a dtb. Appended and
> built-in DTBs were supposed to be temporary. :(

and a fdt can also be provided by firmware. And according to spec
there is no aligmnet requirement. So this whole change will break
then. What was the reason for the whole churn ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
