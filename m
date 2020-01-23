Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0155F145FDA
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2020 01:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgAWAXF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 19:23:05 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:34379 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgAWAXF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jan 2020 19:23:05 -0500
Received: by mail-il1-f193.google.com with SMTP id l4so397714ilj.1;
        Wed, 22 Jan 2020 16:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/fehjbHt+IVYClv5muhqeCjgs2EeR5SVRn+obSNfCt0=;
        b=kjHjZRwlmqsxGGeNme0AOQ0/17n+IzG2BfEqoxcuHH47HwtrifYlg3fL8BtTwNe49C
         VVeOdZNQvaBs9Mvl4BK4wVPCJSG5MrFiD0Wlkby2JA3F6k97alePmybytiMp53g8+l1X
         JR7vO4W0TfKZztUCOqW3/9Wfxz7YzXrvqjnYyxEG379brOXfc518/bTcpu800cTBnR7s
         Q8NcggkdgiKjd3SlsAvZRb1tH9sADpN9hBxhZwCGskGplo5DZrueuyTir3ifatxgT8EI
         TX7FOeRR6MKq4AL2eWlCSDMxy7ZcXvSSSXpEv09/pSnOUYf13up8OZVb6AUokq2oU7Fg
         MLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/fehjbHt+IVYClv5muhqeCjgs2EeR5SVRn+obSNfCt0=;
        b=f+Y4a6qiRnZPSUDWTsuAVLuQM39AtsqEhSXcSrU2tQUvArcnUcZe3tYunSsxBJQOwA
         5opuiOSic5mhyAfTUGxqADtt/WPduJy+0fGtoutJ1CNzwWQ7bHA1L67J3NmcGrRgbv82
         C1MRP99LDJGGOn++UMSOL5sydfChRsiGTcJ/xWE7pI4hMTQn56pru31uX96Q9f6FV4SA
         WdwU08RjPu+vdt10LuVXLlqA0SPKTZ62PX80HmNENNubj+PakG4G6o2tDy6aa+R1HuNW
         2UBynq1HzDw0eDsl1jFt3Fxqezaqrenfx3Y5+Ixyr6ssvxRT8emSttpFny8+6pAUOU8O
         fxzw==
X-Gm-Message-State: APjAAAWwOmYSudVemTc+cDx5jqTpdJY1r6n8mZAtWI1tVKRcz30uvUDE
        q6lES08PngE6eyjDZzT9xKsdq6PPX1vXtQIwpplE3Q==
X-Google-Smtp-Source: APXvYqx7BXEqrkv5mOf8hdouXZDby5H+Q7RqaEErooN339jI9cftxrvDU69nbSqALoMbZsDe3TK8KYsjYkdUq5i8I3Y=
X-Received: by 2002:a92:3d17:: with SMTP id k23mr10409682ila.110.1579738984350;
 Wed, 22 Jan 2020 16:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20190330081836.26942-1-biergaizi2009@gmail.com> <20190330081836.26942-2-biergaizi2009@gmail.com>
In-Reply-To: <20190330081836.26942-2-biergaizi2009@gmail.com>
From:   Matt Turner <mattst88@gmail.com>
Date:   Wed, 22 Jan 2020 16:22:53 -0800
Message-ID: <CAEdQ38H-qRwcbcDVD_pEv9pGL33h=51kV3GYO87zSe9keZwT7A@mail.gmail.com>
Subject: Re: [PATCH 1/1] mfd: yeeloong_kb3310b: support KB3310B EC for Lemote
 Yeeloong laptops.
To:     Tom Li <biergaizi2009@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-mips@vger.kernel.org,
        Paul Burton <paul.burton@mips.com>,
        LKML <linux-kernel@vger.kernel.org>, Yifeng Li <tomli@tomli.me>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 30, 2019 at 1:19 AM Tom Li <biergaizi2009@gmail.com> wrote:
>
> From: Yifeng Li <tomli@tomli.me>
>
> Lemote Yeeloong is a laptop powered by Loongson 2F MIPS processor,
> primarily a demo platform for hobbyists and developers. It uses an
> ENE KB3310B Embedded Controller with customized firmware to implement
> hardware and power management.
>
> A monolithic platform driver code for those functionality has existed
> out-of-tree for many years. This commit creates a MFD driver for the EC
> chip on Yeeloong laptop to isolate EC-related code from core MIPS code,
> and serves as the foundation of various subdrivers.
>
> NOTE: A regmap could be the reasonable abstraction for I/O, but (1)
> it requires some additional refactoring to convert the shutdown/wakeup
> routines in board files to subdrivers, and (2) we're only using simple
> reads/writes, repmap only adds boilerplates to the existing files without
> additional benefits. We simply export the EC-related functions for now,
> until we come back to refactor the board files.
>
> Signed-off-by: Yifeng Li <tomli@tomli.me>

Did you give up on upstreaming this code? That would be a shame, and
somewhat ironic given that you were frustrated about lack of review,
etc, and then never responded to the review given :(
