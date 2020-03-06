Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BFE117C0DE
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 15:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgCFOtu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 09:49:50 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:37285 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgCFOtu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 09:49:50 -0500
Received: by mail-qk1-f193.google.com with SMTP id y126so2518818qke.4
        for <linux-mips@vger.kernel.org>; Fri, 06 Mar 2020 06:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=B+DtfybZtzBvX/wSBkQ3pwj5wl5N3ahsmo8BZrm5qrQ=;
        b=foHX4tU0R/X9wtfDqDwi0LWckki2d5QiPuKILZnaCtVZNYzqjchAcmxNfhMR1ejnoA
         bttn1ZYooC1RI1yp5SBRwEP4H1PMZS2aAvK1fAzXYhWaFboutvD3y2hZl7nREp1chtZr
         /bviax0RFQl0MkgJMu1i2V0RpP3NnNPcHA8VBzDxlyrlSjwcUPiFmkkYvkdLzUPHtvZj
         F21kOzurjEoomqN+EveA5Qma3LEPv5mro8/2Us3tnwR7/ouQhdblAJ9XqtYXk+950uV8
         QH+JUlmN+mamWNs4+O8Bn0eKdMKLbssgSFXR9saYRvG+61Ti6dsbvrPannmehHdUdNYq
         9/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=B+DtfybZtzBvX/wSBkQ3pwj5wl5N3ahsmo8BZrm5qrQ=;
        b=olxfX9LAj3Yyz+LSinyTElr602g82ch5lWwsmnbkrltYqj2T0FA269DYl2YZTrOx/f
         GguvG5Gr+ZHAR7hbMp1SKHp7Dnk9I/9WYoTgmuupSUAN14r6LcQoLqYVLw5ZnAYZXs5x
         BgyZ8gu8BSnMQBrXpD3Ue4SPX6Mje4giDwQcVVRe9RGkYmmiBWPnO1YKEJRy4niwZPAB
         hiKnZTM8Vq9Bhoiw2o9z85NjDIyxORJ2AQsOpnDpTBowJUV+kyDsMKjqZQmThR8DBfDd
         ckH1ChKtEkt/zX/t/ym/o9B8dX+dsEiCS0bjZqf3JoPVZnROtJjpctnYP+8EI+wQWqk4
         J5GA==
X-Gm-Message-State: ANhLgQ0y85v8svE7YlXYT9k58WjFSQwkgdr+KW/paqXr1+j2M1eFEWCh
        deYoU+g870R0HK3dMbID3z5LYYfYVZDJD7twoYIshQ==
X-Google-Smtp-Source: ADFU+vvEZTS4Dp02hqmPVBcrI9KTA5svw75IaxPwnmc/wHeuuyjf9krqTyk0FJstX+x6ih4dB5nRDIFQqC6bGYcRETI=
X-Received: by 2002:a05:620a:350:: with SMTP id t16mr3238556qkm.238.1583506187482;
 Fri, 06 Mar 2020 06:49:47 -0800 (PST)
MIME-Version: 1.0
References: <CAF_dkJCQuF0MaYddfqVRJ-8tNPWVkR8Q0ZYz22DUi9moAWsxeQ@mail.gmail.com>
 <Pine.LNX.4.64.2003061230320.1467@Mobile0.Peter>
In-Reply-To: <Pine.LNX.4.64.2003061230320.1467@Mobile0.Peter>
From:   Patrick Doyle <wpdster@gmail.com>
Date:   Fri, 6 Mar 2020 09:51:15 -0500
Message-ID: <CAF_dkJDm=Kk6n-KqFZjabQ8GUY-axrhN4W2CBNmkzy++jBk2=A@mail.gmail.com>
Subject: Re: Address space in MIPS Linux kernel
To:     post@pfrst.de, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 6, 2020 at 6:25 AM <post@pfrst.de> wrote:
> Hi,
>
> Bit 31 being non-zero, these must be kernel-mode addresses anyway.
> 0xcXXXXXXX is in ksseg, TLB-mapped (only used to access "high-memory"
> outside the 0.5 GB unmapped kerenel-space, if at all)
> 0x8XXXXXXX is in kseg0, unmapped, cached (the usual kernel-address)
Hi Peter,
Thank you for your reply.  I managed to find my MIPS book finally, and read:

kuseg: 0x00000000-0x7FFFFFFF - User space mapped addresses
kseg0: 0x80000000-0x9FFFFFFF - Cached, "untranslated" address
kseg1: 0xA0000000-0xBFFFFFFF - Uncached, "untranslated" address
kseg2: 0xC0000000-0xFFFFFFFF - Kernel space mapped addresses (cached?)

So, I guess I'm wondering how the kernel ends up with some addresses
in kseg0 and some in kseg2.  Is there any significance to the fact
that one address is in kseg2 while the other is in kseg0.  I may be
chasing down a rabbit hole here, but, at this point, I don't know
what's causing my kernel panic, and I noticed something I didn't
understand (kseg2 vs kseg0), so I figured I would ask folks on this
list and learn something.  Maybe this will ultimately point me to the
source of my problem.  Maybe I will just learn something new.  Either
way, I win.

Thanks again for the reply.

--wpd
