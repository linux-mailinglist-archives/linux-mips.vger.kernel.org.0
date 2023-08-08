Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A5F7742CA
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 19:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235048AbjHHRud (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 13:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbjHHRuD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 13:50:03 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38C893E2
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 09:22:13 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so6223258276.0
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511702; x=1692116502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDrh8BIjjcioiUiDgVZRZWHMdXQTz7RggcR/+kw0NLg=;
        b=ekeIMF7bDLZPtzrGR7JcJpTKatkoza3RsSoO3Px5eRjlYTueHrX79bu431YI/iv8Lg
         zxJr8+ZcE9P+luOijrip46SaGEEXLAy8e7otvL+3luYu5PyGAP7/TtIyX++58cRWXUYw
         pH7ANA/iMBhP0/SIWwBYuX5sZjFM4N2qteedpFnZRH33ZoMyl6eau++2AH+yv2KWxIJC
         MnJoIyzwAccxf4hS4akMw01Fui6WsqrGJQXbVtNJ6/Y/nGdciH0Q7FbNsIu3UPVjx9NX
         CGrGJuF2kqQ44JTKEa+HEOAvbAiQv+YoKOy9NoL2EPB4n5yaVrDZOYym81XIwtw8PpFF
         TNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511702; x=1692116502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDrh8BIjjcioiUiDgVZRZWHMdXQTz7RggcR/+kw0NLg=;
        b=ChMdy96FfdgMZO+UXkVwaxRhwpafYECKcVrsIjvDoV4iiUci4fnL0HaJ5fsYoQkuy0
         kwq4qrMae62Lk1MS0cOFA5R82oi2lWXAuRh86KqIyvr+vXoOYltnlbRzRYISrP95kS+W
         RnWUanCtOzMH/M40cuBFpqQX1GbavzBF4MWeoiH9+IrbDji8k7BMvjELQvfjgsUR3sIQ
         39mJEuuzns1AgFWA2KCVWyXHV2Ja4Avt/2GnSLJN0Qj0ZWJQEySyD/d9MA5J7I3kVhlo
         PcA7rs2BjLIhn1jAFBqZu0d0IDQ3pXLokY/2LnFhTbBoBBCN9P0bflZDPd9Bacy4LCg7
         dptA==
X-Gm-Message-State: AOJu0YxWsgONxVo8qBU1/vtzJZqjwA4VTZJSCUqA9vcXwozF1AwVs1HY
        sOsby0uj7JrzrzcNKgI8O114xmFMn9ga4olEYUwRrk7pY8dWyJX2sno=
X-Google-Smtp-Source: AGHT+IGgk2Gn5ioNH0AcFXHWCRiyva9Nx2L/8mMA/ydZKbkG7fAbv8oXVgFtjI3hbchGPrQFMMIeNjTdPD0hamE70pA=
X-Received: by 2002:a25:8f84:0:b0:d3a:e626:af3a with SMTP id
 u4-20020a258f84000000b00d3ae626af3amr9952727ybl.24.1691500372554; Tue, 08 Aug
 2023 06:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230808-virt-to-phys-mips-v1-1-af6fcd45ed31@linaro.org>
In-Reply-To: <20230808-virt-to-phys-mips-v1-1-af6fcd45ed31@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Aug 2023 15:12:40 +0200
Message-ID: <CACRpkdYisteBTk9DOeCZiCeH5hJW87O-m+zsWAU7uwg7ud=ZYw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Drop virt_to_phys define to self
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 8, 2023 at 11:29=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> The function virt_to_phys was defined to virt_to_phys and then
> implemented right below.
>
> I can't understand why, just drop it and let the actual function
> slot in.
>
> Fixes: dfad83cb7193 ("MIPS: Add support for CONFIG_DEBUG_VIRTUAL")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/mips/include/asm/io.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
> index affd21e9c20b..18ed44843541 100644
> --- a/arch/mips/include/asm/io.h
> +++ b/arch/mips/include/asm/io.h
> @@ -111,7 +111,6 @@ extern phys_addr_t __virt_to_phys(volatile const void=
 *x);
>  #define __virt_to_phys(x)      __virt_to_phys_nodebug(x)
>  #endif
>
> -#define virt_to_phys virt_to_phys
>  static inline phys_addr_t virt_to_phys(const volatile void *x)
>  {
>         return __virt_to_phys(x);

Just have to CC Arnd on this because I never feel I understand this
properly.

Normally you would do this so as to override the default virt_to_phys()
from include/asm-generic/io.h, but we do not seem to be using it here?

Further right below we are implementing phys_to_virt() with no
corresponding define, so in any case this needs to go or that one
needs a define.

That said they seem like a good candidate to replace with the
generic variant because the content is the same sans some debug
hacks that I doubt are still needed.

Yours,
Linus Walleij
