Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F301BD6DCC
	for <lists+linux-mips@lfdr.de>; Tue, 15 Oct 2019 05:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbfJODbk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Oct 2019 23:31:40 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35570 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbfJODbk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Oct 2019 23:31:40 -0400
Received: by mail-io1-f67.google.com with SMTP id q10so42795031iop.2;
        Mon, 14 Oct 2019 20:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zhEjQGNeUYnva0C6Q5TMD839svsRDx2jkIkGQy4YWS4=;
        b=Q29zXeYiB8XHeZ1EqJMpyBXIhr7P1bR8RsUvqgKC0ZGwwOccYqrk29sfcD4ab3Yjgm
         II7djmY7O8yVxx0Cnj3N3j0anX0qJFH2o7lqsOFrvZ+AtuB51dg51ujml9xofT6yNvlM
         fGuaGlTNYoMlAwsy7lRt5Y1aOvNCYknmt68C95fiTpXoytGiJ/kQdELL0l6/oN0ONpBU
         q5l6h0D9RRNOld4kNz/c8PGGgUpWL/nrDsAOEuB1EJoSJKlwPv71FdFaTDbwHQafPosO
         JZIjIBvvvKR/YdUncmp+2+ID3urmvALLvIvbvULDJCvlNwWzw1JvHsCDFFr+4U89Sj5C
         nq5g==
X-Gm-Message-State: APjAAAUOyW+vgr9UGlmj/YCArZzV1d+zxRLkTZC4558Oft3mWiJkIsGB
        yjCyT7mtZ45uvAInodwr5eeQyHzbPeBvmBMiS8M=
X-Google-Smtp-Source: APXvYqx6Khf29rFvlzokKbjYXTWq9VNplO9R+e7oZ+ApgNX8SsNYz4bHuRktyfwncTAjBC/ILe8JSLAO9SkVFEvcWDs=
X-Received: by 2002:a5d:9c03:: with SMTP id 3mr11251986ioe.134.1571110298671;
 Mon, 14 Oct 2019 20:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <1571101656-871-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1571101656-871-1-git-send-email-yangtiezhu@loongson.cn>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Tue, 15 Oct 2019 11:36:59 +0800
Message-ID: <CAAhV-H573fv+NVqBRgU38BRDDX=syj3gUqnJqRp4CdBx+QcdpQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson: Make default kernel log buffer size as
 128KB for Loongson3
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 15, 2019 at 10:12 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> When I update kernel with loongson3_defconfig based on the Loongson 3A3000
> platform, then using dmesg command to show kernel ring buffer, the initial
> kernel messages have disappeared due to the log buffer is too small, it is
> better to change the default kernel log buffer size from 16KB to 128KB.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/configs/loongson3_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
> index 90ee008..3aa2201 100644
> --- a/arch/mips/configs/loongson3_defconfig
> +++ b/arch/mips/configs/loongson3_defconfig
> @@ -12,7 +12,7 @@ CONFIG_TASKSTATS=y
>  CONFIG_TASK_DELAY_ACCT=y
>  CONFIG_TASK_XACCT=y
>  CONFIG_TASK_IO_ACCOUNTING=y
> -CONFIG_LOG_BUF_SHIFT=14
> +CONFIG_LOG_BUF_SHIFT=17
Hi, Tiezhu,

Why you choose 128KB but not 64KB or 256KB? I found 64KB is enough for
our cases. And if you really need more, I think 256KB could be better
because there are many platforms choose 256KB.

Huacai

>  CONFIG_MEMCG=y
>  CONFIG_MEMCG_SWAP=y
>  CONFIG_BLK_CGROUP=y
> --
> 2.1.0
>
>
