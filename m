Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5681D1124
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 13:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732676AbgEMLVW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 07:21:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:51993 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732803AbgEMLVV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 07:21:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jYpRu-000588-00; Wed, 13 May 2020 13:21:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C38E9C047A; Wed, 13 May 2020 13:18:06 +0200 (CEST)
Date:   Wed, 13 May 2020 13:18:06 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v5 0/5] Allow ld.lld to link the MIPS VDSO
Message-ID: <20200513111806.GA7151@alpha.franken.de>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
 <20200512080509.GA9433@alpha.franken.de>
 <20200512082843.GA3815743@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512082843.GA3815743@ubuntu-s3-xlarge-x86>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 12, 2020 at 01:28:43AM -0700, Nathan Chancellor wrote:
> On Tue, May 12, 2020 at 10:05:09AM +0200, Thomas Bogendoerfer wrote:
> > On Tue, Apr 28, 2020 at 03:14:14PM -0700, Nathan Chancellor wrote:
> > > [..]
> > > Please let me know if there are any issues!
> > 
> > I found no issues in my tests. Is this the final state ? If yes, I'm
> > going to apply it to mips-next.
> > 
> > Thomas.
> > 
> > -- 
> > Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> > good idea.                                                [ RFC1925, 2.3 ]
> 
> Maciej seemed to have some issue with the way I worded the commit
> message of patch 4 but I have not heard anything back about my
> suggestion and Fangrui commented that --eh-frame-hdr might not be
> necessary but if everything works fine for you with this version, I
> am not inclined to touch it.
> 
> If you feel this is good to go, I am happy to let it go in. Thanks for
> accepting it!

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
