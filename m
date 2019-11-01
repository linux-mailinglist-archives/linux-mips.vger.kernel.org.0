Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D950ECBE4
	for <lists+linux-mips@lfdr.de>; Sat,  2 Nov 2019 00:27:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfKAX1y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Nov 2019 19:27:54 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33970 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKAX1y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Nov 2019 19:27:54 -0400
Received: by mail-pf1-f194.google.com with SMTP id x195so4556622pfd.1
        for <linux-mips@vger.kernel.org>; Fri, 01 Nov 2019 16:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=06oQR5SrM37qy3A4Fp0rhDuwDg2kkem19cyhrI1fnn8=;
        b=MmIOj8KZweQMEi1Djf9ZiqmmaspAOweCsYNV1ivrm005CSBVPPBx6CMMy2sC3bTrCT
         As532iKORS4sKJFiRtD901GlQ6Y6x2kIXVsz4eyAcDGdEDP5CxhUsSGlcov4uWoNMCCm
         DxAfIt5jz2VhUktl23xx84mMWD5eC27C/s8z6oAaT1ArzSWSvXduafvxPOTnlM4KuUcz
         ufOVyHerk89SWrxOvN/6G4gX9zTgz3g+aL7XZC35jQfqFpju4T6NInl+ZselP1lCnVvW
         +M+dQpo6SuJz3ZdD8ADhlLEtB72Yzvp74mQBjjr3xAcfF9u0A5J3DiFXx5HyFJ5dMYEn
         8YEA==
X-Gm-Message-State: APjAAAUW28voRF+5loNPf5sqw/FsGYHaVBTh3fkYtsBcuVqMFIKli+oM
        FFbgpC9FuVeZVilhnwDC1Xlk4zPcjdaC2g==
X-Google-Smtp-Source: APXvYqwcAUgejrq5XBntamc2ufG4FLCilwQ4sEWSvjYlrQ+G4ReMz0uhcxjCcKHLZAN6BWXb334Eow==
X-Received: by 2002:a63:fe0c:: with SMTP id p12mr16149712pgh.121.1572650872960;
        Fri, 01 Nov 2019 16:27:52 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:9d6:9cca:ff8c:efe0])
        by smtp.gmail.com with ESMTPSA id u21sm17261143pjx.2.2019.11.01.16.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 16:27:52 -0700 (PDT)
Message-ID: <5dbcbf78.1c69fb81.86ca8.e144@mx.google.com>
Date:   Fri, 01 Nov 2019 16:27:51 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org
CC:     chenhc@lemote.com, paul.burton@mips.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: Loongson64: Rename CPU TYPES
References:  <20191020144318.18341-2-jiaxun.yang@flygoat.com>
In-Reply-To:  <20191020144318.18341-2-jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Jiaxun Yang wrote:
> CPU_LOONGSON2 -> CPU_LOONGSON2EF
> CPU_LOONGSON3 -> CPU_LOONGSON64
> 
> As newer loongson-2 products (2G/2H/2K1000) can share kernel
> implementation with loongson-3 while 2E/2F are less similar with
> other LOONGSON64 products.

Applied to mips-next.

> commit 268a2d600130
> https://git.kernel.org/mips/c/268a2d600130
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
