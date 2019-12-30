Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64E6812D1A2
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 16:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbfL3P6u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 10:58:50 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:45645 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727565AbfL3P6u (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Dec 2019 10:58:50 -0500
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MOzjW-1j6tZE3XOW-00PNNQ; Mon, 30 Dec 2019 16:58:49 +0100
Received: by mail-qt1-f176.google.com with SMTP id n15so29895809qtp.5;
        Mon, 30 Dec 2019 07:58:48 -0800 (PST)
X-Gm-Message-State: APjAAAVXolJAtjoV8SRDBpBX1olLw7mm1FpCLXhriYwOHzkaLly2QdyS
        lxHorSCH/u3BzoShwDRvDnmeMpti+7QaUlZLud0=
X-Google-Smtp-Source: APXvYqzWuwkpOhaRZUxVS/1QPSlNYQtFi8ZBlYcOwq9YyLHR7qDGoSI2EKo1viYBs7DWtSGazM0rQP6EBkuiz4NaBxE=
X-Received: by 2002:ac8:47d3:: with SMTP id d19mr48206264qtr.142.1577721527571;
 Mon, 30 Dec 2019 07:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191223232945.a3sbzfj6uw2sokba@lantea.localdomain>
 <CAHmME9qg8+xdM7Uo=XydwsOV27BWYK8fV44oimqiosBvH_-UDg@mail.gmail.com>
In-Reply-To: <CAHmME9qg8+xdM7Uo=XydwsOV27BWYK8fV44oimqiosBvH_-UDg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 30 Dec 2019 16:58:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ojj7mYg0-gBG8a=CWubBE-0XtDSw-B4nqmqHcmE34pw@mail.gmail.com>
Message-ID: <CAK8P3a0ojj7mYg0-gBG8a=CWubBE-0XtDSw-B4nqmqHcmE34pw@mail.gmail.com>
Subject: Re: vdso-related userspace crashes on 5.5 mips64
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Paul Burton <paulburton@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:FGETlgARtieMiI5fujwnbSVL7EwWN79ybt9tzhw5o7S8zOVwRWP
 rDogsPL2GV1eV2xb8tIOozTbblXarG6Pa8rsDsQd4lS9iJ1/5p09+yUcAqqETp1I9NoPGQr
 9O3zm3WDhAtpr4BWRHDRbzQ2FepI4Zz/5IE0CZQKzLFXzMQ1p8vwwK80Ui6x+7psUBspigI
 lwGKoGq0cgrBxsapEjeWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k3VfbXMTM9k=:2iYAMgj5A1Mxllson8wbkE
 EBpZDMqIkAamb3dPh2fUZMonmJYi+9NXGQGZpe0SKOHreCUdow8SjbkNag5O3YZyAw/Q9qNKl
 8WNPSSfCANOD5zzfqfhHZtZ0Q72iRAsWCHhfbPz1MPFd5w4z3kvfiaNYV4PMLmKvWeCLMeJNV
 XNCg4hC/iHGBFuk20bfq54RmKDHFfqpPxqei7R56nmdvP0MoRZIPiB/Oq2xmcZtN5+ZL6IKhp
 lQuINjcSXYhN3QSzqztoXSQocX4GqdEzl2aOOc8J20VlERgpnNv02K2SxD75DpXzp+9FCkkn/
 vOzCMqHL7RDL8HHGKyJEfctvd4Mhpjcemmc1t/+IcTXCrQPGJ3nhdjoQDFvr6+e0SCfovALCQ
 Y8kSGHcVO9rV1EnB+qxYZSdMmghNHHkTagAeXi7U9VyeXci7m7uXJFZgauhkjTplfvT6X0qBU
 nmbiW87HYn++/9ChNpSUoSuPfyTCgsCMxRKD+tfgavJ0bYXHWrcSn8RrLFPwAiKYj20j5FEvm
 YjVt5NLihT6NVEVgG7KQEBDvvZtH1Utg4GbjlWoABrjcbjtpde4hukhmRo7djZzCiGD7E8t+5
 WHI57YwClI7jCJR9hhVF77BeZUXAgnWVeF8MMy6C0/3HGWtcAekgzliAkfJw1p+hIQQQotn4Z
 qmY/3WzUhDujKEqyLX8ZLox+UfxS9ljyluZL04xD1LFBAcLvAeowgDkbIf31z8eb5Ox7FMBAk
 b08BFza224iz4Nd2B+gv4pQsVggAOaXtsRHJBT2w4K5BfSGJDQmQdhY570EkXKL/lrDWwOoau
 ZoFYU+zdN5ZoXWSU0J4BmzvQU6GhonRSR8uoIY3UF2vl59cwMvw5/Wl8cqmpj1J7B8+fMzRUR
 ZE17OapbRUE2c+RIGUhw==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 24, 2019 at 2:37 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> More details forthcoming, but I just bisected this to:
>
> commit 942437c97fd9ff23a17c13118f50bd0490f6868c (refs/bisect/bad)
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Mon Jul 15 11:46:10 2019 +0200
>
>    y2038: allow disabling time32 system calls
>
>    At the moment, the compilation of the old time32 system calls depends
>    purely on the architecture. As systems with new libc based on 64-bit
>    time_t are getting deployed, even architectures that previously supported
>    these (notably x86-32 and arm32 but also many others) no longer depend on
>    them, and removing them from a kernel image results in a smaller kernel
>    binary, the same way we can leave out many other optional system calls.

My best guess right now is that there is a bug in the error handling
inside the mips vdso: clock_gettime32_fallback() is defined like

static __always_inline long clock_gettime32_fallback(
                                        clockid_t _clkid,
                                        struct old_timespec32 *_ts)
{
        register struct old_timespec32 *ts asm("a1") = _ts;
        register clockid_t clkid asm("a0") = _clkid;
        register long ret asm("v0");
        register long nr asm("v0") = __NR_clock_gettime;
        register long error asm("a3");

        asm volatile(
        "       syscall\n"
        : "=r" (ret), "=r" (error)
        : "r" (clkid), "r" (ts), "r" (nr)
        : "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
          "$14", "$15", "$24", "$25", "hi", "lo", "memory");

        return error ? -ret : ret;
}

and it's possible that this does not work correctly when the system
call fails. With my patch, the __NR_clock_gettime syscall always
fails, and this may end up corrupting the registers or the stack
in some way.

One thing you could try is to use a working kernel version (before
my patch, with my patch reverted, or with your workaround applied)
and pass an invalid _clkid argument to make the system call
fail in a different way. Does this cause the same crash?

I see that the previous vdso implementation (added in
180902e08f05, fixed in b399ee28c29c07, removed in
90800281e761) had an issue with the clobber list originally,
but the current version looks identical to the version after
the fix.

        Arnd
