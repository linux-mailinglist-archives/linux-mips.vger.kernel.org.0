Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398FF1C860E
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 11:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgEGJsS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 05:48:18 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:33848 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgEGJsS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 05:48:18 -0400
Received: by mail-il1-f195.google.com with SMTP id w6so332221ilg.1
        for <linux-mips@vger.kernel.org>; Thu, 07 May 2020 02:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Youw7iSMbP9L05CcfWncOVsshX5qlrRR1BJSpni7dzk=;
        b=scDCSSBYcHIXL7DSgMKP25c/SmsbhpYws/2wMVu2n/0CCmkWZKy8FNQUfdpJsGQGlW
         12+rqpSWhicLZcN8plYB0iHD74UIuSStlOjQgwJ0xCdS1NqdcP2YpySC/TF2RE4oVweJ
         f216FsyA+PgLfs2iHZI3bUpvRVVpm8GAfQFXsFZ9DzuRAmL02pEOoDY3MEtCgi3OgHGn
         o8bhGwAo0hhyieu9Y0Zg1uvyXf2Qri780VpD1zS1cm0UVu4DB+sc/NAwI4qRQhwPhf63
         8oA2GddpymDOcZfbviqzuCFfSd1RrWidtm5CzPJfHpl2HTni3qvsSTfLYkTSnXWZDsUE
         MIpg==
X-Gm-Message-State: AGi0PuaR3evsT+S8uqC4op57kVFUHgSk0sudqLwhj2vXKkaMP0pgym+2
        C41cr/YNofb2XmWdki9e4dyuR5ipvcjV9VliATSiBYN4
X-Google-Smtp-Source: APiQypKqTaUN1qJqtnnZPhfiP5eDWgt2PpB6EqH7jUmMOonv62YS4QTLcL8DFCcKpeDMQTMO0Dc3pOyY+rx7mbclxeg=
X-Received: by 2002:a92:dc0d:: with SMTP id t13mr13824907iln.287.1588844897553;
 Thu, 07 May 2020 02:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <1588830863-30416-1-git-send-email-chenhc@lemote.com> <20200507083500.GA8887@alpha.franken.de>
In-Reply-To: <20200507083500.GA8887@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 7 May 2020 17:55:56 +0800
Message-ID: <CAAhV-H55qE0HFvDF7DgVr5ze6LRjBm5DBZyy9xCaDVcNdd1JXw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: asm: Use __ASSEMBLY__ to guard some macros to avoid
 build error
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Thu, May 7, 2020 at 4:39 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, May 07, 2020 at 01:54:23PM +0800, Huacai Chen wrote:
> > Use __ASSEMBLY__ to guard definitions of some macros (PANIC and PRINT)
> > to avoid build error:
> >
> > 1, PANIC conflicts with drivers/scsi/smartpqi/smartpqi_init.c
> > 2, PRINT conflicts with net/netfilter/nf_conntrack_h323_asn1.c and net/
> >    mac80211/debugfs_sta.c
>
> how about prefixing them to make them more unique ? Something like
> MIPS_ASM_PRINT/MIPS_ASM_PANIC ?
Thanks for your review, and I will send a new patch by renaming them.

Regards,
Huacai
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
