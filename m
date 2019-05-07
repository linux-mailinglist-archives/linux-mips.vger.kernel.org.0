Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2CC516DE3
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2019 01:38:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfEGXi4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 19:38:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33031 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfEGXi4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 May 2019 19:38:56 -0400
Received: by mail-lj1-f194.google.com with SMTP id f23so15873143ljc.0;
        Tue, 07 May 2019 16:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=II+4gzAJihRMJDh6Byq2OIHa9mrxjVHPUoEgsB8L9RY=;
        b=LiuMuRuj2mh0c6qNd/xMW6uxQUTI3RhDzHI/Kd+fX/P7w0ED4qer3hilFIGbQ1/McU
         58+dx6RcDyvrUyKfDmjLl592sayRoGskzXFfBuoY+5qcc8zbF98qDqJ8Z5kTzaQgTVS3
         IgRPoEDlrYKIAVyJdCWUuUCBwSn6Ik0vOEmKq/ZqqnSOaEzoGtw8Q4n5SckfTnKU/e0m
         3WlWzt5WtMVb6LZYnCw7IJL85TsRgDVHsoH7npw7JMv+zfOQ/IEr3kl0vIa7QgrBE9qP
         uw3eeFn4IpOtiVhGLrBlB8O0EbX6qy4mpq8h2kmBGvIlsuJOOX8M2JbyKAspCLtYD8zd
         gyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=II+4gzAJihRMJDh6Byq2OIHa9mrxjVHPUoEgsB8L9RY=;
        b=Q0wZDnvjDhzxunphzMrQRAIg2ds/KlnagwOp9oh57chHVn5DLF7Wi20cW/vMOw7crY
         OYqElfaFpXmk8bTWrGa+X4S9uhGqmCCjy5xoi3ZvQaV9Z2mgbLGiS6W0+FXLmGiDaMEG
         1i4BvUMrVMXpdHsAS5MXmyvraBKLT3hucL6LzYs6krTHNNfe1fU5JbqUIAsg4HdokOZk
         7fFPjEJCwRP00LMZYWfHcQq+u6ksPuT67PBmE6O+bucQ/9eXTnbzXVem6pwP9p/vFP+Z
         ADdRJAj9ocoK7eJRchorE3d3/IOlfI8xj4gBBRXCKYlPnDCdhZnswhzIdD0cR3fOXLEK
         8w7A==
X-Gm-Message-State: APjAAAUWnfxHE2ePL37xr3IZ0MPeoCUR04TgnYhFQVk1NE/18iHFbxvB
        Nlpcw7gNqSLolV4Ah/E7b9E=
X-Google-Smtp-Source: APXvYqz/opchG2/atkIjzV6HFw7ac6l8mGzC9r5VuPYnU2lbQTlnGnFQU3gPS7iwZz1tEWJrkV0riQ==
X-Received: by 2002:a2e:a308:: with SMTP id l8mr14159268lje.130.1557272333841;
        Tue, 07 May 2019 16:38:53 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id k10sm3428938ljh.86.2019.05.07.16.38.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 07 May 2019 16:38:53 -0700 (PDT)
Date:   Wed, 8 May 2019 02:38:51 +0300
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
Message-ID: <20190507233849.7z6kqfxitlnp2qtk@mobilestation>
References: <20190503175041.7949-1-fancer.lancer@gmail.com>
 <20190503175041.7949-4-fancer.lancer@gmail.com>
 <20190506191419.w3qtkgcjrjjuzwmu@pburton-laptop>
 <20190507223603.ewuye6lutbb5wz2l@mobilestation>
 <20190507224108.qhoxlyrdvgwayb4k@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507224108.qhoxlyrdvgwayb4k@pburton-laptop>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 07, 2019 at 10:41:10PM +0000, Paul Burton wrote:
> Hi Serge,
> 
> On Wed, May 08, 2019 at 01:36:07AM +0300, Serge Semin wrote:
> > Thanks for the report regarding this issue. I actually thought I
> > tested the patch being buildable for 64bit systems. It turns out I
> > didn't.(
> 
> Easily done :)
> 
> > Should I resend the fixed patch as a separate v3 one In-Reply-to this
> > v2 patch or resubmit the patchset with cover-letter and only the fixed
> > patch being there?
> 
> Replying with just v3 of this patch will be fine, no need to resend the
> cover letter.
> 

Ok. I've just submitted the v3 version with fixed buildability problem.

> I currently plan to submit a pull request for mips-next as-is, without
> this patch, in the next day or two. There are a few last minute
> submissions this time round that I'll then queue up & send a second pull
> request next week, which this can be part of.
> 
> Thanks,
>     Paul

Regarding this patch being part of the mips mm init code. I've just found out
that 32-bit arm subsystem maintainers removed the same functionality from the
kernel 5.1. This also was removed from arm64 in kernel 4.15:
commit 1c31d4e96b8c ("ARM: 8820/1: mm: Stop printing the virtual memory layout")
commit 071929dbdd86 ("arm64: Stop printing the virtual memory layout")

Maintainer of m68k and unicore32 discarded the printing as well:
commit 1476ea250cf0 ("unicore32: stop printing the virtual memory layout")
commit 31833332f798 ("m68k/mm: Stop printing the virtual memory layout")

The reasoning of these removal was that since commit ad67b74d2469 ("printk:
hash addresses printed with %p") the kernel virtual addresses weren't
printed to the system log anyway. So instead of replacing the format string with
"%px" they decided not to leak a virtual memory layout information and completely
removed the printing. I don't really know why they didn't closed the printing for
debug kernel only as we did, since the info might be useful in this case.

Since I see a tendency of this functionality removal, we might need to
reconsider this patch integration into the MIPS arch code. What do you think?

Although some architectures still perform the virtual memory layout printing
at boot-time: x86_32, parisc, xtensa, sh, nds32 (might be others).

Cheers,
-Sergey
