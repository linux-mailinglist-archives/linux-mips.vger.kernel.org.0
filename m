Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73ABA32E575
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 10:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhCEJ7D convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 5 Mar 2021 04:59:03 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:46426 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhCEJ6r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 04:58:47 -0500
Received: by mail-ot1-f45.google.com with SMTP id 97so1207262otf.13;
        Fri, 05 Mar 2021 01:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R5i2dBm+BmXx0zOtnYNpIiiYGVa8cfPeYYOxM3Bhgc8=;
        b=jIPXt8M+jwEIznOjYsQPcHgX4epieJsm78tBiFe3ay6HYwLmj3u1cx/inSf//3h+xL
         V97ifDkAsY7eZWdcL8/pSgmwLnTa26t/DU13oaIfy4zLpF2mhbadyjxUHg48NLcBxBAj
         sdKBEiyE3kF0GH0G2MSfIZb6tS7FN7KVHrBJdchUCof7POD25zZEo/yQ0ZVpW5kGkcd0
         oQ8Qv0HwXHoY6AqAkDnOO9p7mrY/hACfCWDOgwbgQhC/o7tCNTR1I8SGxNweP9NMWJGD
         uxxjhz+PcoQq2fs+VOCK685sUr108IZknDxtWPn2KazQsqk5lsUTQSs1n32rxVnSng7Z
         I9dA==
X-Gm-Message-State: AOAM531fBQWTfoTvGWXQMoAwdAV9zrsGZqVelsUtqxvfgp8lPvxJUf/u
        4WKbwDBqq4LohBPgQ6lyJtvaxUKHse+GBg66ImyEnGgiLKY=
X-Google-Smtp-Source: ABdhPJzwPtsLYtIP6dAdaGVP2YBvNsPfs93CzNuEs6RpXVPMIjL8krTF8NKiYukhbtatMpzBPhYIBevZGhpqBcMfimk=
X-Received: by 2002:a9d:4a8e:: with SMTP id i14mr7329466otf.37.1614938327207;
 Fri, 05 Mar 2021 01:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20210304072357.31108-1-zajec5@gmail.com> <20210305055501.13099-1-zajec5@gmail.com>
In-Reply-To: <20210305055501.13099-1-zajec5@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Fri, 5 Mar 2021 10:58:36 +0100
Message-ID: <CAAdtpL7iWiumiOwMOH1xiBZvyOB0HB7W-9MMHoPPxkb3Srme=w@mail.gmail.com>
Subject: Re: [PATCH V2 mips/linux.git] firmware: bcm47xx_nvram: refactor
 finding & reading NVRAM
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rafał,

On Fri, Mar 5, 2021 at 6:55 AM Rafał Miłecki <zajec5@gmail.com> wrote:
>
> From: Rafał Miłecki <rafal@milecki.pl>
>
> 1. Use meaningful variable names (e.g. "flash_start", "res_size" instead
>    of e.g. "iobase", "end")
> 2. Always operate on "offset" instead of mix of start, end, size, etc.

"instead of a mix"

> 3. Add helper checking for NVRAM to avoid duplicating code
> 4. Use "found" variable instead of goto
> 5. Use simpler checking of offsets and sizes (2 nested loops with
>    trivial check instead of extra function)

This could be a series of trivial patches, why did you choose to make a mixed
bag harder to review?

>
> This change has been tested on BCM4706. Updated code checks the same
> offsets as before. Driver still finds & copies NVRAM content.
>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Fix comment to match actual function name
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/firmware/broadcom/bcm47xx_nvram.c | 111 ++++++++++++----------
>  1 file changed, 63 insertions(+), 48 deletions(-)
