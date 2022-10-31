Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3700613137
	for <lists+linux-mips@lfdr.de>; Mon, 31 Oct 2022 08:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiJaHcL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Oct 2022 03:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiJaHcL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Oct 2022 03:32:11 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7763165E5
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 00:32:10 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id c24so9998012pls.9
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 00:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bLaEG1AxuR7+lWKAQO3jvBzrZanxR9GIBe9arbHLQlY=;
        b=bZU0WZ4XKQPhFmsbxFnGkMv1hjyf8dK6g8aLLOG1oyjhGYx3zfxLo7s8ylw0lEjHjx
         Lu/5XoKV76xeY04gmGqY8E6KJnqV+WPHJFJHhh9yeJfAje6nm8oieAnjbTSV/z+Ava7t
         0ZzmuiFbB7KOlVY3cC4A1WH9r6nW9j0viFSNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLaEG1AxuR7+lWKAQO3jvBzrZanxR9GIBe9arbHLQlY=;
        b=xMpA6Dh/6civyJjyadDxve19DRddvp6r0QI8y8vBQ7lkGt40e7pB+PY3PuemBQ62Dk
         JtqQWFiHmPiK0PFVfbxgBuyjL2jm2UtgzMJv1Pzx6jTMvUsOFHi6/Co3wZIgHH6iwv+E
         NUKAOkYUuQAvZ22s+vL4DNUdY7Iz3MPkfBeEMXCSIInaYU0eq5L7IIjIJ0MLSHm127tw
         8EQxiI5nyzJA48vFpBWOPLJaBsTnmMGcvn/Hzpn1qv5/ivfzQlC+V0+rQFSLUmXsY7U3
         K3+jqLxSfUgNc8r02GNHixp+CRMU8EWAuFF3MtM+98vSXjb8qUrlCr6DWw6TWp+1+3jA
         Sifg==
X-Gm-Message-State: ACrzQf30wZE2nxuQgvT7CG8TOo+5hs8NZjRhQYGwZ5zARdWMffa7iMkx
        SdVz860AA38k/T+l640RKPyfPQ==
X-Google-Smtp-Source: AMsMyM63KrzVf0s9+OO4qil3ZB6Ns6W9yyhUxqgu0fht/8bL9YlnnmByhUTyRGgtVolZAKUs+1PNTg==
X-Received: by 2002:a17:90a:3947:b0:213:ebeb:2cf3 with SMTP id n7-20020a17090a394700b00213ebeb2cf3mr2754844pjf.9.1667201529999;
        Mon, 31 Oct 2022 00:32:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id iw15-20020a170903044f00b00177324a7862sm3799216plb.45.2022.10.31.00.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 00:32:09 -0700 (PDT)
Date:   Mon, 31 Oct 2022 00:32:08 -0700
From:   Kees Cook <keescook@chromium.org>
To:     John Thomson <git@johnthomson.fastmail.com.au>
Cc:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mips: boot/compressed: use __NO_FORITFY
Message-ID: <202210310029.29AB38AE16@keescook>
References: <20221030183647.3371915-1-git@johnthomson.fastmail.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221030183647.3371915-1-git@johnthomson.fastmail.com.au>
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 31, 2022 at 04:36:47AM +1000, John Thomson wrote:
> In the mips CONFIG_SYS_SUPPORTS_ZBOOT kernel, fix the compile error
> when using CONFIG_FORTIFY_SOURCE=y
> 
> LD      vmlinuz
> mipsel-openwrt-linux-musl-ld: arch/mips/boot/compressed/decompress.o: in
> function `decompress_kernel':
> ./include/linux/decompress/mm.h:(.text.decompress_kernel+0x177c):
> undefined reference to `warn_slowpath_fmt'
> 
> kernel test robot helped identify this as related to fortify. The error
> appeared with commit 54d9469bc515 ("fortify: Add run-time WARN for
> cross-field memcpy()")
> Link: https://lore.kernel.org/r/202209161144.x9xSqNQZ-lkp@intel.com/
> 
> Resolve this in the same style as commit cfecea6ead5f ("lib/string:
> Move helper functions out of string.c")
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 54d9469bc515 ("fortify: Add run-time WARN for cross-field memcpy()")
> Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
> ---
> not sure about the fixes tag:
> compile error only occurs due to the fortify commit, but it looks like
> this change could have been part of the other commit identified in the
> message: lib/string move helper functions?

I think the Fixes tag is reasonable. Strictly speaking, it should likely
be whatever added the memcpy() in decompress.c, but that's mostly
nonsense, since nothing else had tripped yet. :)

The issue is that the memcpy() has a runtime length, so
CONFIG_FORTIFY_SOURCE was inserting the logic for a runtime warning,
which doesn't exist here. This is the correct fix (turning off FORTIFY
in the early boot loader).

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
