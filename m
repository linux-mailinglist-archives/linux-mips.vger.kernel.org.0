Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A577AE8A7
	for <lists+linux-mips@lfdr.de>; Tue, 26 Sep 2023 11:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbjIZJL0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Sep 2023 05:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233738AbjIZJLZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Sep 2023 05:11:25 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F83E5
        for <linux-mips@vger.kernel.org>; Tue, 26 Sep 2023 02:11:18 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59be6bcf408so98702257b3.2
        for <linux-mips@vger.kernel.org>; Tue, 26 Sep 2023 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695719478; x=1696324278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0PDhPpQtKfenHFIZYPJauktelsKWg7AKOZgGNnjJU8=;
        b=lqBwYyuCXCIW2MjnLSK+xKCcG8xSX94XQLF48nYubLu2jgpn51zzGFlw8YrRevGrNs
         FO0vc6TjzPfdR5JZnAvqjzZadO98ccEQFrOsn3ONsKFUCGrBx/Q+p5hDRnZbnhCYAdX2
         3lyJ/LsFInMJ3EcMPYzYD99PT0Rt9rwDoLySqfhEPJiNvvybr+kwMCb39++lC7PacUFt
         M26lkazNfWeEZCVdRNjMkIqY+w3x4HoJrog3Qt3ClRRvcyyPy8VVlLUpWf6Cr2qpKQja
         lNmVzupBXEhxWbWO7sc4f8AXinuKzjBXoc4eZbsakXI9aiXbOyMURuJmiWC2lvYmFV4E
         rdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695719478; x=1696324278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0PDhPpQtKfenHFIZYPJauktelsKWg7AKOZgGNnjJU8=;
        b=v1dG3LPbjRsYiSULOePANMq2eo3M8CPEyQAUr7yg2oPqq5+V4+6S26KLCeJDwqz7Cs
         0GqP0VtV2d7k+JT5rIKWSBlhV44Q7ZERASP/YHzV0TM3TwwTam9va4MnTMpJSAD5p8gC
         tlGnZuvwdG7l1UelgRvAhYGCzD0lJufnY1zvnCcJZJpgb3MNV9MGOITV7dzeiA1OHLHZ
         c2mrxjT5f6ehRUd7Ah0MvQv7pRiLW3rwl4Q/E1GhQF1Q03bP843qNlHJUur8rMEg3dJc
         Xmr54t3WmAwRDiDf0Dqg8rbBR4fdUGJLrR4ph/ijFt9izdfDYDCenk0kjAfcW2H5U4pN
         Zt8w==
X-Gm-Message-State: AOJu0YxfBUFLaBpt+b+9QaELm8jcWJ7eIzbtQBKSSryNKmWdD5YiGn7t
        GtiMxyAtdiBcZ+3HHtMnVP33NRwHF/BWuPJUlc1dCg==
X-Google-Smtp-Source: AGHT+IEgKX3n5Olx0xH4y1czhKrXxa2Jqjj7SjkTTJVSRD2X5jBRYpc70wR8SkoYZ0fDx9gEksPsrC9fstLgwM+xMHA=
X-Received: by 2002:a0d:db4e:0:b0:59b:f18b:efa0 with SMTP id
 d75-20020a0ddb4e000000b0059bf18befa0mr7877471ywe.36.1695719478064; Tue, 26
 Sep 2023 02:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230926090623.35595-1-brgl@bgdev.pl>
In-Reply-To: <20230926090623.35595-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 11:11:06 +0200
Message-ID: <CACRpkdaVaqooxjgLqxzrVrMp088-FjdwFH7XnuWL2J=BqX_5HA@mail.gmail.com>
Subject: Re: [RFT PATCH] mtd: rawnand: ingenic: move the GPIO quirk to gpiolib-of.c
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 26, 2023 at 11:06=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a special place for OF polarity quirks in gpiolib-of.c. Let's
> move this over there so that it doesn't pollute the driver.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is nice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
