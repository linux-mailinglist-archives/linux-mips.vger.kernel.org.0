Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E52A5BC801
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2019 14:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440961AbfIXMkR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 24 Sep 2019 08:40:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53796 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2440960AbfIXMkR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Sep 2019 08:40:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 37ECA18C892F;
        Tue, 24 Sep 2019 12:40:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com [10.10.125.72])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E254960852;
        Tue, 24 Sep 2019 12:40:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wiC_B8R6th+83vKwGT1H-8vtFrmMg+1mK_P8n3VeWAWRg@mail.gmail.com>
References: <CAHk-=wiC_B8R6th+83vKwGT1H-8vtFrmMg+1mK_P8n3VeWAWRg@mail.gmail.com> <20190921231022.kawfomtmka737arq@pburton-laptop> <CAHk-=wjmJbF3p9vZTW2nbeD4LkG-JZV+uqv8BnxzojJ5SZsLjw@mail.gmail.com> <20190923180728.flp6jx4jc2bh7cys@pburton-laptop>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     dhowells@redhat.com, Paul Burton <paul.burton@mips.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips\@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [GIT PULL] MIPS changes
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Date:   Tue, 24 Sep 2019 13:40:15 +0100
Message-ID: <14580.1569328815@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Tue, 24 Sep 2019 12:40:17 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> In honesty, I actually do have one warning in my tree:
> 
>   samples/vfs/test-statx.c:24:15: warning: ‘struct foo’ declared
> inside parameter list will not be visible outside of this definition
> or declaration
>      24 | #define statx foo
>         |               ^~~

Were there any note lines from the compiler associated with this?  The warning
message can't actually be taking place on this line.

Another thing I'm wondering is why your compiler shows this warning - and mine
does not.  I've seen this before with uninitialised variables too where you
get a warning and I don't.

> but because it's in the sample code, it pretty much never gets rebuilt
> for me unless I basically do a "git clean" to get rid of everything,
> so I don't normally see it for any normal pull.
> 
> So I've ignored that one warning, although I've actually been tempted
> to just remove the sample because of it.
> 
> Adding David and Al to the cc just in case they have some simple fixup
> for it that is likely to work across different user headers.
> 
> I considered just adding a
> 
>      struct foo;
> 
> declaration, but the whole thing is incredibly ugly.

Yeah - I'm not sure the best way to deal with this.  The problem being that
userspace may have a conflicting definition - or no definition at all - and I
need to use the one from the kernel in preference as that may have changes in
it that aren't yet reflected in userspace.

I'd rather not remove the sample if I can avoid it as I use it occasionally,
but maybe I should switch to relying on glibc.

David
