Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384425E6378
	for <lists+linux-mips@lfdr.de>; Thu, 22 Sep 2022 15:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbiIVNTu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 22 Sep 2022 09:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbiIVNTs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Sep 2022 09:19:48 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A5A2B180
        for <linux-mips@vger.kernel.org>; Thu, 22 Sep 2022 06:19:45 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id 129so10233913vsi.10
        for <linux-mips@vger.kernel.org>; Thu, 22 Sep 2022 06:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5pmX8j7YSh9bdCilNcCRmRugMzjFGAq2N/WodhvvE34=;
        b=d7q6Fj4couljl5wXssNBkbaUGCUyghFu2dXsHFU2OOTRt5zuue8u5N9U2FUftsVOyK
         TTu+ThYjG+0yV8V4LYekuqj8L7HXz61lHudDG6T743gY1sAsHV7JoUC6yKzZV4mB3QCz
         8h4cwUYltZQy23klnS2u7NYboISG1zSUjRWVtYdxchHCBOwnbmt/9RU3Hm2c2cPuZSxf
         z8TtPKt8ZqAwVQLxmZS7W+faKLgzYkuIapyaLGrrrvqakqM5fLaxSCtq2mD+W8sIJ+D2
         sYQbctMJQkh06wXuCXOPFlGzKBK9P14jSvJuD+IrrPp2Xn3EUQyjlloCQcAWxZYMahh8
         kuNw==
X-Gm-Message-State: ACrzQf3CMopcmICAnkrrgslDQpBq+uLchryVL9/1NwejmdZWnBCDecn4
        Z5GOev1fYOTetC/vLpUpildp24bKv1vAIfTi+i0=
X-Google-Smtp-Source: AMsMyM6eE1sjjXWAVhzt1G+bDmZHlQmZrzJKKDtx8bxQPe7oHc1yjKLuhqQ3UTO/1KBfddm72spkuanIbwZobBGuBvo=
X-Received: by 2002:a67:b44b:0:b0:398:7e9c:21ba with SMTP id
 c11-20020a67b44b000000b003987e9c21bamr1109816vsm.83.1663852784626; Thu, 22
 Sep 2022 06:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220920130711.1107018-1-cuigaosheng1@huawei.com>
In-Reply-To: <20220920130711.1107018-1-cuigaosheng1@huawei.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Thu, 22 Sep 2022 15:19:33 +0200
Message-ID: <CAAdtpL5C9SHnUdX2yvzRjLec9TD2iRNSZfmjrh2sUoPPiMhzZg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Remove orphan declarations and comments
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 20, 2022 at 3:11 PM Gaosheng Cui <cuigaosheng1@huawei.com> wrote:
>
> This series contains a few cleanup patches, to remove unused
> declarations which have been removed and some useless comments. Thanks!
>
> Gaosheng Cui (2):
>   MIPS: remove orphan sb1250_time_init() declaration
>   MIPS: IRQ: remove orphan allocate_irqno() declaration

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
