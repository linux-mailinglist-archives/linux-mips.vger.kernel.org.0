Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78F9D600B88
	for <lists+linux-mips@lfdr.de>; Mon, 17 Oct 2022 11:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbiJQJsv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Oct 2022 05:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231583AbiJQJso (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Oct 2022 05:48:44 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7B95E543
        for <linux-mips@vger.kernel.org>; Mon, 17 Oct 2022 02:48:33 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id sc25so23550021ejc.12
        for <linux-mips@vger.kernel.org>; Mon, 17 Oct 2022 02:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4HFrvveXzqpkNkez1AzWAvAJPhALrxM7XDXtQr3uaZY=;
        b=EXRGCNQ1tcjPmb7IHK2PCgOo0DRuQg/FcUJV7vcIaWSyN7MkaXjtJjhS9PsoXNmqSj
         YcKQS7SX2LU0jb77RKofn/+GbNDB48NqyzDckxRuSJ07f5kLyenS55S5YgFRSGSD30rp
         QcT50U0F3fMPKYAfWyPgibSx4jVZpDWxyzKFkmUbAbGIiq4PIOlDhVqvoWqvrKc7C416
         u/P9jDu+JN3JXcUhkdBh8D/xEBvugxkYcF/Sl9Sxn0/+OYUjvumFNizct2TH0OQJodED
         LQrEgOkGEGIVJfsr+SltL72GwY4gFKX3Z4snTAXbVDTVyFDgysDPzRxFxq07sW5La5K9
         UUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HFrvveXzqpkNkez1AzWAvAJPhALrxM7XDXtQr3uaZY=;
        b=Uf2Zp8rOnesjHEb8MO8I/iYNyakfL1OMJcORT4ZlUet6j3CIVgarjr7bQZ7BiBJFlE
         hDydYChi05pfYqyg9QPLdFg8Cia3rzvUGfok/UpzNJrgD4GyhUtzY4rajG91YBilUfDW
         q4VuQxnFGTzrx8LEFY8KiV7LjCcdjsBu5qwtsXiqdYNSef200WNVUk9VoFRP8XQxNpUY
         2/91CenIhaY4JXkypRWa0OB18bAI9gdGPe3pcA6fedlHxTGGyV5gUvdaPVXuWdZi/CyK
         XqV0DWH9QvL3qQgOHz1WmsoXK4/05FlFPyBCXVN8C8wTiFO6AuR6SVy8cLx2eFtXlcN8
         oXcA==
X-Gm-Message-State: ACrzQf2Y3uVBR3GvtNaQpdQy184reGrfq+4Ji/XNEb7V2tOvoXyFwU8u
        x8/3Ywzr8dBsF3Rykf61iUR8HBCqdL6gKRhWn131lQ==
X-Google-Smtp-Source: AMsMyM7932k+DNt+hXRREzpz/84b7iLD9exBvNE2k/+CCpwBcE3JdCy6AKZZeMCiwAE/S5y+5jZYJc/KPdNjQMubv08=
X-Received: by 2002:a17:907:16aa:b0:6fe:91d5:18d2 with SMTP id
 hc42-20020a17090716aa00b006fe91d518d2mr4888626ejc.190.1666000111982; Mon, 17
 Oct 2022 02:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221016153548.3024209-1-lis8215@gmail.com>
In-Reply-To: <20221016153548.3024209-1-lis8215@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:48:20 +0200
Message-ID: <CACRpkdZrU_oQdc85qfr3RxVabFK_oP=3Jup__V1QN_YEHyFaaQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: Ingenic: JZ4755 bug fixes
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     stable@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Oct 16, 2022 at 5:36 PM Siarhei Volkau <lis8215@gmail.com> wrote:

> Fixes UART1 function bits and MMC groups typo.
>
> For pins 0x97,0x99 function 0 is designated to PWM3/PWM5
> respectively, function is 1 designated to the UART1.
>
> Diff from v1:
>  - sent separately
>  - added tag Fixes
>
> Fixes: b582b5a434d3 ("pinctrl: Ingenic: Add pinctrl driver for JZ4755.")
> Tested-by: Siarhei Volkau <lis8215@gmail.com>
> Signed-off-by: Siarhei Volkau <lis8215@gmail.com>

Applied this for fixes and tagged for stable.

Yours,
Linus Walleij
