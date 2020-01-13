Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDC95139995
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 20:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgAMTI0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 14:08:26 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46143 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgAMTIZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jan 2020 14:08:25 -0500
Received: by mail-pf1-f195.google.com with SMTP id n9so5296625pff.13
        for <linux-mips@vger.kernel.org>; Mon, 13 Jan 2020 11:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ldUZY4To2ckhZn+bQWQ588/QrHXs65HSKir6c6XuBBA=;
        b=oeuqsP86poSkm/VMY4aKRfiqZ1DR6DGyt5rfCK/ZG6ErfHillYI3vis6k3+YoY9mg3
         Z4CO4oymvMwN79t41rB8CT5cgAq2ijAVihf6bpD3eqQZjnqnZNY7F9jo/XskbWhoycTf
         j+aML+0ah1Nktk43MlmQS0/6Pa9mgPF/drwQrYNk96Mq97tDsAEhQd4XtJhFG09wwluY
         NZnjcmJoNwSOVt0qEqgcOFGPP3oInKNhWM0VZJTG7gfkLQXnxqmlpKRZ+XKqtLGfxeoI
         iyZBd0LaIeC/zquqQctphMaiWZg4d0SCYM4OLdEary5raJwhbNyr5I7CSE9DgTPkK/7X
         mulw==
X-Gm-Message-State: APjAAAWdvfub8hezE2QjqanpC4E4Yk1VjMCVU+QyIBSaKhJV2LXESDa3
        uvY6oPL38GKbbYQ/SytEblw=
X-Google-Smtp-Source: APXvYqzqxixaPTl7Kqt1rz89sVHSZB1xzsH5hdDKeXkwnMOcJu2HUh1228p4aX90T+jRszK6PVb8cA==
X-Received: by 2002:a65:66ce:: with SMTP id c14mr23150635pgw.262.1578942504818;
        Mon, 13 Jan 2020 11:08:24 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id p16sm14209091pgi.50.2020.01.13.11.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 11:08:23 -0800 (PST)
Date:   Mon, 13 Jan 2020 11:08:23 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Jun Sun <jsun@junsun.net>
Cc:     qemu-discuss@nongnu.org, debian-mips@lists.debian.org,
        linux-mips@vger.kernel.org, lixing <13699171092@139.com>
Subject: Re: debian bootup hangs on qemu-system-mips64el
Message-ID: <20200113190823.xa36ojktxoudster@pburton-laptop>
References: <CAP5Nno5CPjV2mcf2ny8AtcC2ziqDkv6Kc7f4hCq1TF4DvKvJkw@mail.gmail.com>
 <CAP5Nno466s9M_7E0keMP3s=rDuZ48hrAb9-xAv52SsADr910XA@mail.gmail.com>
 <20200109212404.GA1750666@aurel32.net>
 <CAP5Nno4d4r+yaARLGYd==5wznOMXf1Ufc2P-DjsVc-FavxLvUw@mail.gmail.com>
 <20200112195752.GA18154@aurel32.net>
 <CAP5Nno5jXhgbryGqDX9j3TAUwXmsBnRnvNuh2MJpDHs-bSG1Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP5Nno5jXhgbryGqDX9j3TAUwXmsBnRnvNuh2MJpDHs-bSG1Cg@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jun Sun,

On Sun, Jan 12, 2020 at 06:14:12PM -0800, Jun Sun wrote:
> On Sun, Jan 12, 2020 at 11:58 AM Aurelien Jarno <aurelien@aurel32.net> wrote:
> > On 2020-01-12 11:34, Jun Sun wrote:
> > > Are you sure QEMU/MIPS does not support SMP?  Below link written in
> > > 2016 clearly shows something was working then.
> > >
> > > https://www.mips.com/blog/how-to-run-smp-linux-in-qemu-on-a-mips64-release-6-cpu/
> >
> > It's not supported for the malta/mips64r2 combination you are trying to
> > use. It's clearly possible that it is supported for mips64r6, but it's a
> > different instruction set, so you can't run a standard Debian
> > distribution on it.
> 
> How do I specify mips64r6 cpu to start qemu?  A simple cpu listing
> below shows no such CPU.  If mips64r6 is indeed supported with SMP, I
> would think mips64r2 userland should run fine.

I know that using QEMU's I6400 or I6500 CPU emulation works fine with
SMP as far as -smp 8. It emulates a single core system with up to 8 VPs
(hardware threads), and Linux works fine with it. I most often use the
Boston board emulation with a 64r6el_defconfig kernel for this, but it
ought to work for Malta too.

Both I6400 & I6500 are MIPS64r6 CPUs, so as Aurelien said you'd need to
ensure you're using a suitable MIPSr6 root filesystem.

If you wanted to run as I do it'd go something like this:

$ qemu-system-mips64el \
    -M boston \
    -cpu I6500 \
    -smp 8 \
    -kernel arch/mips/boot/vmlinux.gz.itb

Where that's run from the root of a kernel source tree within which
you've built a 64r6el_defconfig kernel.

Not sure what the behavior is with older CPUs; QEMU's CM & CPC emulation
is somewhat incomplete, and whilst I6400 & I6500 have a relatively
straightforward VP model older CPUs have the more complex MT ASE with
VPEs & TCs to worry about.

Thanks,
    Paul
