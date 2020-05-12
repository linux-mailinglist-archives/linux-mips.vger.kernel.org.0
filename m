Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929A71CEEC3
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 10:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbgELIFW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 04:05:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:49606 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727783AbgELIFW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 12 May 2020 04:05:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jYPuh-0007gk-00; Tue, 12 May 2020 10:05:19 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B6A7BC0479; Tue, 12 May 2020 10:05:09 +0200 (CEST)
Date:   Tue, 12 May 2020 10:05:09 +0200
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
Message-ID: <20200512080509.GA9433@alpha.franken.de>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428221419.2530697-1-natechancellor@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 28, 2020 at 03:14:14PM -0700, Nathan Chancellor wrote:
> [..]
> Please let me know if there are any issues!

I found no issues in my tests. Is this the final state ? If yes, I'm
going to apply it to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
