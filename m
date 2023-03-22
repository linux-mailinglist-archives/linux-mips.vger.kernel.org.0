Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25D56C5119
	for <lists+linux-mips@lfdr.de>; Wed, 22 Mar 2023 17:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjCVQrT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Mar 2023 12:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjCVQrQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Mar 2023 12:47:16 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BF964226
        for <linux-mips@vger.kernel.org>; Wed, 22 Mar 2023 09:47:15 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id h27so3506264vsa.1
        for <linux-mips@vger.kernel.org>; Wed, 22 Mar 2023 09:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679503635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ib6VfeXa68H/3MBI+KE+ZwchZA/KZsXvDAWGzf55Bc=;
        b=P5SORmGmujjl3O+PRMLtDezEMBh9Enj2y2OpO+le8+3Dy6UUfwDdVvZ4jQlYqf67GW
         +eSEpcm85Cuhl8NL7k22rbofJmeZzdZI8f4g2enylohcMsfAahGrkDMRlw8zIYLj6qTR
         LOBXLPj5I02mrVIKA6sM37S2QeBU52PbCLTB74T0icSUUdfAMoAVD+Md+eQBUKipZGsR
         XTPvHTezhQwf+yi4bF0PoqBab+07mzrkg+QAM6NjYvq1kTCbvTZWh3xV6/AobwgEfyxA
         i67ihK7KR0hGIJnizwwf+oIxfaYTS8zNXErEPJ41ZAWniLJAuJ9wxhJOhBwGUg0agG6x
         93KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679503635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ib6VfeXa68H/3MBI+KE+ZwchZA/KZsXvDAWGzf55Bc=;
        b=cg/6+M1G6jNch9TjfRStQUFNYBD5ae8ImUfROjDYJBZ5lIK+bIw/3vdJwox2hs6IS5
         ATLjprj1U/6dkv6k8EKltNtsRtECMeTfgU1SvwpfrBEyKmrLq+eRX+rPxoYFhTyTSRBY
         DImqQdsg8a96zHTs6xpQRCuC8il2cnHPE8QYZZ9RsELgohHM0BYLv8qP9tG1+gmm5frO
         jmwYTdN4MhOajIjwwCL8bj7OqNWDiBARoPqq9jmMSpMezvtsyWTtlvozwS/t3UmuKTsZ
         i81MduCzh3LlCt4bRrvDmVbHJ9ol1PMbO/DMwIIvn9Z6BsC6OHsArBMGK9/tns/7NWwp
         BBjA==
X-Gm-Message-State: AO0yUKXrvlfjlYZ3kCsY4LTbsSsQC3NV+UsAFHhEV3LCidAw3+cJaXYv
        GpS2JLpgBcYDZ8uCoS8JHkZQAudNUXQgQ8dnfMpJkQ==
X-Google-Smtp-Source: AK7set9fXX+H3LN7L7ST6XtAsF/I0m2AM8+pKlr7JkCCp/CNXLdab5JAFYd1YlqA9ddlJmcaSkzNMQzlTYjdu8CIzak=
X-Received: by 2002:a67:c38b:0:b0:411:b4c2:c6c0 with SMTP id
 s11-20020a67c38b000000b00411b4c2c6c0mr93240vsj.0.1679503634802; Wed, 22 Mar
 2023 09:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230315110650.142577-1-keguang.zhang@gmail.com> <20230315110650.142577-3-keguang.zhang@gmail.com>
In-Reply-To: <20230315110650.142577-3-keguang.zhang@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 22 Mar 2023 17:47:03 +0100
Message-ID: <CAMRc=McFvYk6uPqmsnES5Bt5vBSb2Af3-wSXY5-EeZ6ZGf3=sw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] gpio: loongson1: Introduce ls1x_gpio_chip struct
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 15, 2023 at 12:07=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail=
.com> wrote:
>
> This patch introduces and allocates ls1x_gpio_chip struct containing
> gpio_chip and reg_base to avoid global gpio_reg_base.
>
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> V2 -> V3: Restore the calling of __raw_readl() & __raw_writel()
> V1 -> V2: Split this change to a separate patch
> ---

Applied, thanks!

Bart
