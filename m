Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED1E1C3F2B
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 17:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbgEDP5P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 May 2020 11:57:15 -0400
Received: from elvis.franken.de ([193.175.24.41]:39442 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727929AbgEDP5P (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 May 2020 11:57:15 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jVdSx-0004JX-00; Mon, 04 May 2020 17:57:11 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8632DC036C; Mon,  4 May 2020 17:46:13 +0200 (CEST)
Date:   Mon, 4 May 2020 17:46:13 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jouni Hogander <jouni.hogander@unikie.com>,
        Kevin Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] MIPS: Truncate link address into 32bit for 32bit
 kernel
Message-ID: <20200504154613.GA14031@alpha.franken.de>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
 <20200422143258.1250960-1-jiaxun.yang@flygoat.com>
 <alpine.LFD.2.21.2004230036480.851719@eddie.linux-mips.org>
 <B307BFAC-9973-4444-B69A-40B054210E84@flygoat.com>
 <alpine.LFD.2.21.2004241316360.851719@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2004241316360.851719@eddie.linux-mips.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 24, 2020 at 01:22:30PM +0100, Maciej W. Rozycki wrote:
> On Thu, 23 Apr 2020, Jiaxun Yang wrote:
> 
> > > Alternatively, have you made any attempt to verify if actually replacing 
> > >the setting for VMLINUX_LOAD_ADDRESS would be safe?  Glancing over its use 
> > >there do not appear to be many places.
> > 
> > Limited experiments showed it should be fine...
> > 
> > But MIPS kernel has some design I'm not really familiar with like SYM32 for
> > 64-bit kernel and special address space design for Trap-and-emul KVM.
> 
>  This only affects CONFIG_32BIT kernels, so SYM32 does not apply; I can't 
> comment on KVM.  There's still that bunch of:
> 
> $(shell expr $(...) \< 0xffffffff80000000)
> 
> constructs I mentioned before, so let's leave your change as it stands at 
> this time.  Please do rename the variable as I suggested though, I hope 
> that's not a big deal.

Jiaxun, are you going to send an update with this change ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
