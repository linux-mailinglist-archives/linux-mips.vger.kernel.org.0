Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA88C153764
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 19:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgBESTN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Feb 2020 13:19:13 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46333 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgBESTN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Feb 2020 13:19:13 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so3906537wrl.13;
        Wed, 05 Feb 2020 10:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:cc:references:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e4WNWeHzzThx/k21Ar3P5/tvg+ZuZmLhOHFhJfAdS7E=;
        b=kvJcXRPoUo/wZpnYkzApxeKv3XcP+RZlDMAWeclMP7kLMdxkHRy+UGFlkw+2JyGf3E
         ky1AJoE3ZkYAp+2DzBz30pF8kXEiALwgC364CCtFiuIiAHvCzZfWkMDPhDAgksI5mbQg
         suxHkds2tl+WNXj8fPnYo41t7q2vDmD2u+H4da3MiJt/kJvJSEiBHZkf453gXwoG1QQH
         A0eBTu4VEcrmeKOyxfyKaH4OuGNL7TrD/BKy6/TAbozex3VoVJztFDJzrCoMVPfGAGde
         CgFXIjhcAgdbnHVnhFkysJov9G8XY7XFrK1itXDrbkX65Lw0OzMFJF+3RwxciDgk9cFe
         aO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:cc:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=e4WNWeHzzThx/k21Ar3P5/tvg+ZuZmLhOHFhJfAdS7E=;
        b=R4Wbc2Gv8VgiaapaoWSx4ia0Im8guOoKEXFSSPeI848lmqV8ZfC7BtG4dXhnX32L3a
         Mkx2uuZB43Tw7UmrphZdu1SY2JGO31FIiOidKpIY6F8V9UcAKGDOfOGUvmRkop/Y+hym
         cHQd49EtWO+LKgX7Kr1LN7+IenEHtROt2zIfJoYYVRIrRq8Fd4fHE8Qoh7uxM9PlbwQe
         LCrboCXHryH+FleKWxF3oK/TaPJl18VWT++Xhrcvyd5vqAj8wrTrhhIoh4ogV3WxfKSa
         9gNol8hHpLjt+HwrVth7RJngwUkpvRP/IvWrNwTJeAQeq8E2pRufS8tMGuSRLHha2BWO
         YRJQ==
X-Gm-Message-State: APjAAAUkevkkW8ajd5nOFjUE5rSJ1RyAZ2uV76LL78440G9MERtl0yBV
        66DN/VQoZ3KlMzcuLhmtcHU=
X-Google-Smtp-Source: APXvYqw2wELTJ9b9Zw4z1oiqAdLH/7bwkjnMY49QIK5O0TcB8txsSkdq5MlBoLmstHLvJIOyDxKcgw==
X-Received: by 2002:adf:b352:: with SMTP id k18mr29032513wrd.242.1580926750700;
        Wed, 05 Feb 2020 10:19:10 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.162])
        by smtp.gmail.com with ESMTPSA id z21sm449220wml.5.2020.02.05.10.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 10:19:09 -0800 (PST)
Subject: Re: [PATCH 1/3] fbdev/g364fb: Fix build failure
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>
References: <cover.1580610812.git.fthain@telegraphics.com.au>
 <d8f19ebc00a7688da739d41d584d081d1559f0d2.1580610812.git.fthain@telegraphics.com.au>
 <CAAdtpL7SpzfqSmEcuVszNyXfrRegC20txoS5j7Ss3WkCmyRH+g@mail.gmail.com>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <08447d52-0007-6f68-3848-209295a61d13@amsat.org>
Date:   Wed, 5 Feb 2020 19:19:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAAdtpL7SpzfqSmEcuVszNyXfrRegC20txoS5j7Ss3WkCmyRH+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/5/20 7:02 PM, Philippe Mathieu-Daudé wrote:
> On Sun, Feb 2, 2020 at 3:41 AM Finn Thain <fthain@telegraphics.com.au> wrote:
>>
>> This patch resolves these compiler errors and warnings --
>>
>>   CC      drivers/video/fbdev/g364fb.o
>> drivers/video/fbdev/g364fb.c: In function 'g364fb_cursor':
>> drivers/video/fbdev/g364fb.c:137:9: error: 'x' undeclared (first use in this function)
>> drivers/video/fbdev/g364fb.c:137:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of function 'fontwidth' [-Werror=implicit-function-declaration]
>> drivers/video/fbdev/g364fb.c:137:23: error: 'p' undeclared (first use in this function)
>> drivers/video/fbdev/g364fb.c:137:38: error: 'y' undeclared (first use in this function)
>> drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of function 'fontheight' [-Werror=implicit-function-declaration]
>> drivers/video/fbdev/g364fb.c: In function 'g364fb_init':
>> drivers/video/fbdev/g364fb.c:233:24: error: 'fbvar' undeclared (first use in this function)
>> drivers/video/fbdev/g364fb.c:234:24: error: 'xres' undeclared (first use in this function)
> 
> 18 years unnoticed...
> 
>> drivers/video/fbdev/g364fb.c:201:14: warning: unused variable 'j' [-Wunused-variable]
>> drivers/video/fbdev/g364fb.c:197:25: warning: unused variable 'pal_ptr' [-Wunused-variable]
>>
>> The MIPS Magnum framebuffer console now works when tested in QEMU.
>>
>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> 
> This commit is the kernel 'git origin' import, not the proper reference.
> 
> The actual change is between v2.5.17/2.5.19:
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/diff/drivers/video/g364fb.c?id=b30e6e183a728923267
> Date: 2002-05-22 07:52:33...
> 
> The same commit introduced the changes in g364fb_cursor(), which was
> implemented previous to v2.4.0 so it is hard to follow from there.
> 
> Nobody complains during 18 years so I doubt anyone care that
> g364fb_cursor() is removed.
> And by removing it, you improve the kernel quality, so:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> (Maybe remove the unhelpful 'Fixes' tag).
> 
>> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>> ---
>>  drivers/video/fbdev/g364fb.c | 29 +++--------------------------
>>  1 file changed, 3 insertions(+), 26 deletions(-)

Note, you need to rebase your series due to:

  commit 8a48ac339398f21282985bff16552447d41dcfb2
  Author: Jani Nikula <jani.nikula@intel.com>
  Date:   Tue Dec 3 18:38:50 2019 +0200

      video: constify fb ops across all drivers
