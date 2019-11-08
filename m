Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78E38F3D41
	for <lists+linux-mips@lfdr.de>; Fri,  8 Nov 2019 02:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbfKHBQJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 7 Nov 2019 20:16:09 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:46247 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfKHBQJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Nov 2019 20:16:09 -0500
Received: by mail-io1-f66.google.com with SMTP id c6so4472634ioo.13
        for <linux-mips@vger.kernel.org>; Thu, 07 Nov 2019 17:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2s8aKYlMchWkvO5nSejEGWqWohTEycz+sAPSFYJHNg8=;
        b=HNudlAbvQW4qv72g28+tlb9UjiMzFCt54a2hRiHYEa9UDlvJR8qo0QtsCixJbA1zQ+
         0SzoHfJ0wL4YEQFaukb3MXQ+7Rx6Y1cyy86Krlj/4xO115rdpzKJ17d72nqooMWWtn8N
         wCZnXlLPZUkfyKgJoRSlAgaYGj0C1fl6sQ6nvNJs0WAF8GY/lMfARK+PRdn36ydYKfjM
         iugRB4JWsNc5zCzQSl80er7oLE9VAqwSpEIEnkmlxq+XyZIzQ9JjTqXnHR1FQQwtShfs
         0PRsyMwFz7QmEiB+/JLQoiGs7FVTO/HLttm8wGclU9Yl7n5dW0Y1EBUDu6HfwI3O0tbs
         zPuw==
X-Gm-Message-State: APjAAAW0iGcbutrlOAPqBqR9DOGQRn11ItlEmvV2RhoQIemuubiWIT6G
        UkUfTElu0FE96vmbbkrAhUyh04DuUL8k/IcyGah5ghDb
X-Google-Smtp-Source: APXvYqyy7XBkqS//+U2ZTy1K9qdKgUnqVix8BGtiHYpJMGq3hvcu1qbpLtebbY0iyHMhBXZLsRgNJxXBPXmKh2xVIAE=
X-Received: by 2002:a02:c512:: with SMTP id s18mr7902220jam.92.1573175766557;
 Thu, 07 Nov 2019 17:16:06 -0800 (PST)
MIME-Version: 1.0
References: <1572847781-21652-1-git-send-email-chenhc@lemote.com> <6f6ce0de-bad9-d1c4-f8d6-244b11eef0b1@flygoat.com>
In-Reply-To: <6f6ce0de-bad9-d1c4-f8d6-244b11eef0b1@flygoat.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 8 Nov 2019 09:21:51 +0800
Message-ID: <CAAhV-H4eiwSOpK0qttOT-GiU1=tvrnWxfSPvH2e5umcogyAkaQ@mail.gmail.com>
Subject: Re: [PATCH V2] MIPS: Loongson: Add board_ebase_setup() support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Thu, Nov 7, 2019 at 7:47 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>
> 在 2019/11/4 下午2:09, Huacai Chen 写道:
> > Old processors before Loongson-3A2000 have a 32bit ebase register and
> > have no WG bit, new processors since Loongson-3A2000 have a 64bit ebase
> > register and do have the WG bit. Unfortunately, Loongson processors
> > which have the WG bit are slightly different from MIPS R2. This makes
> > the generic ebase setup not suitable for every scenarios.
> >
> > To make Loongson's kernel be more robust, we add a board_ebase_setup()
> > hook to ensure that CKSEG0 is always used for ebase. This is also useful
> > on platforms where BIOS doesn't initialise an appropriate ebase.
> >
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> This patch is essential as most Loongson boards with Tianocore based
> UEFI firmware didn't set their ebase correctly.
>
> Should we backport it to stable?
Yes, this patch should be backported as early as 4.9-lts.

Huacai
>
> --
> Jiaxun Yang
