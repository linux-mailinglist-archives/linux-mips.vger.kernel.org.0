Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2D3712DD97
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jan 2020 05:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgAAEIp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Dec 2019 23:08:45 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42236 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbgAAEIp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 31 Dec 2019 23:08:45 -0500
Received: by mail-pg1-f194.google.com with SMTP id s64so20207553pgb.9;
        Tue, 31 Dec 2019 20:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZwEkntBzTwwdVS/4EXR74+jTw7hvRbZPVc6hQGwZlbU=;
        b=KUSTVsOl3zGQf+Y17+zdupfoUukg92vv1tBNZ7S0CdhaQHXZ+xyVzj0PlUqLMubizz
         sfpZ6na2tpWo/xH1fI/7SDP2LvufjECxOHxyGIZ7x6lW5jnAqcCYbarNtAt3JMejEHxR
         aa8NUHvu5VmWQTd8JxcZmPNoAbHGNXaPwpwePRqn3KUrENmOVs2E4Iu+cUBQjTTmFKUh
         zXdpnUfIwG5W83KfnIg3C+40+vvWgeNkXqqcFQHEen5XeKWZ4D5U18Gb3lcT4fN6QBda
         LnM/wWnbIkpEkLJCoEPyPsT3zi0winZGkjmn57ZsfTBVSBOubGGNZVW2GbsSfZiXAnvA
         uLqw==
X-Gm-Message-State: APjAAAWbw8DeSFxSSaJFBRz5QkPJuRoG+Mli4oT0aZZdbcM8alv2B4uP
        iAtfj1v44j8MJATYU/xKtEoPfjRc
X-Google-Smtp-Source: APXvYqwqcO600EMHdk5EQe6uNwek78BvgnjnCvcQWSL2aR5jDvRID94jIF7d1tyi7CpAYWlxwKInDg==
X-Received: by 2002:a65:5bc3:: with SMTP id o3mr80374380pgr.226.1577851724304;
        Tue, 31 Dec 2019 20:08:44 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id g8sm57261053pfh.43.2019.12.31.20.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 20:08:43 -0800 (PST)
Date:   Tue, 31 Dec 2019 20:10:56 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on
 COMPAT_32BIT_TIME
Message-ID: <20200101041056.xionott76qbrffih@lantea.localdomain>
References: <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com>
 <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
 <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
 <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com>
 <CAK8P3a0NBuqDX63+920q7Q+yO2xCoSd0O7xUDJv6BBoco2kVOg@mail.gmail.com>
 <CAHmME9rnnoFwh=EHAgdQFM+c33D9mgCoVML_+d=Js=pXPnsxKQ@mail.gmail.com>
 <CAK8P3a1AYGbgf6mmL-863+PXPBQw3AAtp5wQPL5duLCONGhHuw@mail.gmail.com>
 <CAHmME9r2G4viiF4sYqpuYOnFCtjWpjugqenoEeUrsU6MGBeSuQ@mail.gmail.com>
 <CAHmME9rCCei_CL1evDYQ44Eu8erbjx_jDzbpKeXD4jTGBu8v8A@mail.gmail.com>
 <CAHmME9q0z4RBhy7AETo0sPt+SfV7=zFra0iyZ-Sm54c-WG6CVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9q0z4RBhy7AETo0sPt+SfV7=zFra0iyZ-Sm54c-WG6CVg@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jason,

On Tue, Dec 31, 2019 at 05:14:41PM +0100, Jason A. Donenfeld wrote:
> Here's a "one click" reproducer:
> https://data.zx2c4.com/mips-musl-libc-weird-crash-time32-compat.tar.xz
> 
> Untar that and hit `make -j$(nproc)`, and you'll get a freshly built
> and crashing kernel+userland.

Thanks for the test case. It seems like the VDSO code isn't saving &
restoring $gp/$28, even though it's meant to be callee-saved in both the
n32 & n64 ABIs. With some digging I found that the below seems to
resolve the issue. Could you check whether it works for you?

I'm still not quite sure *why* this happens; perhaps GCC just decides it
doesn't need to save & restore $gp/$28 when it spots that it's being
"used" for __current_thread_info (even though that's never actually
referenced in the VDSO)?

Just moving the declaration of __current_thread_info inside the
current_thread_info() function seems to do the trick too, and is
probably a bit neater.

Thanks,
    Paul

---
diff --git a/arch/mips/include/asm/thread_info.h b/arch/mips/include/asm/thread_info.h
index 4993db40482c..ac33959bbb1f 100644
--- a/arch/mips/include/asm/thread_info.h
+++ b/arch/mips/include/asm/thread_info.h
@@ -50,7 +50,11 @@ struct thread_info {
 }

 /* How to get the thread information struct from C.  */
+#ifdef __VDSO__
+register struct thread_info *__current_thread_info __asm__("$0");
+#else
 register struct thread_info *__current_thread_info __asm__("$28");
+#endif

 static inline struct thread_info *current_thread_info(void)
 {
