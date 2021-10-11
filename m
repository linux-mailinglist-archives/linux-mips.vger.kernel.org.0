Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8EB428867
	for <lists+linux-mips@lfdr.de>; Mon, 11 Oct 2021 10:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbhJKIPl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Oct 2021 04:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234809AbhJKIPk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Oct 2021 04:15:40 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DC0C061570
        for <linux-mips@vger.kernel.org>; Mon, 11 Oct 2021 01:13:41 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id d131so37097444ybd.5
        for <linux-mips@vger.kernel.org>; Mon, 11 Oct 2021 01:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+qyxK1U8f1ah2GI5g+Zi1pa0XG3ooDuESdmY2ovm1hQ=;
        b=LeZMMuQTTS4a9QrG5eyK07bSPAnLGjiZAuVeRywBHEJ6qRUsCA+/ftYiw7BxRz5c++
         BLbEnrF45g7baksChI5w0yxDsuFTQgz51ic3U5cLUdeOUplxO/NsS18l+RY/cOwl6H1Y
         SSRKi7eF6VElw/K2Ryxhr3EPSkbLBJ6ubxJVnaFu38PR+T3LqcOHS/C4LoeROx5gUq0k
         rAr2jAo5dPU61AS310N/PzPB4TDYKzou0TMSSCRP6h71yGVG1CRkxf/xjoVlJnAXJUy1
         0UuLCODcJUURnKn67SioUJ0ZKdMlVWTFOd6LjdG/RR/dzR5K0xCBrLICNJkCTXNW2OFp
         a0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+qyxK1U8f1ah2GI5g+Zi1pa0XG3ooDuESdmY2ovm1hQ=;
        b=jFwZsPvBi/F6oshfryw6mZrdGQ06PZprvuaUc0onFmMstPBbDFjfH14zbcQH/MUYDL
         Dj8osxVWR7d+n+Xj3C5J33fwyEt668HgU4MA9tpvC3wX7Se90CZ/1Fc2nElmAgQLk//b
         hhj6wN+CPjVls9ZOxWNumXuSfYIfNAdvGBYGwNw0UnOwh7tMOArEFzIp44cNmSSX6Dsy
         GANZcgkF8oFXt+DJjNRODNJJT9Tm0rAuy93L+oglrAib7ciiqd7ujab/TxsC24HXe2/m
         Z/a3Ol8edook8grutIdQR8cuBYv0AcuUxXBoPwBkW8OrDILVJLroFrPvkTVLt/8fHDlz
         71LQ==
X-Gm-Message-State: AOAM530fi1wvaU9l6cRPeqqmGEw8LYg0P+Gnw2bhKe5hJOLOHR+2Ugq8
        xOl7SRfU5LFEVgy/i/7wJq0iF70BX2vknpre8sMX5g==
X-Google-Smtp-Source: ABdhPJwCpzwyVDj1dBNwAjSmOdYHJGSSO2KQXsFpD/ovyZP9KQV+VD6gzjKtOzl08H77aoIGI2G1nWJ0mMJiMzNvpV0=
X-Received: by 2002:a05:6902:120e:: with SMTP id s14mr22180060ybu.161.1633940020434;
 Mon, 11 Oct 2021 01:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <1633915150-13220-1-git-send-email-yangtiezhu@loongson.cn> <1633915150-13220-3-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1633915150-13220-3-git-send-email-yangtiezhu@loongson.cn>
From:   Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date:   Mon, 11 Oct 2021 10:13:29 +0200
Message-ID: <CAM1=_QT+VNhTqH+urp155Hwkoax8O7Pqdv-fwGbFZkG8U2cnaw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf, mips: Fix comment on tail call count limiting
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 11, 2021 at 3:19 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> In emit_tail_call() of bpf_jit_comp32.c, "blez t2" (t2 <= 0) is
> not consistent with the comment "t2 < 0", update the comment to
> keep consistency.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

> ---
>  arch/mips/net/bpf_jit_comp32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
> index 9d7041a..bd996ed 100644
> --- a/arch/mips/net/bpf_jit_comp32.c
> +++ b/arch/mips/net/bpf_jit_comp32.c
> @@ -1315,7 +1315,7 @@ static int emit_tail_call(struct jit_context *ctx)
>         /* if (TCC-- <= 0) goto out */
>         emit(ctx, lw, t2, ctx->stack_size, MIPS_R_SP);  /* t2 = *(SP + size) */
>         emit_load_delay(ctx);                     /* Load delay slot         */
> -       emit(ctx, blez, t2, get_offset(ctx, 1));  /* PC += off(1) if t2 < 0  */
> +       emit(ctx, blez, t2, get_offset(ctx, 1));  /* PC += off(1) if t2 <= 0 */
>         emit(ctx, addiu, t2, t2, -1);             /* t2-- (delay slot)       */
>         emit(ctx, sw, t2, ctx->stack_size, MIPS_R_SP);  /* *(SP + size) = t2 */
>
> --
> 2.1.0
>
