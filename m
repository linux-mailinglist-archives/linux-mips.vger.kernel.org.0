Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96E4B129BCE
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2019 00:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfLWX1m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Dec 2019 18:27:42 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43773 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbfLWX1m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Dec 2019 18:27:42 -0500
Received: by mail-pf1-f193.google.com with SMTP id x6so8785455pfo.10;
        Mon, 23 Dec 2019 15:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=C9C43i064jE8DQuh0depOW1E1odJCjHM5eu4z4wzqqI=;
        b=kRCbVR2h01Qrp6LAK0ggQk1RyOT9n46FSszleDI2rv797Aya2G5hNTIxdiLQoZ4ZTC
         PwdlSVjNZYOkXgPjEHt1gM4/x1sPsxxrFm0fQQFBOhH7XnF6WaDYRqFY9YgTdW4oDBI1
         MSrs6JsJVZCt9IsvZVSO2dLEEDjTZyFx/HbrX+69fxfz4Z12bPWRlDCRKrb50AcZBabu
         9+C9SwS6v5mBTYsVThVHC7JN1ZVCv4jlrwBnZk0gfKCJQjae1K3uyJL9zNsGUxvOVQI5
         djuk3dByBThIMCNVKTzvDYYuQ1qg1aYFtXU8LkwoY2pG96NjUURqhfvmNqNuJtmg/zzV
         /OLg==
X-Gm-Message-State: APjAAAUtwrnKM5WPlH2a78WuC6HPgWZadxgB3sqQkakhm9Y+HNcOy8xH
        2Va9QACZ1HimxbzAFYgaCj48KesA
X-Google-Smtp-Source: APXvYqwbtqLliLNQvBcnQUMGQEGz3U/peJ5o0cMIFDcBYdUhkpwO/bDl+9w1vVlzVn8Qf1jqUE2mmw==
X-Received: by 2002:aa7:9ec9:: with SMTP id r9mr34763625pfq.85.1577143661726;
        Mon, 23 Dec 2019 15:27:41 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id 13sm25326945pfi.78.2019.12.23.15.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2019 15:27:41 -0800 (PST)
Date:   Mon, 23 Dec 2019 15:29:45 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de, Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: vdso-related userspace crashes on 5.5 mips64
Message-ID: <20191223232945.a3sbzfj6uw2sokba@lantea.localdomain>
References: <20191223130834.GA102399@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191223130834.GA102399@zx2c4.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jason,

Copying Vincenzo.

On Mon, Dec 23, 2019 at 02:08:34PM +0100, Jason A. Donenfeld wrote:
> I'm experiencing VDSO-related crashes on 5.5 with MIPS64. The MIPS64
> builders on build.wireguard.com are all red at the moment.
> 
> It looks like libc is crashing with a null pointer dereference when
> doing any work after returning from clock_gettime. This manifests
> itself, for me, with calls to clock_gettime(CLOCK_PROCESS_CPUTIME_ID),
> because CLOCK_PROCESS_CPUTIME_ID is not in the VDSO. It looks in the
> VDSO, doesn't find it, and then proceeds to make the real syscall, when
> it crashes. I can simulate the same crash by simply adding a printf
> after a successful call to the vdso before returning. For example:
> 
> int __clock_gettime(clockid_t clk, struct timespec *ts)
> {
>   int r;
> 
> #ifdef VDSO_CGT_SYM
>   int (*f)(clockid_t, struct timespec *) =
>     (int (*)(clockid_t, struct timespec *))vdso_func;
>   printf("vdso %p\n", f); // <-- this line does NOT crash.
>   if (f) {
>     r = f(clk, ts);
>     if (!r) {
>       printf("ret %d\n", r); // <-- this line DOES crash.
>       return r;
>     }
>     if (r == -EINVAL)
>       return __syscall_ret(r);
>   }
> #endif
>   printf("falling through\n"); // <--- this line DOES crash.
>   r = __syscall(SYS_clock_gettime, clk, ts); // <-- also, this line will crash too
>   if (r == -ENOSYS) {
>     if (clk == CLOCK_REALTIME) {
>       __syscall(SYS_gettimeofday, ts, 0);
>       ts->tv_nsec = (int)ts->tv_nsec * 1000;
>       return 0;
>     }
>     r = -EINVAL;
>   }
>   return __syscall_ret(r);
> }
> 
> It seems like somehow the stack frame is corrupted/unusable after a call
> to the vdso. But, returning immediately from clock_gettime after a call
> to the vdso allows the program to continue. Thus, this problem only
> manifests itself when using clocks that aren't handled by the vdso.
> 
> It's possible this is due to some compiler ABI mismatch situation
> between userspace and kernelspace. However, I've only started seeing
> this happen with 5.5 and not on 5.4.
> 
> Does the above description immediately point to some recognizable
> change? If not, I'll keep debugging.

There is one pending fix for the VDSO in mips-fixes, commit 7d2aa4bb90f5
("mips: Fix gettimeofday() in the vdso library") but your symptoms sound
different to the problem fixed there...

Could you share your kernel config & tell us which platform you're
running on? (QEMU Malta?)

Thanks,
    Paul
