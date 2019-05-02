Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54417124F4
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 01:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfEBXPr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 19:15:47 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50848 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfEBXPr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 May 2019 19:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=x1JkGI4CQYrmvxuM8WIiLxnMqgmcALyQZwo7P71BME0=; b=aMGrAGbRVDdw1l/sw+gckS+sI
        yDZRI+3C+9JVbYF5x2TNO2v6ZU46vYBCxSlqgSFAyRpfREdxjyopf5mVIOuO+jPgRBsXJd2WNYSnF
        /I8A7c2f4ZPKJ2BAsrHVAa3XgZa1Qf5UknK5MzQ/VET/Ij0UeqKBGlYDO7wlzooU0qq4VGVtOuSH8
        FfL6+e4qqO0V8zFTtborrXEeCSKP8gI1CQxx/4VKLrA/KtJTKs3viL4v8Jq+vuEbUwPtPTqSnacch
        i7OH8Qeq65dZyi5x87J8wju+DihRuYLLXhCq55dy1ya/+objw3Kmmh7K6U5nQGlGqynqD2RbtFQiK
        OqNefzOAw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hMKvW-0006KY-Ob; Thu, 02 May 2019 23:15:42 +0000
Date:   Thu, 2 May 2019 16:15:42 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Hillf Danton <dhillf@gmail.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        Paul Mundt <lethal@linux-sh.org>, Stas Sergeev <stsp@list.ru>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Nitin Gupta <nitin.m.gupta@oracle.com>,
        sparclinux@vger.kernel.org
Subject: Re: Linux 5.1-rc5
Message-ID: <20190502231542.GA9336@infradead.org>
References: <CAHk-=wjvcuyCQGnfOhooaL1H4H63qXO=xgo+9yncSOG=eK+kbA@mail.gmail.com>
 <20190415051919.GA31481@infradead.org>
 <CAHk-=wj7jgMOVFW0tiU-X+zhg6+Rn7mEBTej+f26rV3zXezOSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj7jgMOVFW0tiU-X+zhg6+Rn7mEBTej+f26rV3zXezOSA@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 15, 2019 at 09:17:10AM -0700, Linus Torvalds wrote:
> I ruthlessly also entirely ignored MIPS, SH and sparc, since they seem
> largely irrelevant, partly since even theoretically this whole issue
> needs a _lot_ of memory.

Adding the relevant people - while the might be irrelevant, at least
mips and sparc have some giant memory systems.  And I'd really like
to see the arch-specific GUP implementations to go away for other
reasons, as we have a few issues to sort out with GUP usage now
(we just had discussions at LSF/MM), and the less implementations we
have to deal with the better.
