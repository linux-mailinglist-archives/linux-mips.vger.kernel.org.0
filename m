Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE92123DC7A
	for <lists+linux-mips@lfdr.de>; Thu,  6 Aug 2020 18:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729649AbgHFQwh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Aug 2020 12:52:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:36755 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729642AbgHFQwc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 6 Aug 2020 12:52:32 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k3j81-0004MZ-00; Thu, 06 Aug 2020 18:52:29 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 70C2AC0C65; Thu,  6 Aug 2020 18:52:12 +0200 (CEST)
Date:   Thu, 6 Aug 2020 18:52:12 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Introduce cmdline argument writecombine=
Message-ID: <20200806165212.GA2754@alpha.franken.de>
References: <1596697741-3561-1-git-send-email-yangtiezhu@loongson.cn>
 <10e04885-b775-e7db-b927-6400382fd32d@flygoat.com>
 <cc0c8b89-748d-0d38-bcc8-1c2dbb0996bf@loongson.cn>
 <20200806101733.GA8136@alpha.franken.de>
 <9e563c75-ffaa-45b4-0e99-25a8b1eff828@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e563c75-ffaa-45b4-0e99-25a8b1eff828@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 06, 2020 at 07:56:20PM +0800, Jiaxun Yang wrote:
> Our current problem is Loongson's writecombine implementation seems buggy.
> This is our platform issue rather than target hardware issue.

ok, so simply clear cpu_data[0].writecombine for the fauly parts

> And we don't even know which hardware is known to be good. The same graphic
> card became a different story on different user's hand.

find out what is broken and add the needed workarounds then.

> I understood what Teizhu thought. For entry-level users, we don't want to
> trouble
> them, so we have writecombine disabled by default. However, for advanced
> user
> trying to tweak their system, we should leave a switch for them to get it
> back.

IMHO if we do it that way, we end up with millions of knobs for tweaking
broken hardware, and nobody knows what's exactly broken. Sorry I won't go
that way.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
