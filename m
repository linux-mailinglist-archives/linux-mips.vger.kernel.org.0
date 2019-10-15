Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 768B4D7F62
	for <lists+linux-mips@lfdr.de>; Tue, 15 Oct 2019 20:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfJOSxR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Oct 2019 14:53:17 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35843 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfJOSxQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Oct 2019 14:53:16 -0400
Received: by mail-pg1-f196.google.com with SMTP id 23so12691483pgk.3;
        Tue, 15 Oct 2019 11:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gxBrl95Ves/UBT7JJY5pCxPb14GQ2WnyWP0Eh+ZW0mE=;
        b=Bwp3mTn+ndpwnB5ppMeUJ3lxxt82iv/LnzNza53HhABvrWVvh/hbteZDEpq++KdV5U
         1k3TKm1SuR7oG/g96k7VGJA5M9Waearj2E6bEJcYGVfFl2e4hlGAzm+Y/ooj34f3OThg
         nBkZutOtVBo7cVOuc4T63WWDEdPMHoJ4N8NkRN9ITJ6BkM4k4yxYAnI3EDp3bjFkY62C
         Ncu9+lGyPQobbIQMcvuIBisSRPO0ZHmEQl9J6iKHEqRj98SXJTU1yGDj/ZfzQNOxVsJ3
         BLOTH1EtTt1v+MXgM8sHrFacYJphxTjBP3tcoRX1hlzHKtUIAaDrd9ePbdKGN37lFpKD
         2H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gxBrl95Ves/UBT7JJY5pCxPb14GQ2WnyWP0Eh+ZW0mE=;
        b=nr2wfxtsjaiLnNihe576XstNxh2qqP3dAxJbsX1Hh0FNNDL3Or5ZsInm1bDnQzn6j1
         cXmWJZ2VZzHhcXMsACoH8t7SIa53cETtW87KBJnTUAIxi8/1QRgvnIYMVih3BKMCYGqt
         L/eoIifN7iwOnnjxwjjD5RFzlqcfzxBJ1tX0XhAxqjFSl+gKLvL33YNs1RVmd0GcVHmj
         Bar5GhnHOjRHE9ACFgJtkcqLIo89reNL9bTJlRxOft8ZXK6tCqK+0gac/W3FDwtrXhIU
         ZFC2Iabk/64QR3rHagYc8jir36NbbipeHQBGqdCIoSUxxujwC7vmMuS0kGKt7uG0ZB4W
         /Ueg==
X-Gm-Message-State: APjAAAWRc1+VXlrw1Ckrl+CJ/4QFynUCzW+rXZNrCPpaGxymTMPokPgd
        VHdQElLEq64aZRSPS+E4TcI=
X-Google-Smtp-Source: APXvYqzo5Gt/uMiVHyuN51jLi1A+BXy2FzWuZi6h/ALjPtXdFXuXFwsUsgP7pX292M0jSGuM4GbsTQ==
X-Received: by 2002:a17:90a:8c02:: with SMTP id a2mr9570pjo.79.1571165593864;
        Tue, 15 Oct 2019 11:53:13 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id 19sm51467pjd.23.2019.10.15.11.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 11:53:13 -0700 (PDT)
From:   Paul Burton <paulburton89@gmail.com>
X-Google-Original-From: Paul Burton <paul.burton@mips.com>
Date:   Tue, 15 Oct 2019 11:53:21 -0700
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Loongson: Make default kernel log buffer size as
 128KB for Loongson3
Message-ID: <20191015184745.xxihqrcaezbazzgm@lantea.localdomain>
References: <1571101656-871-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H573fv+NVqBRgU38BRDDX=syj3gUqnJqRp4CdBx+QcdpQ@mail.gmail.com>
 <d897527b-3c36-41a8-b878-64a099cbdfa0@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d897527b-3c36-41a8-b878-64a099cbdfa0@loongson.cn>
X-Mutt-References: <d897527b-3c36-41a8-b878-64a099cbdfa0@loongson.cn>
X-Mutt-Fcc: ~/sent
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Tiezhu & Huacai,

On Tue, Oct 15, 2019 at 12:00:25PM +0800, Tiezhu Yang wrote:
> On 10/15/2019 11:36 AM, Huacai Chen wrote:
> > On Tue, Oct 15, 2019 at 10:12 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> > > When I update kernel with loongson3_defconfig based on the Loongson 3A3000
> > > platform, then using dmesg command to show kernel ring buffer, the initial
> > > kernel messages have disappeared due to the log buffer is too small, it is
> > > better to change the default kernel log buffer size from 16KB to 128KB.
> > > 
> > > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > > ---
> > >   arch/mips/configs/loongson3_defconfig | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
> > > index 90ee008..3aa2201 100644
> > > --- a/arch/mips/configs/loongson3_defconfig
> > > +++ b/arch/mips/configs/loongson3_defconfig
> > > @@ -12,7 +12,7 @@ CONFIG_TASKSTATS=y
> > >   CONFIG_TASK_DELAY_ACCT=y
> > >   CONFIG_TASK_XACCT=y
> > >   CONFIG_TASK_IO_ACCOUNTING=y
> > > -CONFIG_LOG_BUF_SHIFT=14
> > > +CONFIG_LOG_BUF_SHIFT=17
> > Hi, Tiezhu,
> > 
> > Why you choose 128KB but not 64KB or 256KB? I found 64KB is enough for
> > our cases. And if you really need more, I think 256KB could be better
> > because there are many platforms choose 256KB.
> 
> Hi Huacai,
> 
> Thanks for your reply and suggestion, I will send a v2 patch.

Thanks for the patches.

I actually have a slight preference for 128KB if you've no specific
need, since 128KB is the default. Some quick grepping says that of 405
defconfigs in tree (as of v5.4-rc3), we have:

  LOG_BUF_SHIFT  Count
             12  1
	     13  3
	     14  235
	     15  18
	     16  39
	     17  90
	     18  13
	     19  2
	     20  4

ie. 16KiB is by far the most common, then second most common is the
default 128KiB. 256KiB is comparatively rare.

However, I don't think your v1 patch is quite right Tiezhu - since 17 is
the default it shouldn't be specified in the defconfig at all. Did you
manually make the change in the loongson3_defconfig file? If so please
take a look at the savedefconfig make target & try something like this:

  make ARCH=mips loongson3_defconfig
  make ARCH=mips menuconfig
  # Change LOG_BUF_SHIFT
  make ARCH=mips savedefconfig
  mv defconfig arch/mips/configs/loongson3_defconfig
  git add -i arch/mips/configs/loongson3_defconfig
  # Stage the relevant changes, drop the others

You should end up with the CONFIG_LOG_BUF_SHIFT line just getting
deleted.

If on the other hand you really do prefer 256KiB for these systems
please describe why in the commit message. It could be something as
simple as "we have lots of memory so using 256KiB isn't a big deal, and
gives us a better chance of preserving boot messages until they're
examined". But if your log is getting this big before you look at it (or
before something like systemd copies it into its journal), there's
probably something fishy going on.

Thanks,
    Paul
