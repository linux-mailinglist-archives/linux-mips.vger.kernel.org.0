Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38DAB600B7E
	for <lists+linux-mips@lfdr.de>; Mon, 17 Oct 2022 11:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbiJQJrf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Oct 2022 05:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbiJQJrU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Oct 2022 05:47:20 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6555E32A
        for <linux-mips@vger.kernel.org>; Mon, 17 Oct 2022 02:47:05 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j7so17606937wrr.3
        for <linux-mips@vger.kernel.org>; Mon, 17 Oct 2022 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m28MxXGYXT4qGN7nik464yL/UhJ82SzVaHoLGkQoTpw=;
        b=pSF9QYPlsSgNQPRR9XdOhQ9tHnI5i7mpZjMTTlvUq8/jBVi240La3CiktdZ9cpYnbg
         3gzgPCO57wDjxjV7KwmmBFQaXqWqjRqzXTrCgvh8wcmDIVE8Auov0FvGOGYsRXNhpQuR
         v0uxqa/yDBhbsp7XhTBM5WkFr41VnSeB1B2KgRUcNxVTYYngf4c2n+TJnNslKA3qbycQ
         3Mg/Pn05b14TDYhsHc6vl/ddFRe80qxr2PLv4DhzicBjcB9Y4NURWiXK++bV44Pf+VSK
         HuYAflUusNFJlXHC9YSfpGVok3c6YUgICIPANvYBQ/qXi+g9MokQq0B+0qEWWxPhKkC5
         GQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m28MxXGYXT4qGN7nik464yL/UhJ82SzVaHoLGkQoTpw=;
        b=C/WoY/+dcLbATzxi9//64vQQfFnhUPPLshajEZ8x88cl+dKVlnZLZE+4zze5i6dnUU
         +YdmBUlJDwldZeJPOqQNZK3EaNgRijFajGq+UERaoOlKlagajQbjedNGiV2DQprvj9D/
         AMiIaKEfvcFFl4A8Ee2LmohSL17l4DpFKl56+JXIheSyEC8wqkaLw5iTYQ1enojENZPE
         S0NwLRvkzA4EJLbenC3/E3QxQ7/OMM6YQjeA2SozQFT0aXO2jMJq5ncnAPU3B2XhTf3E
         cYc6eaSARI/KQtaC2Oj7odd3WfBsdWXWqpRFPEHrbpBxw7a4Zt1wMxZfUbA4nQstVoRx
         1m6A==
X-Gm-Message-State: ACrzQf2ZpkOu9wPhh/9+XeUjAVdLbwgL2lFQYcik9XSmvq+PqlnzLH+b
        v9lsR5XPQpvl3GpANyJD/JzczmXJIlanmeki2p4jeI9TT9o=
X-Google-Smtp-Source: AMsMyM4CGBR28SSkgO6sUfPaGHahhe5lagnYKp+a4Qpc5atANtQAtfZFWQQpanlTqBVMnG93twfz3+YjvG8BYu9pwjI=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr8038485ejt.526.1666000007686; Mon, 17
 Oct 2022 02:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221009181338.2896660-1-lis8215@gmail.com> <20221009181338.2896660-6-lis8215@gmail.com>
In-Reply-To: <20221009181338.2896660-6-lis8215@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:46:36 +0200
Message-ID: <CACRpkdZL9qWPaoRhCt3h8m1it9DaoS3TJrxPHVOzGZWhL45PNw@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: ingenic: JZ4755 minor bug fixes
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org
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

On Sun, Oct 9, 2022 at 8:14 PM Siarhei Volkau <lis8215@gmail.com> wrote:

> Fixes UART1 function bits and mmc groups typo.
>
> For pins 0x97,0x99 function 0 is designated to PWM3/PWM5
> respectively, function is 1 designated to the UART1.
>
> Tested-by: Siarhei Volkau <lis8215@gmail.com>
> Signed-off-by: Siarhei Volkau <lis8215@gmail.com>

This patch applied for fixes.

Yours,
Linus Walleij
