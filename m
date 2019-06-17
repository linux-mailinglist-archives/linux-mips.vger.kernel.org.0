Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62C0B4843A
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jun 2019 15:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbfFQNjg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Jun 2019 09:39:36 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46441 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfFQNjg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Jun 2019 09:39:36 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so9306047ljg.13;
        Mon, 17 Jun 2019 06:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/Xn4FKi4pS79qTYkAlktf3pPwvzDG3mz0PV2qfVT1UY=;
        b=eBZB6KtttmzFZTlMq3EkCTrMo74VbkU5pNyW8dNcrLHpmS0YmwQ5LFUwHXwA8SRH2w
         E2DzGFBZYnXxKJwn7erVv2PPh8wV8tr7/f2YlPpsKykU4d0hG+ADAxQUoJw9Awf5snmZ
         VNmqk2QGf74TcM4ixOAYP/GvqNB3U/OREsdz7YQtN8DGPPX9ew+wbncV9ZEZ4XSN6TQs
         T4QnlHCRU+t1T3/i1OdwW+NBaaEhZ1CvSmuS5bMRlJMSphfU32V4hgxltB74Rh3sDaSm
         htkhx+zrbeJ+s1S8o0PAun2FduyVv30z0Zl0DKey107g9Q9K3QIEGjzgkajfeqdYJJDC
         rl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/Xn4FKi4pS79qTYkAlktf3pPwvzDG3mz0PV2qfVT1UY=;
        b=Mc//PHx/QX5sfP77HtMOk/BO0kaMe+4+n4nqns3Bd532OA5iPRDwnIE4ciR3dBbjUK
         ZsJwr+IjxJg+LfzaMBvV/SAX0/oV5OzOdWuF8Dw+DTtI51kZ735mPVNSgg2crJyA4Uki
         i0pkwFGuRNA7Qmj2eZeb+WStSmXGyeX0N9ZyeTQ4jCpE3qYSlDm9YYB1DtgQy6C3MUQE
         imY1BcccJLLC7D88ZUf0FyUi+Q2wiiQlEDA6l0PaBuP3VBBX8i1T3DZts4yat7PGCiGM
         J9rgtdfPsCV4+8JeoEOI48qgR/wi323LunjX+hHyUEUKTAkyWoDSYASp7EBVnEX2AA/p
         Fw3Q==
X-Gm-Message-State: APjAAAVOBCbyfE3HR38TZsppzwWjZrf2bpapbC18rssZv2rf2vE2XJB3
        yPztYNErD7ItJfC1oTlYK+s=
X-Google-Smtp-Source: APXvYqwxSyu4OoOIg30eHLgmXLwIL9t4T4vtBagbdbw7GaVTGLTC/ymqaQsTkNSB4NkRJO6t2GDUPg==
X-Received: by 2002:a2e:8846:: with SMTP id z6mr10684541ljj.20.1560778773687;
        Mon, 17 Jun 2019 06:39:33 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id t3sm1778357lfk.59.2019.06.17.06.39.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 06:39:32 -0700 (PDT)
Date:   Mon, 17 Jun 2019 16:39:30 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] mips: Print the kernel virtual mem layout on
 debugging
Message-ID: <20190617133929.uz7fweirm4a6oqnk@mobilestation>
References: <20190503175041.7949-1-fancer.lancer@gmail.com>
 <20190503175041.7949-4-fancer.lancer@gmail.com>
 <20190506191419.w3qtkgcjrjjuzwmu@pburton-laptop>
 <20190507223603.ewuye6lutbb5wz2l@mobilestation>
 <20190507224108.qhoxlyrdvgwayb4k@pburton-laptop>
 <20190507233849.7z6kqfxitlnp2qtk@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507233849.7z6kqfxitlnp2qtk@mobilestation>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Paul

On Wed, May 08, 2019 at 02:38:49AM +0300, Serge Semin wrote:
> On Tue, May 07, 2019 at 10:41:10PM +0000, Paul Burton wrote:
> > Hi Serge,
> > 
> > On Wed, May 08, 2019 at 01:36:07AM +0300, Serge Semin wrote:
> > > Thanks for the report regarding this issue. I actually thought I
> > > tested the patch being buildable for 64bit systems. It turns out I
> > > didn't.(
> > 
> > Easily done :)
> > 
> > > Should I resend the fixed patch as a separate v3 one In-Reply-to this
> > > v2 patch or resubmit the patchset with cover-letter and only the fixed
> > > patch being there?
> > 
> > Replying with just v3 of this patch will be fine, no need to resend the
> > cover letter.
> > 
> 
> Ok. I've just submitted the v3 version with fixed buildability problem.
> 
> > I currently plan to submit a pull request for mips-next as-is, without
> > this patch, in the next day or two. There are a few last minute
> > submissions this time round that I'll then queue up & send a second pull
> > request next week, which this can be part of.
> > 
> > Thanks,
> >     Paul
> 
> Regarding this patch being part of the mips mm init code. I've just found out
> that 32-bit arm subsystem maintainers removed the same functionality from the
> kernel 5.1. This also was removed from arm64 in kernel 4.15:
> commit 1c31d4e96b8c ("ARM: 8820/1: mm: Stop printing the virtual memory layout")
> commit 071929dbdd86 ("arm64: Stop printing the virtual memory layout")
> 
> Maintainer of m68k and unicore32 discarded the printing as well:
> commit 1476ea250cf0 ("unicore32: stop printing the virtual memory layout")
> commit 31833332f798 ("m68k/mm: Stop printing the virtual memory layout")
> 
> The reasoning of these removal was that since commit ad67b74d2469 ("printk:
> hash addresses printed with %p") the kernel virtual addresses weren't
> printed to the system log anyway. So instead of replacing the format string with
> "%px" they decided not to leak a virtual memory layout information and completely
> removed the printing. I don't really know why they didn't closed the printing for
> debug kernel only as we did, since the info might be useful in this case.
> 
> Since I see a tendency of this functionality removal, we might need to
> reconsider this patch integration into the MIPS arch code. What do you think?
> 
> Although some architectures still perform the virtual memory layout printing
> at boot-time: x86_32, parisc, xtensa, sh, nds32 (might be others).
> 
> Cheers,
> -Sergey

So any update on this patch status?

Regards,
-Sergey
