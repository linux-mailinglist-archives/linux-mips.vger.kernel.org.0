Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1379012DD9B
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jan 2020 05:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgAAEWt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Dec 2019 23:22:49 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45100 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgAAEWt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 31 Dec 2019 23:22:49 -0500
Received: by mail-pl1-f193.google.com with SMTP id b22so16461934pls.12;
        Tue, 31 Dec 2019 20:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V9nkm+It3GcjzuF9e6uccT0sEAMpb6WhCDjfhadhYK0=;
        b=ApwBGq5u99mk9zXEuQFTDtXQdyonUnJfXC632ilRPXlwigzFpeAShcwEEn8ofeqD/K
         o4KhBiCxnsmmTA0g0e/38nBL0Lk1cZHQMBXf26WG77HuqYUs0F0/5LYHWWkKEaELTdWf
         Rf3+S0kJF/AsMLz0AI7t69tWeEKFpw9dqVGCpnHJE4Cx9cVTE+4PFV1wzxJ0e1uphORn
         CmOk4bBvSIwk5SGzs7Mqe44CaJVTUMGz8J8P8CA8rViTFjs6rM45UV4t/eXzXkFWp2Of
         RvMfF/nzGzbhQsSA8c9THaG0tz7EYtWs5vzuZkL1OvhjWeK2DphxPYThIxCT8Rh2sYQP
         nXYQ==
X-Gm-Message-State: APjAAAXdVkB/1OXussN1dzG2IkKCwcsJwjpdtFHthVgv1eTa2pON2rqx
        qfQCBXkpiXRn5yRkd5BVsNY=
X-Google-Smtp-Source: APXvYqw3+kyNrDGDdaaWW6Y6/UAFmYh4989bm1DXiJUGD2Tckn6RHwkDgkwAZCXYlEVya4lkW/Dzqw==
X-Received: by 2002:a17:902:9890:: with SMTP id s16mr77614042plp.265.1577852568262;
        Tue, 31 Dec 2019 20:22:48 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id o98sm5350992pjb.15.2019.12.31.20.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2019 20:22:47 -0800 (PST)
Date:   Tue, 31 Dec 2019 20:25:00 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on
 COMPAT_32BIT_TIME
Message-ID: <20200101042500.zmhldrthr3l45trq@lantea.localdomain>
References: <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
 <CAK8P3a11g-UXcYdudDtp0TWCQAfotpc-63BqYwn-a9LDxV-b+Q@mail.gmail.com>
 <CAHmME9pnBtjJ86gsWgK8DCYKo_HFpyViHoGpJPTrYBONT01YVA@mail.gmail.com>
 <CAK8P3a0NBuqDX63+920q7Q+yO2xCoSd0O7xUDJv6BBoco2kVOg@mail.gmail.com>
 <CAHmME9rnnoFwh=EHAgdQFM+c33D9mgCoVML_+d=Js=pXPnsxKQ@mail.gmail.com>
 <CAK8P3a1AYGbgf6mmL-863+PXPBQw3AAtp5wQPL5duLCONGhHuw@mail.gmail.com>
 <CAHmME9r2G4viiF4sYqpuYOnFCtjWpjugqenoEeUrsU6MGBeSuQ@mail.gmail.com>
 <CAHmME9rCCei_CL1evDYQ44Eu8erbjx_jDzbpKeXD4jTGBu8v8A@mail.gmail.com>
 <CAHmME9q0z4RBhy7AETo0sPt+SfV7=zFra0iyZ-Sm54c-WG6CVg@mail.gmail.com>
 <20200101041056.xionott76qbrffih@lantea.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200101041056.xionott76qbrffih@lantea.localdomain>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jason,

On Tue, Dec 31, 2019 at 08:10:56PM -0800, Paul Burton wrote:
> I'm still not quite sure *why* this happens; perhaps GCC just decides it
> doesn't need to save & restore $gp/$28 when it spots that it's being
> "used" for __current_thread_info (even though that's never actually
> referenced in the VDSO)?

Ah:

> After defining a global register variable, for the current compilation
> unit:
> 
> - If the register is a call-saved register, call ABI is affected: the
>   register will not be restored in function epilogue sequences after
>   the variable has been assigned. Therefore, functions cannot safely
>   return to callers that assume standard ABI.

https://gcc.gnu.org/onlinedocs/gcc/Global-Register-Variables.html

That makes sense then. What doesn't make sense is how this ever
worked. A question for another day...

Thanks,
    Paul
