Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC101505B9
	for <lists+linux-mips@lfdr.de>; Mon,  3 Feb 2020 12:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgBCL7d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Feb 2020 06:59:33 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57449 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgBCL7d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Feb 2020 06:59:33 -0500
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MqsGv-1jL3223BVR-00mrwx; Mon, 03 Feb 2020 12:59:31 +0100
Received: by mail-qk1-f171.google.com with SMTP id j20so13855746qka.10;
        Mon, 03 Feb 2020 03:59:31 -0800 (PST)
X-Gm-Message-State: APjAAAWYk9mRNOlFBqvjXwj8P4Ny18UPbDanXSar3XKYSy8+eetK6vhX
        UwdOkItCDPCVF0rrI2nFR5aTIx/7TAJ1jBiPDpk=
X-Google-Smtp-Source: APXvYqyvsIiRUM+eJEFAIsaK7CjOU1YcjR9nHLh0/OBPGpCnh1WHcjpw3dP0kWUCKlcYs360p9M7EBVhR7QpHHhxL8A=
X-Received: by 2002:a05:620a:16a7:: with SMTP id s7mr22539771qkj.3.1580731170570;
 Mon, 03 Feb 2020 03:59:30 -0800 (PST)
MIME-Version: 1.0
References: <231ec2e1fd2470ef7a9b8b2c766ff8e4095b6dd3.1580399657.git.christophe.leroy@c-s.fr>
 <202002031426.QLrslGif%lkp@intel.com>
In-Reply-To: <202002031426.QLrslGif%lkp@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 3 Feb 2020 12:59:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2+Cq_-L662WaQeScTTX1W50wPAkqs1R=fqyrHrd74znw@mail.gmail.com>
Message-ID: <CAK8P3a2+Cq_-L662WaQeScTTX1W50wPAkqs1R=fqyrHrd74znw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] powerpc/vdso: Switch VDSO to generic C implementation.
To:     kbuild test robot <lkp@intel.com>
Cc:     Christophe Leroy <christophe.leroy@c-s.fr>,
        kbuild-all@lists.01.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Lynch <nathanl@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:exr7jEatqHimGfeEbSVzkkQ0+77/XmBz6EoH9xPXpmR3ELhpwDw
 z/+2sWA+nUvGg/qwyzGsOCfWo8RdUq2nX6AwHmnbtL+gRQja5IDq0V+d5fvXv16hxTx8i8+
 sDF6wLNznYIbQQ28u2WPr/EXKv3p9eI4ICqZyrwuclBRjSECv5X1aryBZp5OzGqfVB0qIbt
 hz7pMmL4tp/ZbAl76o8EA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:anjbaARBvdQ=:HgDi1T5v8CNtFsIQF7cg4P
 3UsUgf/CNwDgYXQqfWJXgvZQY9uDmU009oolPVyEQfGICcFH2WZpjEhIQhxYztkX7ocuqPmkB
 ZNtrwx2dQGhNav3AqQrj3HTqLauPvxwVW28Hl61TVjm2RF1rfkijcVtMZEiiRbKAJHXb/6xng
 2J/JE0sx/1wj8l9a1wt2OjtWqvFaPbifrUzWP7cG8PzpVnfpEKO2bUEGdCtzaXf7l3X3+MnLB
 TNAH2QuERGR4ZZKDtTdYSv6gA3Z3O6rjYItaXK7daGg7xqpY28V3yJMhTwB2NRZfVtbsYKkzp
 Wj6yTQ+1xRznrmgwSSRpqlAMLWwxb+4QrwQ5G82beYREsteekylPa5owXatCBTyjA77O+uJaW
 MRBQPNj7viD6hV+rCHQwNIQqJngvC8K9ygN2uj46JHvyp2q1Qd9sLhipEr3LqZmCTlWHnluNm
 2sNMPyYauCGBKzewXtSKAtjO/JLY3INeuGo3woLRbGmALiZrwzj7VF4Mm6adlE7KPqcDgUWmS
 PTbKsNTP5oMVdlSf36boJchYR3nYcDFbKdG8XbiQeNohLWodBi9nKwhXJY+K32zb6DBh0eh6S
 0wdD4DnmJm1heVYIKtpitwbRYs2gjg5bFGgrD7b5T8ys7vC0DR+n9ReBMgByz96jmSxXR/tjr
 vy/ADsYf0Koe1//BDwDSHKlsfaVTAoXJFk2ONryWPC6MLPtyujONRzv5Ukr+CZbOmBVklqRlt
 Z5C79A3DI4yi1RVwM+SeM5AGZKCEzIrJ4pMNE6DkMYcSZwqzZBLiODiJDWo5oiHbnJYUa6OFC
 CuJikN6gxyAcEeVl5GQfFSvtDYQ/fRR0ILTLbxtBZmjPq8q/3o=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 3, 2020 at 12:28 PM kbuild test robot <lkp@intel.com> wrote:
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> arch/powerpc/kernel/vdso32/vgettimeofday.c:26:1: error: unknown type name 'time_t'; did you mean 'ktime_t'?
>     time_t __c_kernel_time(time_t *time, const struct vdso_data *vd)
>     ^~~~~~
>     ktime_t


time_t is no longer available in linux-next, so this has to use
__kernel_old_time_t.

      Arnd
