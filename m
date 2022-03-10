Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1AA84D5261
	for <lists+linux-mips@lfdr.de>; Thu, 10 Mar 2022 20:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237781AbiCJSWI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Mar 2022 13:22:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbiCJSWH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Mar 2022 13:22:07 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA66A14EF79
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 10:21:04 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id r22so8948556ljd.4
        for <linux-mips@vger.kernel.org>; Thu, 10 Mar 2022 10:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sD9b5dOEVi4YerwZzZEJrDOPFq1VY6jiSE0PCEyxRgg=;
        b=r7hummoukWQUHQwRHPveXhGWj5cTSwRVSJfVXewO0gZHzkDj9Y6MhYYGGcXvbqBAOW
         lM4E+5uFkjvbOkqFpb3xDmpYiosRUMQS8SoWt5IlgnIjJEWuQ2FueW6QpYPf1LEhh1yr
         1prCveLoZQchUSKibr8zHJHrIKKTppYmXOvyGy2g2gEoE/TQWvNa7Hp0VGFXIyApeSKN
         n16R5dEwFRbW/VFLG9N346VJTL0D9NCGtX0nuglXTJW8kN7A063SOx1YzP7uW0YXZ9mx
         DRn5tZnkIpNVmwb0F5D3lpC9UYOWRhlBtrPQk8hwE3DQFbPZrLlXn7xGATYWxjbXhIr7
         b5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sD9b5dOEVi4YerwZzZEJrDOPFq1VY6jiSE0PCEyxRgg=;
        b=57fkKgaT5zrsm95EJO9cM3+vvaCuxLyMp14H5PfAaknEjXj/nhr/LbRq2d7Gt3V13q
         BkdGLB2iTibjcqQr99uMOKIvYD+OGCBWIZabqBB69VqCzBFq++XLYS7QPvMx1pnWD/gZ
         +TfNlhcO+2EJBoRzjw8W7YS7iNS0nGPW6h8obcAxZQlRvWf/pL1x/9cCiks3FU8xS8Ux
         Ig3se7CYeLl4b+1CUrBlIY5MTuQtjuaefLbzQ+wu1DVEL9Cf0kDuo4w1zQdbOXraqRkd
         rTcA9qJBEN+Zil6dLndSOo9eMkIYcBy5GIQ0Yj8xi0hZwRFAkGWaXEJPzPw6xF5JYx06
         kzXw==
X-Gm-Message-State: AOAM532W8jf367K1vSxRSm/VuR/ycedbJkumNHbxsJs9jLNMd3dO5vGM
        zZiyUQEAhqdH0KD5N7fzeA1+55OA0wo9JQNIwpYIvg==
X-Google-Smtp-Source: ABdhPJyK+q8Dvy2o6fMAN7Y1PY4bwm6vcpQjlBaQAUeqmZ+J3aXZO1oD1PTsVbeZ1Aq60b8cZszt8uLh8uySv1qOcRU=
X-Received: by 2002:a05:651c:1791:b0:243:94bd:d94c with SMTP id
 bn17-20020a05651c179100b0024394bdd94cmr3729199ljb.468.1646936463000; Thu, 10
 Mar 2022 10:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20220309220939.392227-1-keescook@chromium.org> <3bb36a2d506a4b73aefec200d1edd40a@AcuMS.aculab.com>
In-Reply-To: <3bb36a2d506a4b73aefec200d1edd40a@AcuMS.aculab.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 10 Mar 2022 10:20:51 -0800
Message-ID: <CAKwvOdkjsNhR8DNRCjEVLibHf0j1WS54m-CSEQpm070h3J7_4g@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: Only use current_stack_pointer on GCC
To:     David Laight <David.Laight@aculab.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yanteng Si <siyanteng01@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 9, 2022 at 2:44 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Kees Cook
> > Sent: 09 March 2022 22:10
> >
> > Unfortunately, Clang did not have support for "sp" as a global register
> > definition, and was crashing after the addition of current_stack_pointer.
> > This has been fixed in Clang 15, but earlier Clang versions need to
>                                ^^ 14

Yeah, with that fixed:
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Once clang-14 is the minimally supported version, we can go back to
removing the inline asm for everyone.


> > avoid this code, so add a versioned test and revert back to the
> > open-coded asm instances. Fixes Clang build error:
> >
> > fatal error: error in backend: Invalid register name global variable
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>


-- 
Thanks,
~Nick Desaulniers
