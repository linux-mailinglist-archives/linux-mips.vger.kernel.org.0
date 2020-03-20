Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C75DD18D81F
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2020 20:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgCTTJE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Mar 2020 15:09:04 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45076 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgCTTJD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Mar 2020 15:09:03 -0400
Received: by mail-qk1-f194.google.com with SMTP id c145so8031925qke.12
        for <linux-mips@vger.kernel.org>; Fri, 20 Mar 2020 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Coq8Ofu0U4DzajTyhT8NeznOYJKInngYKZ9RcK+J5Zc=;
        b=TgKMm5iUsoUUoejkZRb1Y2VzGYc8z9CnyuC9wQVsIy7WKcewVGEE8cg2tWoTWOZk+L
         bJlvH0s02E9ZSOIrQO4TRysFLjONSmPWmBhZ7d2lfxNIa5P/p0Wh76y1rw5cD/+qySCm
         H4Z1kvipxe9K75PM42OsCC0jvcXW7vXL9P8kzx8GGx0RuMO4raPgTcqbL4nlwT7j6Jx5
         pxxd/+AIlBLf1+OwW58e+vjPFmfBhvzFDKwZBtOYkbcDFzgcBSATzrSPN+MRCPoOCsRW
         aZjR05UMvHYtOK4pzcWdBm+pSJAXh9LMnIq43SeMHFZYwgxtB7pfnNktjB1/L4NxuHSK
         4hJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Coq8Ofu0U4DzajTyhT8NeznOYJKInngYKZ9RcK+J5Zc=;
        b=EsQBbs3e6+GHtI7z3Wnbe0IKbdLFrVyvyYpfJYgAQfPh3E2vt+jLkneAjQmPue2tqB
         JoUWkrF7L9/M5ovEZiPv37goUvqvYSKs5OwZdOhDI1rr6R2TVu7/PPws52BatyItn1tK
         DvUKP/97Z6Vi2jTxe8scF5GdVZC5lxz5b8jlzWtYdPepp0AXTiZGeAy67FJ4xvSRe9xE
         LziuENzIpcNM6PXBin/NhaZlPTwsywovSr6kZ9XUarSDfw+jJUyh4HSLrsc0V8NaIjKF
         iCoJB7DYk/VhoZow54jr4k3J0hOSAazv8TzDTpmXbWU9ZIovOv3/Ug0zinnsakzerXFD
         Ck0A==
X-Gm-Message-State: ANhLgQ1L1YfO07xVzBL28WfiBRtNlHT/V0oIL8kGtwzCgBdpKhJgmyR6
        xgNa3vxt6xhgIvrbCluCs+9YNZ1iQnyi/itTx9bFxA==
X-Google-Smtp-Source: ADFU+vsEZzYu5wnaJbVv/GC3QPoANu+VJJDOnYqV31V+/SH805yGhSM2xF7V5uzn5KioGNJTPk1CCK03/hFMfyEfwrs=
X-Received: by 2002:a05:620a:95b:: with SMTP id w27mr6169196qkw.238.1584731342710;
 Fri, 20 Mar 2020 12:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAF_dkJCQuF0MaYddfqVRJ-8tNPWVkR8Q0ZYz22DUi9moAWsxeQ@mail.gmail.com>
 <Pine.LNX.4.64.2003061230320.1467@Mobile0.Peter> <CAF_dkJDm=Kk6n-KqFZjabQ8GUY-axrhN4W2CBNmkzy++jBk2=A@mail.gmail.com>
 <alpine.LFD.2.21.2003201517230.2689954@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2003201517230.2689954@eddie.linux-mips.org>
From:   Patrick Doyle <wpdster@gmail.com>
Date:   Fri, 20 Mar 2020 15:08:36 -0400
Message-ID: <CAF_dkJDBtT=G+i9hPM81ik1zK2aiRbo3T4wT27zbubrunW7+og@mail.gmail.com>
Subject: Re: Address space in MIPS Linux kernel
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     post@pfrst.de, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 20, 2020 at 11:39 AM Maciej W. Rozycki <macro@linux-mips.org> wrote:
>  KSEG2 addresses are handed out with virtual allocations, typically
> `vmalloc' and friends (also used for mapping kernel modules), but also
> `ioremap' and friends if hardware constraints mandate it.  KSEG0 addresses
> are handed out with regular allocations made with `kmalloc' and friends,
> and also `ioremap' and friends where feasible.  Also addresses coming from
> the kernel executable and the stack will be in KSEG0.
>
>  This is for 32-bit MIPS/Linux configurations; 64-bit ones have additional
> segments, which will be used accordingly.
>
>  HTH,
>
>   Maciej
Thanks.  I tracked down the call to vmalloc.  I'm still have no clue
why we are triggering a kernel panic when/where we do, but it clearly
does not have anything to do with calling memmove() from KSEG2 space
to KSEG0 space, and I am now looking elsewhere (like what resources
may get allocated/locked on the way to that call to memmove() that
don't get freed/unlocked on the way back up, or what resources were
not locked that should have been).
--wpd
