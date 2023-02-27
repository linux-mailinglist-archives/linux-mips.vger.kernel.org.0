Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE566A4979
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 19:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbjB0ST5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 13:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbjB0STz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 13:19:55 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14ABF1116B
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 10:19:55 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id i10so7637620plr.9
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 10:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfnQo7L3hy6IE8pwdX9cAeSy43FJsV0FyB8x83SeQeM=;
        b=rWPmP+vycZsUPGG7S35v7wB6cnRGrJy6xMe+/4D/SZEInlX72UXXfiai/N9K68G8yL
         k2OUQjMGwAm0d6NrWdzUiGagK7tiqgeURmslTr7oFtxcqcs26pm5KFC0+/UNKdapjhOl
         EPXvLc/JIvQJn0gvolK/KfbCBZsL6um/osDUiEzF7hV8lx80qTu6RNRnYlEAgGw2ks+4
         p2raBH/CJha+U86cbwYAsVTrnqYq4hjSSiN11aycFLxDQryNokV7UCJ2+KDN9q5xHfTe
         z0INCL4Ejx9YtFZwvZ8Pt9dwUACgMwEFZ8TmD95OO14MMA+55B/UB0rt7c0y8lWnwr/j
         ipwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfnQo7L3hy6IE8pwdX9cAeSy43FJsV0FyB8x83SeQeM=;
        b=hhIu7i40lRC2JGVtNpJ356kJ7NQe4NyXSX3yM+G9BKVmVy1JkductVBVm+zlG+nkIy
         BT9qWNvUB2oB79fuf5QgN48rFDgyB8vyS/YZF9ZRkRn255gpw0jQQ+p61Exemj3FmfJU
         H3g/4JqMT3j+FDhs3MIGNKZDpcMKhg5lbkKt6bfSsmgJwXBAiHjJb/+V9a79xTLWM3cH
         3eZgi55m3hsg2kSe+WQPVZS2cLwanfbbDY7EqiQt3zihGHo6GfFzemS8rAcJxg32STcQ
         nIdr2zI+0wNIpkS6M62CSeLhkeFk8PVoJbCkgf4ffFcvPL5KKN7XWbsfbwfBTRpxFFAU
         BXCg==
X-Gm-Message-State: AO0yUKXxcPMXV+QlCfMsCs+VQ81YXG/xIyXzQ5vXSGVMwnRoOLrZK+n0
        +8IkRyMTQ7MLZI6iHhrW4YyJ8jKEJ4Ed/RGsKwMSUA==
X-Google-Smtp-Source: AK7set8fQkpeHF69hbC6AWofF1bMS6rWkmNS7WS1kGnH5uc5CNkUGJp0NZExeAiT3XS7mf85rfGg5OEqh2glTL/Wx7A=
X-Received: by 2002:a17:902:ab0b:b0:19b:5233:51c6 with SMTP id
 ik11-20020a170902ab0b00b0019b523351c6mr6436096plb.0.1677521994138; Mon, 27
 Feb 2023 10:19:54 -0800 (PST)
MIME-Version: 1.0
References: <20230225214500.7446-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20230225214500.7446-1-jiaxun.yang@flygoat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 27 Feb 2023 10:19:42 -0800
Message-ID: <CAKwvOdk=AF2nGozsiG2T1FHsJXhLGcpk1kysQ4eko1OOBvnafw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Workaround clang inline compat branch issue
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        nathan@kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 25, 2023 at 1:45=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
> Clang is unable to handle the situation that a chunk of inline
> assembly ends with a compat branch instruction and then compiler
> generates another control transfer instruction immediately after
> this compat branch. The later instruction will end up in forbidden
> slot and cause exception.
>
> Workaround by add a option to control the use of compact branch.
> Currently it's selected by CC_IS_CLANG and hopefully we can change
> it to a version check in future if clang manages to fix it.
>
> Fix boot on boston board.

Hi Jiaxun,
Thanks for the patch. Have you filed (or found) a bug in LLVM's issue
tracker with more information?

https://github.com/llvm/llvm-project/issues

Please do so, then send a v2 (or reply with) a Link: tag to the
corresponding llvm issue report.

>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig           | 3 +++
>  arch/mips/include/asm/asm.h | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 37072e15b263..adf2c5a0bdba 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3206,6 +3206,9 @@ config CC_HAS_MNO_BRANCH_LIKELY
>         def_bool y
>         depends on $(cc-option,-mno-branch-likely)
>
> +config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
> +       def_bool y if CC_IS_CLANG
> +
>  menu "Power management options"
>
>  config ARCH_HIBERNATION_POSSIBLE
> diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
> index 336ac9b65235..2e99450f4228 100644
> --- a/arch/mips/include/asm/asm.h
> +++ b/arch/mips/include/asm/asm.h
> @@ -336,7 +336,7 @@ symbol              =3D       value
>   */
>  #ifdef CONFIG_WAR_R10000_LLSC
>  # define SC_BEQZ       beqzl
> -#elif MIPS_ISA_REV >=3D 6
> +#elif !defined(CONFIG_CC_HAS_BROKEN_INLINE_COMPAT_BRANCH) && MIPS_ISA_RE=
V >=3D 6
>  # define SC_BEQZ       beqzc
>  #else
>  # define SC_BEQZ       beqz
> --
> 2.37.1 (Apple Git-137.1)
>
>


--=20
Thanks,
~Nick Desaulniers
