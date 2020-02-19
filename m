Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71B43164E42
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 20:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgBSTBr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 14:01:47 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41210 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgBSTBr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 14:01:47 -0500
Received: by mail-pl1-f195.google.com with SMTP id t14so440235plr.8;
        Wed, 19 Feb 2020 11:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=3YzfCQRcQD6ngdzP7IG93afjeNl+4cFPgHI9G825Joo=;
        b=P0MY0U84GnzIV1VcbKhZUAyHpdJPbNU3S3F1WkQlmYe5AfDC6CY3+4uxEZfwGRt1k8
         thDnyXJ804KTiH9xaC0rU236/CR+mSDORIHC9w/Gz6x/YQXvSZmK/MDh6CWMNoLeZMo6
         fPAUdyvLiNkfbU1HxYrUzM4o5ZxfKQkgnv3OWIs8MTHydri//gj4PjNvi4R7yNrSmAht
         nRfWSfTz+1+hocs2ycNg0pQ4wtAKfmkp53uIha1vVfa0YQ2cP3lh/oiytIlxLdT+LCys
         YcfRoxDXcIpk5jZc3ci7PJe+M3MwJUKwdkFYzYo4ii9GeWFc2J26OZJeaSS3XnxIiHbM
         xrbA==
X-Gm-Message-State: APjAAAWhlIwowR6I5v+8mIJediKUvNGh2s92SI4Mth9n6lSluTErG5FP
        HEPl8GpxY1I5IwXlFSV55AosTBThcPRtVg==
X-Google-Smtp-Source: APXvYqyzSzC6vWyWsmo57MDXMhi5T+PtGOk+CIOdHnvtg9X9KHXiqA/WwkKbP0WgK7CR46T3d9OWBQ==
X-Received: by 2002:a17:902:d70a:: with SMTP id w10mr27779463ply.125.1582138905290;
        Wed, 19 Feb 2020 11:01:45 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id b24sm364650pfo.84.2020.02.19.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 11:01:44 -0800 (PST)
Message-ID: <5e4d8618.1c69fb81.7b7a.12f1@mx.google.com>
Date:   Wed, 19 Feb 2020 11:01:38 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>
CC:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: vdso: Wrap -mexplicit-relocs in cc-option
References:  <20200217211149.44132-1-natechancellor@gmail.com>
In-Reply-To:  <20200217211149.44132-1-natechancellor@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Nathan Chancellor wrote:
> Clang does not support this option and errors out:
> 
> clang-11: error: unknown argument: '-mexplicit-relocs'
> 
> Clang does not appear to need this flag like GCC does because the jalr
> check that was added in commit 976c23af3ee5 ("mips: vdso: add build
> time check that no 'jalr t9' calls left") passes just fine with
> 
> $ make ARCH=mips CC=clang CROSS_COMPILE=mipsel-linux-gnu- malta_defconfig arch/mips/vdso/
> 
> even before commit d3f703c4359f ("mips: vdso: fix 'jalr t9' crash in
> vdso code").
> 
> -mrelax-pic-calls has been supported since clang 9, which is the
> earliest version that could build a working MIPS kernel, and it is the
> default for clang so just leave it be.

Applied to mips-fixes.

> commit 72cf3b3df423
> https://git.kernel.org/mips/c/72cf3b3df423
> 
> Fixes: d3f703c4359f ("mips: vdso: fix 'jalr t9' crash in vdso code")
> Link: https://github.com/ClangBuiltLinux/linux/issues/890
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
